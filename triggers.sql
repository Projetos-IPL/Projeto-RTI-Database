DROP TRIGGER IF EXISTS tbi_entrance_logs;
CREATE TRIGGER tbi_entrance_logs
    BEFORE INSERT
    ON entrance_logs
    FOR EACH ROW
BEGIN
    DECLARE n_permission_id INTEGER;

    SET NEW.timestamp = UNIX_TIMESTAMP();

    SET n_permission_id = (SELECT permission_id
                                FROM permission
                                WHERE rfid = NEW.rfid);

    IF n_permission_id IS NOT NULL THEN
        SET NEW.access = 1;
    ELSE
        SET NEW.access = 0;
    END IF;
END;

DROP TRIGGER IF EXISTS tbi_sensor_logs;
CREATE TRIGGER tbi_sensor_logs
    BEFORE INSERT
    ON sensor_logs
    FOR EACH ROW
BEGIN
    SET NEW.timestamp = UNIX_TIMESTAMP();
END;

DROP TRIGGER IF EXISTS tbi_actuator_logs;
CREATE TRIGGER tbi_actuator_logs
    BEFORE INSERT
    ON actuator_logs
    FOR EACH ROW
BEGIN
    SET NEW.timestamp = UNIX_TIMESTAMP();
END;

DROP TRIGGER IF EXISTS tbi_users;
CREATE TRIGGER tbi_users
    BEFORE INSERT
    ON user
    FOR EACH ROW
BEGIN
    SET NEW.password = md5(NEW.password);
END;

