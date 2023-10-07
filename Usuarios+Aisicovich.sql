-- Usuario Solo lectura
CREATE USER 'user'@'localhost' IDENTIFIED BY 'contraseña';

-- Usuario  lectura, inserción y modificación
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'contraseña';

-- Permisos de Lectura al usuario User
GRANT SELECT ON proyectofinal.* TO 'user'@'localhost';

-- Permisos de Lectura, insercion y modificacion al usuario Admin
GRANT SELECT, INSERT, UPDATE ON proyectofinal.* TO 'admin'@'localhost';

-- Revocar permisos de eliminacion ambos usuarios
REVOKE DELETE ON proyectofinal.* FROM 'user'@'localhost';
REVOKE DELETE ON proyectofinal.* FROM 'admin'@'localhost'