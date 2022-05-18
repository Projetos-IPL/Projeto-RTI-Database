DROP VIEW IF EXISTS entrance_logs_person_view;
CREATE VIEW entrance_logs_person_view AS
SELECT el.rfid, CONCAT_WS(' ', p.first_name, p.last_name) "person_name", el.timestamp, el.access
FROM entrance_logs el, person p
WHERE el.rfid = p.rfid;