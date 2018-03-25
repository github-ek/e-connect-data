CREATE PROCEDURE [dbo].[control_Trabajo_sp] AS
SET NOCOUNT ON;

TRUNCATE TABLE DBO.CONTROL_TRABAJO

INSERT INTO dbo.Control_Trabajo (almacen,cod_operacion,estacion_trabajo,id_lista,nro_ola,
usuario_asig,usuario_recon,zona, ubicacion,cliente,fecha_add)
select w.wh_id almacen,
        dc.lngdsc cod_operacion,
        ds.lngdsc estado_trabajo,
        w.list_id id_lista,
        w.schbat nro_ola,
        w.asg_usr_id usuario_asig,
        w.ack_usr_id usuario_recon,
        w.srcwrkzon zona,
        w.srcloc ubicacion,
        w.client_id cliente,
        w.adddte fecha_add
   from [$(ttcwmsprd)].dbo.wrkque w
  inner
   join [$(ttcwmsprd)].dbo.dscmst dc
     on dc.colnam = 'oprcod|wh_id_tmpl'
    and dc.colval = w.oprcod + '|----'
    and dc.locale_id = 'es-es'
  inner
   join [$(ttcwmsprd)].dbo.dscmst ds
     on ds.colnam = 'wrksts'
    and ds.colval = w.wrksts
    and ds.locale_id = 'es-es'