DROP PROCEDURE IF EXISTS `debug_insert`;
CREATE PROCEDURE `debug_insert`(IN p_proc_id VARCHAR(100), IN p_debug_info TEXT)
BEGIN
    INSERT INTO debug (proc_id, debug_output)
    VALUES (p_proc_id, p_debug_info);
END;

DROP PROCEDURE IF EXISTS `debug_on`;
CREATE PROCEDURE `debug_on`(IN p_proc_id VARCHAR(100))
BEGIN
    CALL debug_insert(p_proc_id, CONCAT('Debug Started :', NOW()));
END;

DROP PROCEDURE IF EXISTS `debug_off`;
CREATE PROCEDURE `debug_off`(IN p_proc_id VARCHAR(100))
BEGIN
    CALL debug_insert(p_proc_id, CONCAT('Debug Ended :', NOW()));
    SELECT debug_output FROM debug WHERE proc_id = p_proc_id ORDER BY line_id;
    DELETE FROM debug WHERE proc_id = p_proc_id;
END;