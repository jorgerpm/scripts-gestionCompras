CREATE OR REPLACE FUNCTION public.insert_historico()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
total numeric(9,2);
id_his bigint;
  BEGIN
--	  select max(id) into id_his from historial_documentos;
--	  if( id_his is null or id_his = 0)then
--			id_his := 1;
--	else
--		id_his := id_his + 1;
--	 end if;

	  IF NOT exists (select column_name from information_schema.columns 
					WHERE table_schema='public' 
                   and table_name= TG_TABLE_NAME 
                   and column_name='total') THEN
      	   total := 0;
      ELSE
      	total := NEW.total;
      END IF;
	  
	 INSERT INTO historial_documentos ( id_documento,documento,codigo_solicitud, codigo_rc,estado,fecha_cambio,usuario_cambio,valor_total,observacion)
	 VALUES ( NEW.id, UPPER(TG_TABLE_NAME), NEW.codigo_solicitud, NEW.codigo_rc, NEW.estado,now(), NEW.usuario_modifica,total,NEW.observacion);

	RETURN NULL;
  END;
$function$
;



create trigger trigger_historico_solicitud after
insert
    or
update
    on
    public.solicitud for each row execute function insert_historico();


create trigger trigger_historico_cotizacion after
insert
    or
update
    on
    public.cotizacion for each row execute function insert_historico();


create trigger trigger_historico_orden_compra after
insert
    or
update
    on
    public.orden_compra for each row execute function insert_historico();

