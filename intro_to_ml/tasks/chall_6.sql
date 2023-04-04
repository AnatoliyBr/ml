SELECT ROW_NUMBER() OVER(ORDER BY SALARY) as num, REGION_NAME, SALARY
FROM ROSSTAT_SALARY_RU
WHERE REGION_NAME NOT IN ('Ставропольский край', 'Пензенская область', 'Кемеровская область', 'Алтайский край', 'Республика Мордовия')
ORDER BY SALARY;

SELECT *
FROM (SELECT ROW_NUMBER() OVER(ORDER BY SALARY) as num, REGION_NAME, SALARY
FROM ROSSTAT_SALARY_RU
WHERE REGION_NAME NOT IN ('Ставропольский край', 'Пензенская область', 'Кемеровская область', 'Алтайский край', 'Республика Мордовия')
ORDER BY SALARY)
WHERE num IN (30, 37, 60);

SELECT ROUND(AVG(SALARY),2) as avg, ROUND(MEDIAN(SALARY),2) as median
FROM ROSSTAT_SALARY_RU
WHERE REGION_NAME NOT IN ('Ставропольский край', 'Пензенская область', 'Кемеровская область', 'Алтайский край', 'Республика Мордовия');