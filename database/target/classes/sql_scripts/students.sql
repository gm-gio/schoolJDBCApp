WITH first_names AS (
    SELECT unnest(ARRAY ['John', 'Jane', 'Michael', 'Emily', 'David', 'Emma', 'Christopher', 'Olivia', 'Andrew',
                  'Sophia', 'Daniel', 'Mia', 'Ethan', 'Isabella', 'Matthew', 'Ava', 'Alexander', 'Grace',
                  'James', 'Lily']) AS first_name
),
     last_names AS (
         SELECT unnest(ARRAY ['Smith', 'Johnson', 'Williams', 'Jones', 'Brown', 'Davis', 'Miller', 'Wilson', 'Moore',
                       'Taylor', 'Anderson', 'Thomas', 'Jackson', 'White', 'Harris', 'Martin', 'Thompson', 'Garcia',
                       'Martinez', 'Jones']) AS last_name
     )
INSERT INTO school_console_app.students (group_id, first_name, last_name)
SELECT
    ROUND(RANDOM() * 9) + 1 AS group_id,
    (SELECT first_name FROM first_names ORDER BY RANDOM() LIMIT 1 OFFSET ROUND(RANDOM() * 19)),
    (SELECT last_name FROM last_names ORDER BY RANDOM() LIMIT 1 OFFSET ROUND(RANDOM() * 19))
FROM generate_series(1, 200)
WHERE NOT EXISTS (
    SELECT 1
    FROM (
    SELECT DISTINCT ON (group_id) *
    FROM school_console_app.students
    ) s
    WHERE s.group_id = ROUND(RANDOM() * 9) + 1
    );
