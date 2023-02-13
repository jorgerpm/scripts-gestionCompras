CREATE TABLE rol
(
	id BIGSERIAL NOT NULL,
   nombre varchar(100) not null,
   principal boolean NOT NULL,
   idEstado BIGINT not null,
   cheklist_recepcion boolean NOT NULL default false,
   autorizador bool NOT NULL DEFAULT false,
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
   CONSTRAINT usuario_usuario_key UNIQUE (usuario),
   CONSTRAINT usuario_correo_key UNIQUE (correo)
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
	ruc varchar(100) not null,
	nombreComercial varchar(100),
	razonSocial varchar(100) not null,
	direccion varchar(200),
	telefono1 varchar(50) not null,
	telefono2 varchar(50),
	contacto text,
	correo varchar(100) not null,
	contabilidad text,
	telefono_contabilidad text,
	correo_contabilidad text,
	codigoJD varchar(100),
	idEstado bigint not null,
	carpeta text,
	servicio_producto text,
	credito text,
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
codigo_solicitud text not null,
codigo_rc text not null,
fecha_solicitud timestamp not null,
estado text not null,
usuario text not null,
correos text,
observacion text,
monto_aprobado_rc numeric(9,2),
fecha_autoriza_rc timestamp,
estado_rc text,
unidad_negocio_rc text,
usuario_modifica text,
fecha_modifica timestamp,
CONSTRAINT solicitud_pkey PRIMARY KEY (id),
CONSTRAINT solicitud_codigo_sol_uk UNIQUE (codigo_solicitud)
);

create table solicitud_detalle(
id bigserial not null,
id_solicitud bigint not null,
cantidad int not null,
detalle text not null,
path_archivo text,
CONSTRAINT solicitud_detalle_pkey PRIMARY KEY (id)
);


create table cotizacion(
id bigserial not null,
fecha_cotizacion timestamp not null,
codigo_cotizacion text not null,
codigo_solicitud text not null,
codigo_rc text not null,
estado text not null,
usuario text not null,
ruc_proveedor text not null,
observacion text,
subtotal numeric(9,2) not null,
subtotal_sin_iva numeric(9,2) not null,
iva numeric(9,2) not null,
total numeric(9,2) not null,
descuento numeric(9,2) not null default 0,
tiempo_entrega text,
validez_cotizacion text,
forma_pago text,
adicionales text,
usuario_modifica text,
fecha_modifica timestamp,
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

create table solicitud_envio(
id bigserial not null,
id_solictud bigint not null,
numero_rc text not null,
usuario_envia text not null,
fecha_envia timestamp not null,
correos_envia text not null,
url text,
CONSTRAINT solicitud_envio_pkey PRIMARY KEY (id)
);



create table orden_compra(
id bigserial not null,
fecha_orden_compra timestamp not null,
codigo_orden_compra text not null,
codigo_rc text not null,
codigo_solicitud text not null,
estado text not null,
usuario text not null,
ruc_proveedor text not null,
observacion text,
subtotal numeric(9,2) not null,
subtotal_sin_iva numeric(9,2) not null,
iva numeric(9,2) not null,
total numeric(9,2) not null,
descuento numeric(9,2) not null default 0,
forma_pago text,
detalle_final text,
unidad_negocio_rc text;
usuario_modifica text,
fecha_modifica timestamp,
CONSTRAINT orden_compra_pkey PRIMARY KEY (id),
CONSTRAINT orden_compra_codigo_orden_compra_uk UNIQUE (codigo_orden_compra)
);

create table orden_compra_detalle(
id bigserial not null,
id_orden_compra bigint not null,
cantidad int not null,
codigo_producto text,
detalle text not null,
valor_unitario numeric(9,2) not null,
valor_total numeric(9,2) not null,
tiene_iva boolean,
observacion text,
CONSTRAINT orden_compra_detalle_pkey PRIMARY KEY (id)
);

create table autorizacion_orden_compra(
id bigserial not null,
id_orden_compra bigint not null,
id_usuario bigint not null,
fecha_autoriza timestamp,
usuario_autoriza text,
estado text,
observacion text,
PRIMARY KEY (id) 
);



CREATE TABLE historial_documentos (
	id bigserial NOT NULL,
	id_documento int8 NOT NULL,
	documento text NOT NULL,
	codigo_solicitud text,
	codigo_rc text,
	estado text,
	fecha_cambio timestamp,
	usuario_cambio text,
	valor_total numeric(9, 2) DEFAULT 0,
	observacion text,
	CONSTRAINT historial_documentos_pkey PRIMARY KEY (id)
);


create table comparativo(
	id bigserial not null,
	id_solicitud bigint not null,
	codigo_solicitud text not null,
	codigo_comparativo text,
	fecha_comparativo timestamp,
	usuario text,
	estado text,
	observacion text,
	usuario_modifica bigint,
	fecha_modifica timestamp,
	PRIMARY KEY (id)
);

create table comparativo_detalle(
	id bigserial not null,
	id_comparativo bigint not null,
	id_cotizacion bigint not null,
	seleccionada boolean not null default false,
	PRIMARY KEY (id)
);



create table check_list_recepcion(
	id bigserial not null,
	id_solicitud bigint not null,
	id_orden_compra bigint not null,
	codigo_solicitud text not null,
	fecha_recepcion timestamp not null,
	estado text not null,
	usuario text not null,
	fecha_recepcion_bodega timestamp,
	codigo_material text,
	cantidad_recibida integer,
	monto_total_factura numeric(9,2),
	fecha_aprobacion_artes timestamp,
	usuario_modifica text,
	fecha_modifica timestamp,
	PRIMARY KEY (id)
);

create table check_list_recepcion_detalle(
	id bigserial not null,
	id_check_list_recepcion bigint not null,
	id_rol bigint not null,
	id_usuario bigint not null,
	pregunta text,
	respuesta text,
	fecha timestamp,
	observacion text,
	campos_bodega text,
	fecha_aprobacion_artes text,
	PRIMARY KEY (id)
);


create table pregunta_check_list_recepcion(
	id bigserial not null,
	id_rol bigint not null,
	pregunta text,
	idEstado bigint not null,
	fecha_modifica timestamp,
	usuario_modifica bigint,
	PRIMARY KEY (id)
);


