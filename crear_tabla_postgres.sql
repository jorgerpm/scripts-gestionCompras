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
	telefono1 varchar(15) not null,
	telefono2 varchar(15),
	correo varchar(50) not null,
	ruc varchar(100) not null,
	codigoJD varchar(100),
	idEstado bigint not null,
	PRIMARY KEY (id),
	CONSTRAINT proveedor_ruc_key UNIQUE (ruc)
);

create table producto(
	id BIGSERIAL not null,
	codigoProducto varchar(100) not null,
	nombre varchar(100) not null,
	valorUnitario numeric(9,2) not null,
	tieneIva boolean,
	idEstado bigint not null,
	PRIMARY KEY (id),
	CONSTRAINT producto_codigoProducto_key UNIQUE (codigoProducto)
);

create table formaPago(
	id BIGSERIAL NOT NULL,
	nombre varchar(100) not null,
	idEstado BIGINT not null,
	PRIMARY KEY (id)
)


create table solicitud(
id bigserial not null,
codigo_rc text not null,
fecha_solicitud timestamp not null,
estado text not null,
usuario text not null,
correos text,
observacion text,
CONSTRAINT solicitud_pkey PRIMARY KEY (id),
CONSTRAINT solicitud_codigo_rc_uk UNIQUE (codigo_rc)
);

create table solicitud_detalle(
id bigserial not null,
id_solicitud bigint not null,
cantidad int not null,
detalle text not null,
CONSTRAINT solicitud_detalle_pkey PRIMARY KEY (id)
);


create table cotizacion(
id bigserial not null,
fecha_cotizacion timestamp not null,
codigo_rc text not null,
codigo_cotizacion text not null,
estado text not null,
usuario text not null,
id_proveedor bigint not null,
observacion text,
subtotal numeric(9,2) not null,
subtotal_sin_iva numeric(9,2) not null,
iva numeric(9,2) not null,
total numeric(9,2) not null,
descuento numeric(9,2) not null default 0,
CONSTRAINT cotizacion_pkey PRIMARY KEY (id),
CONSTRAINT cotizacion_codigo_cotizacion_uk UNIQUE (codigo_cotizacion)
);

create table cotizacion_detalle(
id bigserial not null,
id_cotizacion bigint not null,
cantidad int not null,
detalle text not null,
valor_unitario numeric(9,2) not null,
valor_total numeric(9,2) not null,
tiene_iva boolean,
observacion text,
CONSTRAINT cotizacion_detalle_pkey PRIMARY KEY (id)
);