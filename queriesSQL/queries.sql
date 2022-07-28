SELECT COUNT(e."endDate") AS currentExperiences
FROM experiences e
WHERE e."endDate" IS NOT NULL;

====================================================================

SELECT e."userId" AS id, COUNT(DISTINCT e."courseId") AS educations
FROM educations e
WHERE e.status ILIKE '%finished%'
GROUP BY e."userId"
ORDER BY educations DESC;

====================================================================

SELECT u.name AS writer, COUNT(t.id) AS testimonialCount
FROM testimonials t
JOIN users u
ON u.id = t."writerId"
WHERE u.id = 435
GROUP BY u.id;

====================================================================

SELECT MAX(j.salary) AS maximumSalary, r.name AS roles
FROM roles r
JOIN jobs j
ON r.id = j."roleId"
WHERE j.active = true
GROUP BY roles
ORDER BY maximumSalary;

====================================================================

SELECT s.name AS school, c.name AS course, COUNT(e."userId") AS studentsCount
FROM educations e
JOIN schools s
ON s.id = e."schoolId"
JOIN users u
ON u.id = e."userId"
JOIN courses c
ON c.id = e."courseId"
WHERE (e.status ILIKE '%ongoing%' OR e.status ILIKE '%finished%')
GROUP BY school, course
ORDER BY studentsCount DESC;
