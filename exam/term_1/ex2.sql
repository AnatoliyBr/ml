SELECT MUSEUM_NAME FROM museum WHERE museum_id = (SELECT DISTINCT museum_id FROM hall WHERE HALL_ID IN (SELECT DISTINCT hall_id FROM exhibit WHERE AUTHOR = 'Михаил Перхин'));

SELECT COUNT(*) FROM exhibit WHERE AUTHOR = 'Михаил Перхин';