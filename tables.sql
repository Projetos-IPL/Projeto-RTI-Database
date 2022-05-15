DROP TABLE IF EXISTS user;
CREATE TABLE user (
    username VARCHAR(20) NOT NULL,
    password VARCHAR(40) NOT NULL,
    PRIMARY KEY (username)
);

DROP TABLE IF EXISTS person;
CREATE TABLE person (
    person_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    rfid VARCHAR(10) NOT NULL,
    PRIMARY KEY (person_id),
    UNIQUE (rfid)
);

DROP TABLE IF EXISTS permission;
CREATE TABLE permission (
    permission_id INT NOT NULL AUTO_INCREMENT,
    rfid VARCHAR(10) NOT NULL,
    PRIMARY KEY (permission_id),
    FOREIGN KEY (rfid)
        REFERENCES person (rfid)
        ON DELETE CASCADE,
    UNIQUE (rfid)
);

DROP TABLE IF EXISTS sensor;
CREATE TABLE sensor (
    sensor_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    PRIMARY KEY (sensor_id),
    UNIQUE (name)
);

DROP TABLE IF EXISTS actuator;
CREATE TABLE actuator (
    actuator_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    PRIMARY KEY (actuator_id),
    UNIQUE (name)
);

DROP TABLE IF EXISTS actuator_logs;
CREATE TABLE actuator_logs (
    actuator_log_id INT NOT NULL AUTO_INCREMENT,
    actuator_id INT NOT NULL,
    timestamp TIMESTAMP,
    PRIMARY KEY (actuator_log_id),
    FOREIGN KEY (actuator_id)
        REFERENCES actuator(actuator_id)
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS sensor_logs;
CREATE TABLE sensor_logs (
    sensor_log_id INT NOT NULL AUTO_INCREMENT,
    sensor_id INT NOT NULL,
    timestamp TIMESTAMP,
    PRIMARY KEY (sensor_log_id),
    FOREIGN KEY (sensor_id)
        REFERENCES sensor(sensor_id)
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS entrance_logs;
CREATE TABLE entrance_logs (
    entrance_log_id INT NOT NULL AUTO_INCREMENT,
    rfid VARCHAR(10) NOT NULL,
    access TINYINT(1),
    timestamp TIMESTAMP,
    PRIMARY KEY (entrance_log_id),
    FOREIGN KEY (rfid)
        REFERENCES person(rfid)
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS entrance_logs_images;
CREATE TABLE entrance_logs_images (
    entrance_log_id INT NOT NULL,
    image BLOB NOT NULL,
    PRIMARY KEY (entrance_log_id),
    FOREIGN KEY (entrance_log_id)
        REFERENCES entrance_logs(entrance_log_id)
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS debug;
CREATE TABLE debug (
  proc_id varchar(100) default NULL,
  debug_output text,
  line_id int(11) NOT NULL auto_increment,
  PRIMARY KEY  (line_id)
)