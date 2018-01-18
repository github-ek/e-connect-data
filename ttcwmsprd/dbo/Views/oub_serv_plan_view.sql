create view dbo.oub_serv_plan_view as 
    select ws.seqnum srtseq,
           oso.serv_id serv_id,
           oso.serv_rate_id,
           oso.def_serv_cod,
           oso.serv_req_flg,
           ws.mixed_prt_flg,
           ws.spec_serv_cod,
           ws.serv_enaflg,
           ws.lodlvl,
           oso.wh_id wh_id,
           oso.ordnum ordnum,
           oso.client_id client_id,
           cast(null as nvarchar(10) ) ordlin,
           cast(null as nvarchar(10) ) ordsln,
           cast(null as nvarchar(50) ) prtnum,
           cast(null as nvarchar(32) ) prt_client_id
      from oub_serv_ord oso,
           wh_serv ws
     where oso.serv_id = ws.serv_id
       and oso.wh_id = ws.wh_id
    union
    select ws.seqnum srtseq,
           osl.serv_id serv_id,
           osl.serv_rate_id,
           osl.def_serv_cod,
           osl.serv_req_flg,
           ws.mixed_prt_flg,
           ws.spec_serv_cod,
           ws.serv_enaflg,
           ws.lodlvl,
           osl.wh_id wh_id,
           osl.ordnum ordnum,
           osl.client_id client_id,
           osl.ordlin ordlin,
           osl.ordsln ordsln,
           ol.prtnum,
           ol.prt_client_id
      from oub_serv_ord_line osl,
           wh_serv ws,
           ord_line ol
     where osl.serv_id = ws.serv_id
       and osl.wh_id = ws.wh_id
       and ol.client_id = osl.client_id
       and ol.ordnum = osl.ordnum
       and ol.ordlin = osl.ordlin
       and ol.ordsln = osl.ordsln