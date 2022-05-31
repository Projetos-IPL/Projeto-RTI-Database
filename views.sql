DROP VIEW IF EXISTS entrance_logs_person_view;
CREATE VIEW entrance_logs_person_view AS
SELECT el.entrance_log_id,
       el.rfid,
       (CASE
           WHEN p.person_id IS NULL THEN 'Desconhecido'
            ELSE CONCAT_WS(' ', p.first_name, p.last_name)
        END) "person_name",
       el.timestamp,
       el.access
FROM entrance_logs el
    LEFT JOIN person p
ON el.rfid  = p.rfid;

DROP VIEW IF EXISTS general_stats_view;
CREATE VIEW general_stats_view AS
SELECT (SELECT COUNT(1) FROM person) "people_count",
       (SELECT COUNT(1) FROM entrance_logs WHERE access = 1) "successful_entrance_logs",
       (SELECT COUNT(1) FROM entrance_logs WHERE access = 0) "unsuccessful_entrance_logs",
       (SELECT COUNT(1) FROM sensor_logs) "sensor_log_count",
       (SELECT COUNT(1) FROM actuator_logs) "actuator_log_count",
       (SELECT COUNT(1) FROM permission) "permission_count"
FROM dual;

DROP VIEW IF EXISTS sensor_log_sensor_view;
CREATE VIEW sensor_log_sensor_view AS
SELECT sl.sensor_log_id,
       s.sensor_id,
       s.name,
       sl.value,
       sl.timestamp
FROM sensor s,
     sensor_logs sl
WHERE s.sensor_id = sl.sensor_id
ORDER BY sl.sensor_log_id DESC;

DROP VIEW IF EXISTS actuator_logs_actuator_view;
CREATE VIEW actuator_logs_actuator_view AS
SELECT al.actuator_log_id,
       a.actuator_id,
       al.actuator_state,
       a.name,
       al.timestamp
FROM actuator a,
     actuator_logs al
WHERE a.actuator_id = al.actuator_id
ORDER BY al.actuator_log_id DESC;

SELECT * FROM sensor_logs ORDER BY 1 DESC;