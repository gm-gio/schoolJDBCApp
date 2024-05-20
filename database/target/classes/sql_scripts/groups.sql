DO $$
BEGIN
INSERT INTO school_console_app.groups (group_id, group_name)
VALUES
    (1, 'A-01'),
    (2, 'B-02'),
    (3, 'C-03'),
    (4, 'D-04'),
    (5, 'E-05'),
    (6, 'F-06'),
    (7, 'G-07'),
    (8, 'H-08'),
    (9, 'I-09'),
    (10, 'J-10')
    ON CONFLICT (group_id) DO NOTHING;
END $$;
