CREATE TABLE audit_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    action VARCHAR(10) NOT NULL,
    table_name VARCHAR(50) NOT NULL,
    record_id INT,
    audit_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT
);

DELIMITER //
CREATE TRIGGER user_insert AFTER INSERT ON usuario
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'usuario', NEW.dni, NULL);
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER user_update AFTER UPDATE ON usuario
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'usuario', NEW.dni, NULL);
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER user_delete BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'usuario', OLD.dni, NULL);
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER compra_ticket AFTER INSERT ON facturaCabecera
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'facturaCabecera', NEW.numero, NULL);
END;
//
DELIMITER ;