insert into rol (id, nombre, principal, idestado) values (1, 'ADMINISTRADOR', true, 1);

-- colocar en 2 la secuencia del rol
ALTER SEQUENCE public.rol_id_seq RESTART 2;

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
VALUES(8, 'MENSAJEMAIL_RC', 'Estimado [nombre]<br><br>Su nueva clave para acceder al portal es: [clave]<br><br><hr>Saludos.', 1);

INSERT INTO parametro
(id, nombre, valor, idEstado)
VALUES(9, 'ASUNTOMAIL_SC', 'Solicitud de cotizacion provedor', 1);
INSERT INTO parametro
(id, nombre, valor, idEstado)
VALUES(10, 'MENSAJEMAIL_SC', 'Estimado proveedor, <br>A continuación se solicita una cotización.<br><hr>Saludos.', 1);

-- colocar la secuencia de parametros en el siguiente que corresponde
ALTER SEQUENCE public.parametro_id_seq RESTART 10;

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
