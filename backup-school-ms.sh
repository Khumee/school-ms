#!/bin/bash
#
# school-ms backup: dumps the sms/mms/nukrim MySQL databases + syncs
# public/uploads to Google Drive via rclone. Run via cron.

set -uo pipefail

# ---- config ----
APP_DIR="/var/www/school-ms"
UPLOADS_DIR="$APP_DIR/public/uploads"
BACKUP_ROOT="/root/backups/school-ms"
SQL_BACKUP_DIR="$BACKUP_ROOT/sql"
MYSQL_DEFAULTS="/root/.my.cnf"
LOG_FILE="/var/log/school-ms-backup.log"
LOCK_FILE="/var/lock/school-ms-backup.lock"
RCLONE_REMOTE="gdrive"
RCLONE_BASE="school-ms-backups"
LOCAL_RETENTION_DAYS=7

# only these databases are backed up -- this VPS hosts other unrelated
# projects (hms, kui, mtech, phpmyadmin, sb, vcarpool) that are out of scope
DATABASES="sms mms nukrim"

DATE_STAMP="$(date +%F_%H-%M-%S)"
TODAY_DIR="$SQL_BACKUP_DIR/$DATE_STAMP"
FAILURES=0

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" >> "$LOG_FILE"
}

# ---- prevent overlapping runs ----
exec 200>"$LOCK_FILE"
if ! flock -n 200; then
    log "Another backup run is already in progress. Exiting."
    exit 1
fi

log "===== Backup started ====="

# ---- 1. dump the configured databases ----
mkdir -p "$TODAY_DIR"

for db in $DATABASES; do
    SQL_FILE="$TODAY_DIR/${db}.sql"
    ZIP_FILE="$TODAY_DIR/${db}.sql.zip"
    if mysqldump --defaults-file="$MYSQL_DEFAULTS" \
        --single-transaction --quick --routines --triggers --events \
        --no-tablespaces --skip-no-data --skip-no-create-info "$db" > "$SQL_FILE"; then
        if zip -jq "$ZIP_FILE" "$SQL_FILE"; then
            rm -f "$SQL_FILE"
            SIZE=$(du -h "$ZIP_FILE" | cut -f1)
            log "OK: dumped $db -> $ZIP_FILE ($SIZE)"
        else
            log "ERROR: zip failed for database '$db', keeping raw .sql"
            FAILURES=$((FAILURES + 1))
        fi
    else
        log "ERROR: mysqldump failed for database '$db'"
        rm -f "$SQL_FILE"
        FAILURES=$((FAILURES + 1))
    fi
done

# ---- 2. push today's dumps to Google Drive ----
if rclone copy "$TODAY_DIR" "$RCLONE_REMOTE:$RCLONE_BASE/sql/$DATE_STAMP" \
    --log-file="$LOG_FILE" --log-level NOTICE; then
    log "OK: uploaded SQL dumps to $RCLONE_REMOTE:$RCLONE_BASE/sql/$DATE_STAMP"
else
    log "ERROR: rclone copy of SQL dumps failed"
    FAILURES=$((FAILURES + 1))
fi

# ---- 3. push student photos/docs + support screenshots to Google Drive ----
# 'copy' (not 'sync') on purpose: deletions on the server must never
# delete the backup copy on Drive.
if [ -d "$UPLOADS_DIR" ]; then
    if rclone copy "$UPLOADS_DIR" "$RCLONE_REMOTE:$RCLONE_BASE/uploads" \
        --transfers 16 --checkers 32 \
        --log-file="$LOG_FILE" --log-level NOTICE; then
        log "OK: uploads synced to $RCLONE_REMOTE:$RCLONE_BASE/uploads"
    else
        log "ERROR: rclone copy of uploads failed"
        FAILURES=$((FAILURES + 1))
    fi
else
    log "WARNING: uploads dir $UPLOADS_DIR not found, skipping"
fi

# ---- 4. prune local SQL dumps older than N days (Drive keeps full history) ----
find "$SQL_BACKUP_DIR" -mindepth 1 -maxdepth 1 -type d -mtime "+$LOCAL_RETENTION_DAYS" -print -exec rm -rf {} \; >> "$LOG_FILE" 2>&1

if [ "$FAILURES" -eq 0 ]; then
    log "===== Backup finished OK ====="
else
    log "===== Backup finished with $FAILURES error(s) ====="
fi

exit "$FAILURES"
