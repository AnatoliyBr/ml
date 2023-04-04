SELECT GetNumber(5, 5) FROM dual

SELECT to_char(stop_time_real, 'dd/mm/yyyy hh24:mi') FROM track WHERE id_vehicle = (SELECT id_vehicle FROM vehicle WHERE vehicle_name = 'АВТОБУС')
AND id_stop = 2692
AND stop_time_real BETWEEN to_date('9/09/2019 7:00', 'dd/mm/yyyy hh24:mi') AND to_date('9/09/2019 7:59', 'dd/mm/yyyy hh24:mi')

SELECT COUNT(DISTINCT carrier_board_num) FROM track WHERE id_vehicle = (SELECT id_vehicle FROM vehicle WHERE vehicle_name = 'АВТОБУС')
AND route_number = 1
AND stop_time_real BETWEEN to_date('9/09/2019 12:00', 'dd/mm/yyyy hh24:mi') AND to_date('9/09/2019 12:59', 'dd/mm/yyyy hh24:mi')