CREATE PROCEDURE historico_sp AS
SET NOCOUNT ON;

INSERT INTO dbo.historico(prt_client_id,
wh_id,
prtnum,
lngdsc,
lotnum,
invsts,
expire_dte,
untqty)
select a.prt_client_id
,c.wh_id
,a.prtnum
,h.lngdsc  
,a.lotnum
,a.invsts
,cast(expire_dte As Date) as expire_dte 
,  sum(untqty) as untqty
from [$(ttcwmsprd)].dbo.invdtl a 
join [$(ttcwmsprd)].dbo.invsub b on a.subnum = b.subnum
join [$(ttcwmsprd)].dbo.invlod c on b.lodnum = c.lodnum
join [$(ttcwmsprd)].dbo.locmst d on c.stoloc = d.stoloc and c.wh_id = d.wh_id  
join [$(ttcwmsprd)].dbo.aremst e on d.arecod = e.arecod and d.wh_id = e.wh_id 
join [$(ttcwmsprd)].dbo.bldg_mst f on e.bldg_id = f.bldg_id and e.wh_id    = f.wh_id
join  [$(ttcwmsprd)].dbo.prtmst_view g on a.prtnum = g.prtnum
        and d.wh_id = g.wh_id
        and a.prt_client_id = g.prt_client_id   
join [$(ttcwmsprd)].dbo.prtdsc h on h.colnam='prtnum|prt_client_id|wh_id_tmpl' 
        and concat(a.prtnum,'|',a.prt_client_id,'|',c.wh_id) = h.colval
        and h.locale_id ='ES-ES'
                                                                                                           
where 1=1 
--and a.prtnum ='110-213-004'
--AND c.wh_id = 'MTV02'
and a.prtnum <> 'RETURNPART'
and e.stoare_flg = 1
--and d.trvseq is not null
--and d.locsts <> 'E'
--and a.prt_client_id='ENTEC DE COLOMBIA SAS'

--order by 4,1,2,3
group by a.prt_client_id,c.wh_id,a.prtnum,h.lngdsc,a.lotnum,cast(expire_dte As Date),a.invsts
order by 1,2,3,4,5