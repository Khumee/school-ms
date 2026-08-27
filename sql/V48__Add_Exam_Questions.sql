CREATE TABLE IF NOT EXISTS exam_questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    exam_paper_id INT NOT NULL,
    question_text TEXT,
    marks INT NOT NULL DEFAULT 0,
    tenant_id INT NOT NULL,
    FOREIGN KEY (exam_paper_id) REFERENCES exam_papers(id) ON DELETE CASCADE,
    FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS exam_question_marks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    exam_paper_id INT NOT NULL,
    question_id INT NOT NULL,
    student_id INT NOT NULL,
    obtained_marks DECIMAL(5,2) DEFAULT 0,
    tenant_id INT NOT NULL,
    FOREIGN KEY (exam_paper_id) REFERENCES exam_papers(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES exam_questions(id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE CASCADE,
    UNIQUE KEY unique_student_question (tenant_id, student_id, question_id)
);
