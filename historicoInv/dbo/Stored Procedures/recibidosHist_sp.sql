CREATE PROCEDURE [dbo].[recibidosHist_sp] AS
SET NOCOUNT ON;

INSERT INTO dbo.Recibidos_Hist (fecha, client_id, wh_id, invnum, prtnum, rcvsts, lotnum, expqty, idnqty, invtyp, expire_dte, retcod)
select cast(rcvtrk.clsdte as date) as fecha,
        rcvlin.client_id,
        rcvlin.wh_id,
        rcvinv.po_num as invnum,
        rcvlin.prtnum,
        rcvlin.rcvsts,
        rcvlin.lotnum,
        rcvlin.expqty,
        rcvlin.rcvqty as idnqty,
        rcvinv.invtyp,
		rcvlin.expire_dte,
		rcvlin.retcod
   from [$(ttcwmsprd)].dbo.rcvtrk,
        [$(ttcwmsprd)].dbo.rcvinv,
        [$(ttcwmsprd)].dbo.rcvlin
  where rcvtrk.wh_id = rcvinv.wh_id
    and rcvtrk.trknum = rcvinv.trknum
    and rcvinv.trknum = rcvlin.trknum
    and rcvinv.client_id = rcvlin.client_id
    and rcvinv.supnum = rcvlin.supnum
    and rcvinv.invnum = rcvlin.invnum
    and rcvinv.wh_id = rcvlin.wh_id
    and rcvtrk.rcvtrk_stat = 'C'
    and cast(rcvtrk.clsdte as date) = cast(SYSDATETIME() as date)
  order by rcvtrk.clsdte desc