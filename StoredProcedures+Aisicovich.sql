DELIMITER //
CREATE PROCEDURE CalcularGanaciasPorUsuario(user_dni INT, OUT total INT)
BEGIN
    SELECT SUM(tk.precio) INTO total
    FROM facturaCabecera fc
    JOIN ticket tk ON fc.ticket_numero = tk.numero
    WHERE fc.usuario_dni = user_dni;
END;
//
DELIMITER ;

DELIMITER //

CREATE PROCEDURE ActualizarPrecioTicket(event_id INT, precio INT)
BEGIN
    UPDATE ticket
    SET precio = precio
    WHERE evento_id = event_id;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ObtenerHistorialDeCompras(user_dni INT)
BEGIN
    SELECT u.nombre_y_apellido, e.fechar AS evento_fecha, a.nombre AS artista_nombre,
           l.nombre AS locacion_nombre, tk.precio AS ticket_price
    FROM usuario u
    JOIN facturaCabecera fc ON u.dni = fc.usuario_dni
    JOIN ticket t ON fc.ticket_numero = t.numero
    JOIN evento e ON t.evento_id = e.id
    JOIN artista a ON e.artista_id = a.id
    JOIN locacion l ON e.locacion_id = l.id
    JOIN ticket tk ON e.id = tk.evento_id
    WHERE u.dni = user_dni;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE PopularidadDeArtistas()
BEGIN
    SELECT a.nombre AS artista_nombre, COUNT(tk.numero) AS tickets_vendidos
    FROM artista a
    JOIN evento e ON a.id = e.artista_id
    JOIN ticket tk ON e.id = tk.evento_id
    GROUP BY a.nombre
    ORDER BY tickets_sold DESC;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CalcularValorPromedioTicket(evenCantidadDeEventosPorLocacionCantidadDeEventosPorLocacionCantidadDeTicketsParaPersonaCantidadDeTicketsParaPersonaCantidadDeTicketsParaPersonat_id INT, OUT precio_prom DECIMAL(10, 2))
BEGIN
    SELECT AVG(precio) INTO precio_prom
    FROM ticket
    WHERE evento_id = event_id;
END;
//
DELIMITER ;
