CREATE PROCEDURE [dbo].[recepciones_sin_cerrar_sp] AS
SET NOCOUNT ON;

TRUNCATE TABLE dbo.recepciones_sin_cerrar

INSERT INTO dbo.recepciones_sin_cerrar (almacen, trailer, estado, rec_maestro, fecha_mod, tipo_fac, cliente, nro_facturas, nro_lineas,
cnt_esperada, cnt_recibida)
select coalesce(rt.wh_id, t.stoloc_wh_id) almacen,
        t.trlr_num trailer,
        coalesce(dr.lngdsc, dt.lngdsc) estado,
        rt.trknum rec_maestro,
        coalesce(rt.moddte, t.moddte) fecha_mod,
        ri.invtyp tipo_fac,
        ri.client_id cliente,
        count(distinct ri.invnum) Nro_facturas,
        count(rl.rcvkey) Nro_lineas,
        sum(rl.expqty) cnt_esperada,
        sum(rl.rcvqty) cnt_recibida
   from [$(ttcwmsprd)].dbo.rcvtrk rt
   full OUTER
   join [$(ttcwmsprd)].dbo.trlr t
     on t.trlr_id = rt.trlr_id
   left outer
   join [$(ttcwmsprd)].dbo.dscmst dt
     on dt.colnam = 'trlr_stat'
    and dt.colval = t.trlr_stat
    and dt.locale_id = 'es-es'
   left outer
   join [$(ttcwmsprd)].dbo.dscmst dr
     on dr.colnam = 'rcvtrk_stat'
    and dr.colval = rt.rcvtrk_stat
    and dr.locale_id = 'es-es'
   left outer
   join [$(ttcwmsprd)].dbo.rcvinv ri
     on rt.wh_id = ri.wh_id
    and rt.trknum = ri.trknum
   left outer
   join [$(ttcwmsprd)].dbo.rcvlin rl
     on ri.wh_id = rl.wh_id
    and ri.trknum = rl.trknum
    and ri.invnum = rl.invnum
  where /*(rt.wh_id = 'CL0-02' or t.stoloc_wh_id = 'CL0-02')
    and*/ ((rt.rcvtrk_stat <> 'C' and rt.clsdte is null) or (t.trlr_stat <> 'D' and t.trlr_cod = 'RCV'))
  group by coalesce(rt.wh_id, t.stoloc_wh_id),
        t.trlr_num,
        coalesce(dr.lngdsc, dt.lngdsc),
        rt.trknum,
        coalesce(rt.moddte, t.moddte),
        ri.invtyp,
        ri.client_id
  order by 5
