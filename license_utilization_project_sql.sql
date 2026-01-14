-- Which staff have licenses assigned?
SELECT
    s.staff_id,
    s.role,
    la.license_id,
    sl.software_name
FROM license_assignments la
JOIN staff s
    ON la.staff_id = s.staff_id
JOIN software_licenses sl
    ON la.license_id = sl.license_id;

-- Which licenses are not being used?
SELECT
	s.staff_id,
    s.role,
    sl.software_name,
    SUM(su.login_count_30_days) AS total_usage
FROM license_assignments la
JOIN staff s
	ON la.staff_id = s.staff_id
JOIN software_licenses sl
	ON la.license_id = sl.license_id
LEFT JOIN software_usage su
	ON la.assignment_id = su.assignment_id
GROUP BY
	s.staff_id,
    s.role,
    sl.software_name
HAVING total_usage = 0
	OR total_usage IS NULL
ORDER BY total_usage ASC;

-- Which staff members have licenses assigned?
SELECT 
	s.staff_id,
	s.role,
    s.school_id
FROM staff s 
LEFT JOIN license_assignments la
	ON s.staff_id = la.staff_id
WHERE la.assignment_id IS NULL
ORDER BY s.school_id, s.role;

-- Usage by role
SELECT
    s.role,
    sl.software_name,
    SUM(su.login_count_30_days) AS total_usage
FROM license_assignments la
JOIN staff s
    ON la.staff_id = s.staff_id
JOIN software_licenses sl
    ON la.license_id = sl.license_id
LEFT JOIN software_usage su
    ON la.assignment_id = su.assignment_id
GROUP BY
    s.role,
    sl.software_name
ORDER BY
    s.role,
    total_usage DESC;


-- Usage by school
SELECT
    s.school_id,
    sc.school_type,
    sl.software_name,
    SUM(su.login_count_30_days) AS total_usage
FROM license_assignments la
JOIN staff s
    ON la.staff_id = s.staff_id
JOIN software_licenses sl
    ON la.license_id = sl.license_id
LEFT JOIN software_usage su
    ON la.assignment_id = su.assignment_id
JOIN schools sc
	ON s.school_id = sc.school_id
GROUP BY
    s.school_id,
    sl.software_name
ORDER BY
    total_usage DESC;


