CREATE TABLE locacion (
	id INT auto_increment unique, 
	nombre VARCHAR(40) not null,
	direccion VARCHAR(100) NOT NULL,
	capacidad INT NOT NULL,
    primary key (id, nombre, direccion)
);

CREATE TABLE artista(
	id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    nombre VARCHAR(40) NOT NULL,
    nacionalidad VARCHAR(20) NOT NULL
);

CREATE TABLE evento(
	id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    artista_id INT NOT NULL,
    locacion_id INT NOT NULL,
    fechar INT NOT NULL,
    foreign key (artista_id) references artista(id),
    foreign key (locacion_id) references locacion(id)
);

CREATE TABLE ticket(
	numero INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    evento_id INT NOT NULL,
    ubicacion VARCHAR(100) NOT NULL,
    precio INT NOT NULL,
    foreign key (evento_id) references evento(id)
);

CREATE TABLE usuario(
	dni int not null ,
    genero varchar(10) not null,
    nombre_y_apellido varchar(80) not null,
    nacionalidad varchar(20) not null,
    mail varchar(50) not null,
    primary key (dni,genero)
);

CREATE TABLE facturaCabecera(
	numero INT auto_increment primary key unique,
    usuario_dni int not null,
    ticket_numero int not null,
    metodo_pago varchar(20),
    foreign key (usuario_dni) references usuario(dni),
    foreign key (ticket_numero) references ticket(numero)
);

CREATE TABLE facturaLineas(
	numero INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    factura_cabecera_numero INT NOT NULL,
    detalle VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL,
    PRECIO INT NOT NULL,
    foreign key (factura_cabecera_numero) references facturaCabecera(numero)
);




