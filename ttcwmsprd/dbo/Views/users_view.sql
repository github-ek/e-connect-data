﻿create view dbo.users_view as 
select  lua.*,
        adrmst.first_name,
        adrmst.last_name,
        coalesce(adrmst.usr_dsp, lua.usr_id) usr_dsp,
        adrmst.adrnam,
        adrmst.adrln1,
        adrmst.adrln2,
        adrmst.adrln3,
        adrmst.adrcty,
        adrmst.adrstc,
        adrmst.adrpsz,
        adrmst.ctry_name,
        adrmst.rgncod,
        adrmst.phnnum,
        adrmst.faxnum,
        adrmst.honorific,
        adrmst.adr_district,
        adrmst.web_adr,
        adrmst.email_adr,
        adrmst.rsaflg,
        adrmst.temp_flg,
        adrmst.po_box_flg
   from les_usr_ath lua left outer join adrmst 
     on (adrmst.adr_id=lua.adr_id)