CREATE VIEW dbo.retenciones
AS
SELECT        hldhst_id, hlddte, acttyp, hldpfx, hldnum, hldtyp, wh_id, hld_usr_id, prtnum, prt_client_id, lotnum, sup_lotnum, revlvl, orgcod, supnum, fr_invsts, to_invsts, lodnum, subnum, dtlnum, loducc, subucc, reacod, 
                         untqty, cstms_cnsgnmnt_id, rttn_id, cstms_bond_flg, dty_stmp_flg, inv_attr_str1, inv_attr_str2, inv_attr_str3, inv_attr_str4, inv_attr_str5, inv_attr_str6, inv_attr_str7, inv_attr_str8, inv_attr_str9, inv_attr_str10, 
                         inv_attr_str11, inv_attr_str12, inv_attr_str13, inv_attr_str14, inv_attr_str15, inv_attr_str16, inv_attr_str17, inv_attr_str18, inv_attr_int1, inv_attr_int2, inv_attr_int3, inv_attr_int4, inv_attr_int5, inv_attr_flt1, 
                         inv_attr_flt2, inv_attr_flt3, inv_attr_dte1, inv_attr_dte2
FROM [$(WMS_DB_SERVER)].[$(ttcwmsprd)].dbo.hldhst
GO