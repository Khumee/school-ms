const fs = require('fs');

const filePath = 'views/student_view.ejs';
let content = fs.readFileSync(filePath, 'utf-8');

// Insert tab buttons right before `<div class="form-grid"`
const tabButtons = `
<div class="tabs-container" style="margin-bottom: 1.5rem; border-bottom: 1px solid #e2e8f0; display: flex; gap: 1rem;">
    <button class="tab-btn active" onclick="switchTab('overview')" id="tab-overview" style="padding: 0.5rem 1rem; border: none; background: transparent; cursor: pointer; border-bottom: 2px solid var(--primary-color); font-weight: 600; color: var(--primary-color);">Overview</button>
    <button class="tab-btn" onclick="switchTab('fees')" id="tab-fees" style="padding: 0.5rem 1rem; border: none; background: transparent; cursor: pointer; border-bottom: 2px solid transparent; font-weight: 500; color: #64748b;">Fee History</button>
    <button class="tab-btn" onclick="switchTab('documents')" id="tab-documents" style="padding: 0.5rem 1rem; border: none; background: transparent; cursor: pointer; border-bottom: 2px solid transparent; font-weight: 500; color: #64748b;">Documents & Photo</button>
</div>

<div id="content-overview" class="tab-content">
`;

// Insert end of overview div and start of fees div right before `<div class="section-header">` (Fee Payment History)
const feeSectionStart = `
</div>
<div id="content-fees" class="tab-content" style="display: none;">
`;

// Insert the Documents tab content at the end, right before `<!-- Payment Modal -->`
const documentsContent = `
</div>
<div id="content-documents" class="tab-content" style="display: none;">
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1rem;">
        <h2 class="section-title" style="margin: 0;"><i class="bi bi-folder2-open"></i> Student Documents</h2>
        <button class="btn-primary" onclick="document.getElementById('documentModal').style.display='block'; document.getElementById('modalOverlay').style.display='block';"><i class="bi bi-upload"></i> Upload Document</button>
    </div>
    
    <div class="card" style="margin-bottom: 2rem;">
        <h3 style="margin-bottom: 1rem; color: var(--primary-color);"><i class="bi bi-camera"></i> Student Photo</h3>
        <div style="display: flex; gap: 1rem; align-items: flex-start;">
            <div style="width: 120px; height: 120px; border-radius: 8px; overflow: hidden; border: 1px solid #cbd5e1; flex-shrink: 0;">
                <% if (student.photo_url) { %>
                    <img src="<%= student.photo_url %>" alt="Student Photo" style="width: 100%; height: 100%; object-fit: cover;">
                <% } else { %>
                    <div style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: center; background-color: #f1f5f9; color: #94a3b8;">
                        <i class="bi bi-person-fill" style="font-size: 3rem;"></i>
                    </div>
                <% } %>
            </div>
            <div>
                <form action="/students/update-photo" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="student_id" value="<%= student.id %>">
                    <div class="form-group" style="margin-bottom: 0.5rem;">
                        <input type="file" name="photo" accept="image/*" class="form-control" required>
                    </div>
                    <button type="submit" class="btn-secondary"><i class="bi bi-arrow-up-circle"></i> <%= student.photo_url ? 'Update Photo' : 'Upload Photo' %></button>
                </form>
            </div>
        </div>
    </div>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th style="width: 60px;">Preview</th>
                    <th>Document Type</th>
                    <th>Description</th>
                    <th>Date Uploaded</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% if (typeof documents !== 'undefined' && documents.length > 0) { %>
                    <% documents.forEach(doc => { %>
                        <tr>
                            <td>
                                <% if (doc.file_path.match(/\\.(jpeg|jpg|gif|png)$/i)) { %>
                                    <a href="<%= doc.file_path %>" target="_blank"><img src="<%= doc.file_path %>" style="width: 40px; height: 40px; object-fit: cover; border-radius: 4px; border: 1px solid #e2e8f0;"></a>
                                <% } else { %>
                                    <div style="width: 40px; height: 40px; border-radius: 4px; background-color: #f1f5f9; display: flex; align-items: center; justify-content: center; color: #64748b; font-size: 1.2rem;">
                                        <i class="bi bi-file-earmark-text"></i>
                                    </div>
                                <% } %>
                            </td>
                            <td style="font-weight: 600;"><%= doc.document_type %></td>
                            <td><%= doc.description || '-' %></td>
                            <td><%= new Date(doc.uploaded_at).toLocaleDateString() %></td>
                            <td>
                                <div style="display: flex; gap: 0.5rem;">
                                    <a href="<%= doc.file_path %>" target="_blank" class="btn-secondary nav-btn"><i class="bi bi-eye"></i> View</a>
                                    <form action="/students/delete-document" method="POST" style="margin:0;" onsubmit="return confirm('Delete this document?');">
                                        <input type="hidden" name="document_id" value="<%= doc.id %>">
                                        <input type="hidden" name="student_id" value="<%= student.id %>">
                                        <button type="submit" class="btn-secondary nav-btn" style="color: #dc2626; border-color: #fca5a5;"><i class="bi bi-trash"></i> Delete</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    <% }) %>
                <% } else { %>
                    <tr>
                        <td colspan="5" style="text-align: center; color: #64748b;">No documents uploaded yet.</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Document Upload Modal -->
<div id="documentModal" class="card" style="display: none; max-width: 500px; margin: 1rem auto; position: fixed; top: 15%; left: 50%; transform: translate(-50%, 0); z-index: 1000; box-shadow: 0 10px 25px rgba(0,0,0,0.2); box-sizing: border-box; width: 90%;">
    <h3 style="margin-bottom: 1rem;">Upload Document</h3>
    <form action="/students/upload-document" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="student_id" value="<%= student.id %>">
        <input type="hidden" name="student_name" value="<%= student.name.replace(/\\s+/g, '-') %>">
        
        <div class="form-group" style="margin-bottom: 1.25rem;">
            <label for="docType">Document Type</label>
            <select name="document_type" id="docType" class="form-control" required>
                <option value="B-Form">Student B-Form</option>
                <option value="Parent CNIC">Parent CNIC</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <div class="form-group" style="margin-bottom: 1.25rem;">
            <label for="docDesc">Description (Optional)</label>
            <input type="text" name="description" id="docDesc" class="form-control" placeholder="E.g., Father's ID Card Front">
        </div>

        <div class="form-group" style="margin-bottom: 1.25rem;">
            <label for="docFile">File</label>
            <input type="file" name="document_file" id="docFile" class="form-control" required onchange="previewThumbnail(this)">
        </div>

        <div id="docPreviewContainer" style="display: none; margin-bottom: 1.25rem; text-align: center;">
            <img id="docPreviewImg" src="" alt="Preview" style="max-width: 100%; max-height: 200px; border-radius: 4px; border: 1px solid #cbd5e1;">
        </div>
        
        <div style="display: flex; gap: 0.5rem; justify-content: flex-end;">
            <button type="button" class="btn-secondary" onclick="document.getElementById('documentModal').style.display='none'; document.getElementById('modalOverlay').style.display='none';">Cancel</button>
            <button type="submit" class="btn-primary"><i class="bi bi-upload"></i> Upload</button>
        </div>
    </form>
</div>
`;

