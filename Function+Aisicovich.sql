DELIMITER //
CREATE FUNCTION CantidadDeTicketsParaPersona(dni INT, user_genero VARCHAR(10))
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE total_tickets INT;
    
    SELECT COUNT(*) INTO total_tickets
    FROM usuario u
    JOIN facturaCabecera fc ON u.dni = fc.usuario_dni
    JOIN ticket t ON fc.ticket_numero = t.numero
    WHERE u.dni = dni AND u.genero = user_genero;
    
    RETURN total_tickets;
END //
DELIMITER ;

SELECT CantidadDeTicketsParaPersona(20123456, 'Female');

DELIMITER //
CREATE FUNCTION CantidadDeEventosPorLocacion(locacion_id INT)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE total_eventos INT;
    
    SELECT COUNT(*) INTO total_eventos
    FROM evento
    WHERE locacion_id = locacion_id;
    
    RETURN total_eventos;
END //userticketsusertickets
DELIMITER ;


SELECT CantidadDeEventosPorLocacion(3);

