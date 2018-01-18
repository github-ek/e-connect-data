


CREATE PROCEDURE [dbo].[pickeadosprd_sp] AS
SET NOCOUNT ON;

INSERT INTO dbo.pickeados (fecha, wh_id, client_id, ordnum, usr_id, prtnum, sum_appqty)
select cast(pw.last_upd_dt as date) fecha,
        pw.wh_id,
        pw.client_id,
        pw.ordnum,
        pw.last_pck_usr_id usuario,
        pw.prtnum,
        sum(pw.appqty) as unidades
   from [$(ttcwmsprd)].dbo.pckwrk_view pw
  where pw.pcksts = 'C'
    and pw.last_pck_usr_id is not null
    and cast(pw.last_upd_dt as date) = cast(sysdatetime() as date)
  group by cast(pw.last_upd_dt as date),
        pw.wh_id,
        pw.client_id,
        pw.ordnum,
        pw.last_pck_usr_id,
        pw.prtnum