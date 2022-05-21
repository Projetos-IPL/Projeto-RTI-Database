DROP VIEW IF EXISTS entrance_logs_person_view;
CREATE VIEW entrance_logs_person_view AS
SELECT el.rfid,
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
       (SELECT COUNT(1) FROM entrance_logs WHERE access = 1) "successful_entrance_log",
       (SELECT COUNT(1) FROM entrance_logs WHERE access = 0) "unsuccessful_entrance_logs",
       (SELECT COUNT(1) FROM sensor_logs) "sensor_log_count",
       (SELECT COUNT(1) FROM actuator_logs) "actuator_log_count",
       (SELECT COUNT(1) FROM permission) "permission_count"
FROM dual;

INSERT INTO entrance_logs (rfid) VALUES ('B7 4F 46 01');