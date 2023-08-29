CREATE VIEW Detalleeventoos AS
SELECT e.id AS evento_id, a.nombre AS artista_nombre, l.nombre AS locacion_nombre, e.fechar AS evento_fecha
FROM evento e
JOIN artista a ON e.artista_id = a.id
JOIN locacion l ON e.locacion_id = l.id;

CREATE VIEW UserTickets AS
SELECT u.dni, u.genero, u.nombre_y_apellido, t.numero AS ticket_number,
       a.nombre AS artista_nombre, l.nombre AS locacion_nombre, e.fechar AS evento_fecha, tk.precio AS ticket_price
FROM usuario u
JOIN facturaCabecera fc ON u.dni = fc.usuario_dni
JOIN ticket t ON fc.ticket_numero = t.numero
JOIN evento e ON t.evento_id = e.id
JOIN artista a ON e.artista_id = a.id
JOIN locacion l ON e.locacion_id = l.id
JOIN ticket tk ON e.id = tk.eventoo_id;

CREATE VIEW GananciaXeventoo AS
SELECT e.id AS evento_id, a.nombre AS artista_nombre, l.nombre AS locacion_nombre, e.fechar AS evento_fecha,
       SUM(tk.precio) AS total_revenue
FROM evento e
JOIN artista a ON e.artista_id = a.id
JOIN locacion l ON e.locacion_id = l.id
JOIN ticket tk ON e.id = tk.evento_id
GROUP BY e.id, a.nombre, l.nombre, e.fechar;

CREATE VIEW ResumenFactura AS
SELECT fc.numero AS factura_numero, u.dni, u.genero, u.nombre_y_apellido,
       SUM(fl.cantidad * fl.PRECIO) AS total_amount, fc.metodo_pago
FROM facturaCabecera fc
JOIN usuario u ON fc.usuario_dni = u.dni
JOIN facturaLineas fl ON fc.numero = fl.factura_cabecera_numero
GROUP BY fc.numero, u.dni, u.genero, u.nombre_y_apellido, fc.metodo_pago;

CREATE VIEW TicketsDisponibles AS
SELECT e.id AS evento_id, a.nombre AS nombre_artista, l.nombre AS nombre_locacion, e.fechar AS fecha_evento,
       l.capacidad - COUNT(tk.numero) AS tickets_available
FROM evento e
JOIN artista a ON e.artista_id = a.id
JOIN locacion l ON e.locacion_id = l.id
LEFT JOIN ticket tk ON e.id = tk.eventoo_id
GROUP BY e.id, a.nombre, l.nombre, e.fechar, l.capacidad;