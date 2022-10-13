-- ----------------------
-- truncate de tablas
-- ----------------------
truncate table menurol;
truncate table menu;
truncate table estado;
truncate table parametro;
truncate table usuario;
truncate table rol;

-- ----------------------
-- reinicio de las secuencias
-- ----------------------
alter sequence estado_id_seq restart;
alter sequence menu_id_seq restart;
alter sequence menurol_id_seq restart;
alter sequence parametro_id_seq restart;
alter sequence rol_id_seq restart;
alter sequence usuario_id_seq restart;
