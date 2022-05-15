INSERT INTO person(first_name, last_name, rfid) VALUES('Vitor', 'Carlos', 1004);
INSERT INTO person(first_name, last_name, rfid) VALUES('Micael', 'Santos', 123345678);
INSERT INTO person(first_name, last_name, rfid) VALUES('Maria', 'Santos', 134);

INSERT INTO permission(rfid) VALUES (1004);
INSERT INTO permission(rfid) VALUES (134);

INSERT INTO entrance_logs(rfid) VALUES (1004);
INSERT INTO entrance_logs(rfid) VALUES (134);

COMMIT;