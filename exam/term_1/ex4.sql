SELECT COUNT(DISTINCT visitor_id) FROM visitor_schedule WHERE schedule_id IN (SELECT schedule_id FROM schedule WHERE EXCURSION_ID = (SELECT EXCURSION_ID FROM excursion WHERE EXCURSION_NAME = 'Константин Романов - поэт (К.Р): жизнь и судьба') AND (STARTS_ON > to_date('01/02/2023', 'dd/mm/yyyy') AND STARTS_ON < to_date('01/03/2023', 'dd/mm/yyyy')))