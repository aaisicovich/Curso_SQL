START TRANSACTION;

-- Realizar una eliminación condicional si hay registros en la tabla
DELETE FROM evento
WHERE locacion_id = 20
AND EXISTS (SELECT 1 FROM evento);

-- ROLLBACK;

-- COMMIT;

START TRANSACTION;

-- Insertar registros en la tabla usuario 1-4
INSERT INTO usuario (dni, genero, nombre_y_apellido, nacionalidad, mail)
VALUES
    (1, 'M', 'Nombre1 Apellido1', 'Nacionalidad1', 'correo1@example.com'),
    (2, 'F', 'Nombre2 Apellido2', 'Nacionalidad2', 'correo2@example.com'),
    (3, 'M', 'Nombre3 Apellido3', 'Nacionalidad3', 'correo3@example.com'),
    (4, 'F', 'Nombre4 Apellido4', 'Nacionalidad4', 'correo4@example.com');

SAVEPOINT savepoint_4;

-- Insertar registros en la tabla usuario 5-8
INSERT INTO usuario (dni, genero, nombre_y_apellido, nacionalidad, mail)
VALUES
    (5, 'M', 'Nombre5 Apellido5', 'Nacionalidad5', 'correo5@example.com'),
    (6, 'F', 'Nombre6 Apellido6', 'Nacionalidad6', 'correo6@example.com'),
    (7, 'M', 'Nombre7 Apellido7', 'Nacionalidad7', 'correo7@example.com'),
    (8, 'F', 'Nombre8 Apellido8', 'Nacionalidad8', 'correo8@example.com');

SAVEPOINT savepoint_8;

-- RELEASE TO savepoint_4;

COMMIT;