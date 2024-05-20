DO $$
BEGIN
INSERT INTO school_console_app.courses (course_id, course_name, course_description)
VALUES
    (1, 'Math', 'Mathematics course'),
    (2, 'Biology', 'Biology course'),
    (3, 'Physics', 'Physics course'),
    (4, 'Chemistry', 'Chemistry course'),
    (5, 'Computer Science', 'Computer Science course'),
    (6, 'Literature', 'Literature course'),
    (7, 'Art', 'Art course'),
    (8, 'Music', 'Music course'),
    (9, 'Economics', 'Economics course'),
    (10, 'History', 'History course')
    ON CONFLICT (course_id) DO NOTHING;
END $$;
