CREATE PROCEDURE [dbo].[conteo_ciclico_sp] AS
SET NOCOUNT ON;

TRUNCATE TABLE DBO.conteo_ciclico

INSERT INTO dbo.conteo_ciclico (wh_id, cntbat, stoloc, prt_client_id, prtnum, lngdsc, conteomax, conteomin, trndte, mod_usr_id,
tipo1, tipo2, tipo_recuento1, cantidad_recuento1, contar_usuario1, fecha_recuento1, id_contador1)
select cnthst.wh_id,
        cnthst.cntbat,
        cnthst.stoloc,
        coalesce(cnthst.prt_client_id, ' 0 ') prt_client_id,
        coalesce(cnthst.prtnum, ' 0 ') prtnum,
        prtdsc.lngdsc,
        min(cnthst.cntdte) conteomax,
        max(cnthst.cntdte) conteomin,
        cnthst.adddte,
        cnthst.mod_usr_id,
        (select top (1) c1.cnttyp
           from [$(ttcwmsprd)].dbo.cnthst c1
          where c1.cntbat = cnthst.cntbat
          ) tipo1,
        (select top (1) c1.cnttyp
           from [$(ttcwmsprd)].dbo.cnthst c1
          where c1.cntbat = cnthst.cntbat
          ) tipo2,
		  ct1.untqty tipo_recuento1,
        ct1.cntqty cantidad_unidades1,
        ct1.cnt_usr_id contar_usuario1,
        ct1.cntdte fecha_recuento1,
		ct1.cnthst_id id_contador1
   from [$(ttcwmsprd)].dbo.cnthst
   inner join [$(ttcwmsprd)].dbo.cnthst as ct1  
		on cnthst.cnthst_id = ct1.cnthst_id
	inner join [$(ttcwmsprd)].dbo.cnthst as ct2
		on cnthst.cnthst_id = ct2.cnthst_id 
	left outer
   join [$(ttcwmsprd)].dbo.prtdsc
     on prtdsc.locale_id = 'es-es'
    and prtdsc.colval = cnthst.prtnum + '|' + cnthst.prt_client_id + '|' + cnthst.wh_id
	and cnthst.cntbat = ct1.cntbat and ct1.cntbat <> ct2.cntbat
	group by cnthst.wh_id,
        cnthst.cntbat,
        cnthst.stoloc,
        cnthst.prt_client_id,
        cnthst.prtnum,
        prtdsc.lngdsc,
        cnthst.adddte,
        cnthst.mod_usr_id,
		ct1.untqty,
        ct1.cntqty,
        ct1.cnt_usr_id,
        ct1.cntdte,
		ct1.cnthst_id