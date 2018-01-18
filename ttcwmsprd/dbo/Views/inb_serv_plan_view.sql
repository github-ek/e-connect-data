create view dbo.inb_serv_plan_view as 
    select ws.seqnum srtseq,
           isi.serv_id serv_id,
           isi.serv_rate_id,
           isi.def_serv_cod,
           isi.serv_req_flg,
           ws.mixed_prt_flg,
           ws.spec_serv_cod,
           ws.serv_enaflg,
           ws.lodlvl,
           isi.wh_id wh_id,
           isi.trknum trknum,
           isi.invnum invnum,
           isi.supnum supnum,
           isi.client_id client_id,
           cast(null as nvarchar(10) ) invlin,
           cast(null as nvarchar(10) ) invsln,
           N'----' invsts
      from inb_serv_rcvinv isi,
           wh_serv ws
     where isi.serv_id = ws.serv_id
       and isi.wh_id = ws.wh_id
     union
    select ws.seqnum srtseq,
           isl.serv_id serv_id,
           isl.serv_rate_id,
           isl.def_serv_cod,
           isl.serv_req_flg,
           ws.mixed_prt_flg,
           ws.spec_serv_cod,
           ws.serv_enaflg,
           ws.lodlvl,
           isl.wh_id wh_id,
           isl.trknum trknum,
           isl.invnum invnum,
           isl.supnum supnum,
           isl.client_id client_id,
           isl.invlin invlin,
           isl.invsln invsln,
           isl.invsts invsts
      from inb_serv_rcvlin isl,
           wh_serv ws
     where isl.serv_id = ws.serv_id
       and isl.wh_id = ws.wh_id