CREATE TABLE rol
(
	id BIGSERIAL NOT NULL,
   nombre varchar(100) not null,
   principal boolean NOT NULL,
   idEstado BIGINT not null,
   PRIMARY KEY (id)
);

CREATE TABLE usuario
(
   id BIGSERIAL NOT NULL,
   nombre varchar(150) not null,
   usuario varchar(100) not null,
   clave varchar(100) not null,
   correo varchar(100) not null,
   idRol bigint not null,
   idEstado bigint not null,
   PRIMARY KEY (id),
   CONSTRAINT usuario_usuario_key UNIQUE (usuario)
);

CREATE TABLE menu
(
   id BIGSERIAL NOT NULL,
   titulo varchar(100) not null,
   link varchar(200) not null,
   imagen varchar(200),
   idMenu bigint,
   idEstado bigint not null,
   PRIMARY KEY (id)
);

CREATE TABLE menurol
(
   id BIGSERIAL NOT NULL,
   idMenu bigint not null,
   idRol bigint not null,
   PRIMARY KEY (id)
);

create table estado(
	id BIGSERIAL NOT NULL,
	nombre varchar(100) not null,
	PRIMARY KEY (id)
);

create table parametro(
	id BIGSERIAL NOT NULL,
	nombre varchar(100) not null,
	valor text not null,
	idEstado bigint not null,
	PRIMARY KEY (id)
);


create table proveedor(
	id BIGSERIAL NOT NULL,
	nombreComercial varchar(100),
	razonSocial varchar(100) not null,
	direccion varchar(100),
	telefono varchar(15),
	correo varchar(50) not null,
	ruc varchar(100) not null,
	codigoJD varchar(100),
	idEstado bigint not null,
	PRIMARY KEY (id),
	CONSTRAINT proveedor_ruc_key UNIQUE (ruc)
);