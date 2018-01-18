
CREATE PROCEDURE [dbo].[recibidosPrd_sp] AS
SET NOCOUNT ON;

INSERT INTO dbo.recibidos_prd (fecha, usr_id, prt_client_id, wh_id, invnum, prtnum, sum_qty)
  select cast(dlytrn.last_upd_dt as date),
        dlytrn.usr_id,
        rcvlin.prt_client_id,
        rcvlin.wh_id,
        rcvlin.invnum,
        invdtl.prtnum,
        sum(invdtl.untqty)
   from [$(ttcwmsprd)].dbo.dlytrn,
        [$(ttcwmsprd)].dbo.invdtl,
        [$(ttcwmsprd)].dbo.rcvlin
  where actcod like 'IDNTFY'
    and invdtl.dtlnum = dlytrn.dtlnum
    and rcvlin.rcvkey = invdtl.rcvkey
    and cast(dlytrn.last_upd_dt as date) = cast(SYSDATETIME() as date)
  group by cast(dlytrn.last_upd_dt as date),
        dlytrn.usr_id,
        rcvlin.prt_client_id,
        rcvlin.wh_id,
        rcvlin.invnum,
        invdtl.prtnum