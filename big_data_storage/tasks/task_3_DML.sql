SELECT COUNT(DISTINCT id_stop) FROM stops
WHERE latitude >= 59.965 AND latitude <= 60.03 AND longitude >= 30.276 AND longitude <= 30.352

SELECT DISTINCT route_number FROM track
WHERE id_vehicle = (SELECT id_vehicle FROM vehicle WHERE vehicle_name = 'АВТОБУС') AND carrier_board_num = 3606

SELECT COUNT(DISTINCT carrier_board_num) FROM track
WHERE id_vehicle = (SELECT id_vehicle FROM vehicle WHERE vehicle_name = 'АВТОБУС') AND route_number = 10

SELECT MAX(distance_back) FROM route_by_stops
WHERE id_vehicle = (SELECT id_vehicle FROM vehicle WHERE vehicle_name = 'АВТОБУС') AND route_number = 191

SELECT SUM(distance_back) FROM route_by_stops
WHERE id_vehicle = (SELECT id_vehicle FROM vehicle WHERE vehicle_name = 'АВТОБУС')
AND route_number = 49
AND id_direction = (SELECT id_direction FROM direction WHERE direction_type = 'ПРЯМОЕ')
AND stop_number > 4 AND stop_number < 17

SELECT longitude, latitude FROM stops
WHERE id_stop = (SELECT id_stop FROM route_by_stops
WHERE id_vehicle = (SELECT id_vehicle FROM vehicle WHERE vehicle_name = 'АВТОБУС')
AND id_direction = (SELECT id_direction FROM direction WHERE direction_type = 'ОБРАТНОЕ')
AND stop_number = 9 AND route_number = 191)

SELECT route_number FROM route_by_stops
WHERE id_vehicle = (SELECT id_vehicle FROM vehicle WHERE vehicle_name = 'АВТОБУС')
AND id_direction = (SELECT id_direction FROM direction WHERE direction_type = 'ПРЯМОЕ')
GROUP BY route_number
HAVING SUM(distance_back) BETWEEN 10550 AND 13780
