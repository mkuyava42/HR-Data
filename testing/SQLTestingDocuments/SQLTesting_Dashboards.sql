-- ==========================================
-- HR ANALYTICS SQL QUERIES
-- ==========================================

-- 1. KPI: Employee Count
SELECT 
    SUM(employee_count) AS employee_count 
FROM 
    hrdata;
    
-- 2. KPI: Attrition Count
SELECT 
    COUNT(attrition) AS attrition_count 
FROM 
    hrdata 
WHERE 
    attrition = 'Yes';
    
-- 3. KPI: Attrition Rate (%)
SELECT 
    ROUND(
        (
            CAST(
                (SELECT COUNT(attrition) FROM hrdata WHERE attrition = 'Yes') AS NUMERIC
            ) / SUM(employee_count)
        ) * 100, 
        2
    ) AS attrition_rate_pct 
FROM 
    hrdata;
    
-- 4. KPI: Active Employees
SELECT 
    SUM(employee_count) - (
        SELECT COUNT(attrition) 
        FROM hrdata 
        WHERE attrition = 'Yes'
    ) AS active_employees 
FROM 
    hrdata;
    
-- 5. KPI: Average Employee Age
SELECT 
    ROUND(AVG(age), 0) AS avg_age 
FROM 
    hrdata;
    
-- 6. Attrition by Gender
SELECT 
    gender, 
    COUNT(attrition) AS attrition_count 
FROM 
    hrdata 
WHERE 
    attrition = 'Yes' 
GROUP BY 
    gender 
ORDER BY 
    attrition_count DESC;
    
-- 7. Attrition by Department
SELECT 
    department, 
    COUNT(attrition) AS attrition_count, 
    ROUND(
        (
            CAST(COUNT(attrition) AS NUMERIC) / 
            (SELECT COUNT(attrition) FROM hrdata WHERE attrition = 'Yes')
        ) * 100, 
        2
    ) AS pct 
FROM 
    hrdata 
WHERE 
    attrition = 'Yes' 
GROUP BY 
    department 
ORDER BY 
    attrition_count DESC;
    
-- 8. Employees by Age Group
SELECT 
    age_band, 
    gender, 
    SUM(employee_count) AS total_employees 
FROM 
    hrdata 
GROUP BY 
    age_band, 
    gender 
ORDER BY 
    age_band, 
    gender DESC;

-- 9. Attrition by Education Field 
SELECT 
    education_field, 
    COUNT(attrition) AS attrition_count 
FROM 
    hrdata 
WHERE 
    attrition = 'Yes' 
GROUP BY 
    education_field 
ORDER BY 
    attrition_count DESC;
    
-- 10. Attrition by Gender & Age Group
SELECT 
    age_band, 
    gender, 
    COUNT(attrition) AS attrition_count, 
    ROUND(
        (
            CAST(COUNT(attrition) AS NUMERIC) / 
            (SELECT COUNT(attrition) FROM hrdata WHERE attrition = 'Yes')
        ) * 100, 
        2
    ) AS pct 
FROM 
    hrdata 
WHERE 
    attrition = 'Yes' 
GROUP BY 
    age_band, 
    gender 
ORDER BY 
    age_band DESC;
    
-- 11. Job Satisfaction Pivot
SELECT 
    job_role,
    SUM(employee_count) FILTER (WHERE job_satisfaction = 1) AS one,
    SUM(employee_count) FILTER (WHERE job_satisfaction = 2) AS two,
    SUM(employee_count) FILTER (WHERE job_satisfaction = 3) AS three,
    SUM(employee_count) FILTER (WHERE job_satisfaction = 4) AS four
FROM 
    hrdata
GROUP BY 
    job_role
ORDER BY 
    job_role;