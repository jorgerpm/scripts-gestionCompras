insert into rol (id, nombre, principal, idestado) values (1, 'ADMINISTRADOR', true, 1);
insert into rol (id, nombre, principal, idestado) values (2, 'PROVEEDOR', false, 1);
insert into rol (id, nombre, principal, idestado) values (3, 'AUTORIZADOR', false, 1);
insert into rol (id, nombre, principal, cheklist_recepcion, idestado) values (4, 'COMPRAS', false, true, 1);
insert into rol (id, nombre, principal, cheklist_recepcion, idestado) values (5, 'BODEGA', false, true, 1);
insert into rol (id, nombre, principal, cheklist_recepcion, idestado) values (6, 'REQUISIDOR', false, true, 1);

-- colocar en 2 la secuencia del rol
ALTER SEQUENCE public.rol_id_seq RESTART 6;

insert into usuario (nombre, usuario, clave, correo, idrol, idestado) 
values ('Administrador', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', 1, 1);

INSERT INTO parametro
(id, nombre, valor, idEstado)
VALUES(1, 'HOSTMAIL', 'smtp.office365.com', 1);
INSERT INTO parametro
(id, nombre, valor, idEstado)
VALUES(2, 'PUERTOMAIL', '587', 1);
INSERT INTO parametro
(id, nombre, valor, idEstado)
VALUES(3, 'USERMAIL', '', 1);
INSERT INTO parametro
(id, nombre, valor, idEstado)
VALUES(4, 'CLAVEMAIL', '', 1);
INSERT INTO parametro
(id, nombre, valor, idEstado)
VALUES(5, 'NOMBREREMITENTEMAIL', 'Pruebas xml', 1);

INSERT INTO parametro
(id, nombre, valor, idEstado)
VALUES(6, 'ALIASMAIL', 'pruebas@xml.com', 1);

INSERT INTO parametro
(id, nombre, valor, idEstado)
VALUES(7, 'ASUNTOMAIL_RC', 'Recuperación de contraseña', 1);
INSERT INTO parametro
(id, nombre, valor, idEstado)
VALUES(8, 'MENSAJEMAIL_RC', 'Estimado [nombreUsuario]<br><br>Su nueva clave para acceder al portal es: [clave]<br><br><hr>Saludos.', 1);

INSERT INTO parametro
(id, nombre, valor, idEstado)
VALUES(9, 'ASUNTOMAIL_SC', 'Solicitud de cotizacion provedor', 1);
INSERT INTO parametro
(id, nombre, valor, idEstado)
VALUES(10, 'MENSAJEMAIL_SC', 'Estimado [razonSocialProveedor], <br>A continuación se solicita una cotización.<br>Para acceder a la solicitud de cotización, por favor ingrese al siguiente link <a href="[url]">[url]</a><br>Deberá acceder al portal con su usuario y clave, si es el caso de no estar registrado en el portal, deberá registrar sus datos dentro del mismo link.<br><hr>Saludos.', 1);
INSERT INTO parametro (id,nombre,valor,idestado) VALUES (11,'IP_SISTEMA','http://localhost:9090/php-gestionCompras/',1);
INSERT INTO parametro (id,nombre,valor,idestado) VALUES (12,'PATH_REPORTES','/home/jorge/nifa/',1);

INSERT INTO parametro (id, nombre, valor, idEstado) VALUES(13, 'ASUNTOMAIL_OC_APR', 'Cotización / OC aprobada', 1);
INSERT INTO parametro (id, nombre, valor, idEstado) 
VALUES(14, 'MENSAJEMAIL_OC_APR', 'Estimado proveedor, <br>Su cotización con número de solicitud: [codigoSolicitud], ha sido aprobada.<br><hr>Saludos.', 1);
INSERT INTO parametro (id, nombre, valor, idEstado) VALUES(15, 'MAILS_OC_APR', 'jorge.ponce@idebsystems.com', 1);

INSERT INTO parametro (id, nombre, valor, idEstado) VALUES(16, 'ASUNTOMAIL_APROBADORES', 'Orden de compra para su aprobación', 1);
INSERT INTO parametro (id, nombre, valor, idEstado) 
VALUES(17, 'MENSAJEMAIL_APROBADORES', 'Estimado [nombreUsuario], <br>Se ha generado la siguiente orden de compra con número de solicitud: [codigoSolicitud], y está pendiente de su aprobación.<br>Debe ingresar al sistema con su usuario y clave y buscar la orden de compra en la opción: Ordenes por autorizar.<br><hr>Saludos.', 1);
INSERT INTO parametro (id, nombre, valor, idEstado) VALUES(18, 'MAILS_APROBADORES', 'jorge.ponce@idebsystems.com', 1);

INSERT INTO parametro (id, nombre, valor, idEstado) VALUES(19, 'ASUNTOMAIL_CHECKLIST_RECEPCION', 'Orden de compra para su recepción', 1);
INSERT INTO parametro (id, nombre, valor, idEstado) 
VALUES(20, 'MENSAJEMAIL_CHECKLIST_RECEPCION', 'Estimado [nombreUsuario], <br>Se ha generado la siguiente orden de compra con código de solicitud: [codigoSolicitud], y está pendiente para su recepción.<br>Debe ingresar al sistema con su usuario y clave y buscar la orden de compra en la opción: Lista checklist recepción.<br><hr>Saludos.', 1);

INSERT INTO parametro (id, nombre, valor, idEstado) VALUES(21, 'CODIGO_SOLICITUD', '1', 1);



-- colocar la secuencia de parametros en el siguiente que corresponde
ALTER SEQUENCE public.parametro_id_seq RESTART 21;


insert into estado (id, nombre) values (1, 'ACTIVO');
insert into estado (id, nombre) values (2, 'INACTIVO');

INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (1, 'Administración', '', 'fa-cog', null, 1);
INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (2, 'Gestión roles', 'rol', 'fa-address-card-o', 1, 1);
INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (3, 'Gestión usuarios', 'usuario', 'fa-user-o', 1, 1);
INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (4, 'Gestión proveedores', 'proveedor', 'fa-truck', null, 1);
INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (5, 'Gestión parámetros', 'parametro', 'fa-bookmark-o', 1, 1);
INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (6, 'Asignación de permisos', 'menuRol', 'fa-unlock', 1, 1);
INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (7, 'Gestión productos', 'producto', 'fa-cube', 1, 1);
INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (8, 'Orden servicio-producto', 'ordenServicioProducto', 'fa-pagelines', null, 1);
INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (9, 'Solicitud cotización', 'solicitudCotizacion', 'fa-calculator', null, 1);
INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (10, 'Formulario cotización', 'formularioCotizacion', 'fa-calculator', null, 1);
INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (11, 'Forma pago', 'formaPago', 'fa-credit-card', 1, 1);
INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (12, 'Lista de solicitudes', 'listaSolicitudes', '', null, 1);
INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (13, 'Lista de cotizaciones', 'listaCotizaciones', '', null, 1);
INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (14, 'Lista de orden de compra', 'listaOrdenesCompra', '', null, 1);
INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (15, 'Histórico de documentos', 'listaHistoricoDocumentos', '', null, 1);
INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (16, 'Ordenes por autorizar', 'listaOrdenesPorAutorizar', '', null, 1);
INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (17, 'Lista de comparativos', 'listaComparativos', '', null, 1);
INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (18, 'Registrar preguntas', 'preguntasCheckList', 'fa-question-circle-o', 1, 1);
INSERT INTO menu(id, titulo, link, imagen, idMenu, idEstado) VALUES (19, 'Lista checkList recepción', 'listaCheckListRecepcion', '', null, 1);


insert into menurol(idrol, idmenu) values (1, 1);
insert into menurol(idrol, idmenu) values (1, 2);
insert into menurol(idrol, idmenu) values (1, 3);
insert into menurol(idrol, idmenu) values (1, 4);
insert into menurol(idrol, idmenu) values (1, 5);
insert into menurol(idrol, idmenu) values (1, 6);
insert into menurol(idrol, idmenu) values (1, 7);
insert into menurol(idrol, idmenu) values (1, 8);
insert into menurol(idrol, idmenu) values (1, 9);
insert into menurol(idrol, idmenu) values (1, 10);
insert into menurol(idrol, idmenu) values (1, 11);
insert into menurol(idrol, idmenu) values (1, 12);
insert into menurol(idrol, idmenu) values (1, 13);
insert into menurol(idrol, idmenu) values (1, 14);
insert into menurol(idrol, idmenu) values (1, 15);
insert into menurol(idrol, idmenu) values (1, 16);
insert into menurol(idrol, idmenu) values (1, 17);
insert into menurol(idrol, idmenu) values (1, 18);
insert into menurol(idrol, idmenu) values (1, 19);