// Insert the JS function at the end right before </script> or <%- include('partials/footer') %>
const jsScript = `
    function switchTab(tab) {
        document.querySelectorAll('.tab-content').forEach(el => el.style.display = 'none');
        document.querySelectorAll('.tab-btn').forEach(el => {
            el.classList.remove('active');
            el.style.borderBottomColor = 'transparent';
            el.style.color = '#64748b';
        });

        document.getElementById('content-' + tab).style.display = 'block';
        const activeBtn = document.getElementById('tab-' + tab);
        activeBtn.classList.add('active');
        activeBtn.style.borderBottomColor = 'var(--primary-color)';
        activeBtn.style.color = 'var(--primary-color)';
        
        // Update URL query string without reload
        const url = new URL(window.location);
        url.searchParams.set('tab', tab);
        window.history.pushState({}, '', url);
    }

    // Read tab from query string on load
    window.addEventListener('DOMContentLoaded', () => {
        const urlParams = new URLSearchParams(window.location.search);
        const tab = urlParams.get('tab');
        if (tab && ['overview', 'fees', 'documents'].includes(tab)) {
            switchTab(tab);
        }
    });

    function previewThumbnail(input) {
        const container = document.getElementById('docPreviewContainer');
        const img = document.getElementById('docPreviewImg');
        
        if (input.files && input.files[0]) {
            const file = input.files[0];
            if (file.type.startsWith('image/')) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    img.src = e.target.result;
                    container.style.display = 'block';
                }
                reader.readAsDataURL(file);
            } else {
                container.style.display = 'none';
            }
        } else {
            container.style.display = 'none';
        }
    }
`;

// Apply patches
content = content.replace('<div class="form-grid"', tabButtons + '<div class="form-grid"');
content = content.replace('<div class="section-header">\\r\\n    <h2 class="section-title"><i class="bi bi-clock-history"></i> Fee Payment History</h2>', feeSectionStart + '\\n<div class="section-header">\\r\\n    <h2 class="section-title"><i class="bi bi-clock-history"></i> Fee Payment History</h2>');
content = content.replace('<!-- Payment Modal -->', documentsContent + '\\n<!-- Payment Modal -->');
content = content.replace('<%- include(\\\'partials/footer\\\') %>', jsScript + '\\n<%- include(\\\'partials/footer\\\') %>');

fs.writeFileSync(filePath, content);
console.log('Successfully patched student_view.ejs');
