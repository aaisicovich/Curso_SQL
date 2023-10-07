DELIMITER //
CREATE PROCEDURE ReporteVentasPorEvento()
BEGIN
    SELECT e.id AS 'Número de Evento',
           l.nombre AS 'Locación',
           e.fechar AS 'Fecha del Evento',
           SUM(t.precio) AS 'Total en Ventas'
    FROM evento e
    JOIN locacion l ON e.locacion_id = l.id
    JOIN ticket t ON e.id = t.evento_id
    GROUP BY e.id;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ReporteComprasPorMetodoPago()
BEGIN
    SELECT fc.metodo_pago AS 'Método de Pago',
           COUNT(fc.numero) AS 'Cantidad de Compras',
           SUM(t.precio) AS 'Total de Compras'
    FROM facturaCabecera fc
    JOIN ticket t ON fc.ticket_numero = t.numero
    GROUP BY fc.metodo_pago;
END;
//
DELIMITER ;
