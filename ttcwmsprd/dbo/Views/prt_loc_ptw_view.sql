create view dbo.prt_loc_ptw_view as 
 select lm.arecod, il.stoloc, id.prtnum, id.prt_client_id,
        id.orgcod, id.revlvl, id.lotnum, id.sup_lotnum,
        id.invsts, id.untcas, id.untpak, lm.wh_id, STR(lm.maxqvl - lm.curqvl - lm.pndqvl , 7, 0) numpal
   from invdtl id, invsub ivs, invlod il, locmst lm, aremst am
  where am.sigflg = 1
    and am.arecod = lm.arecod
    and am.wh_id  = lm.wh_id
    and lm.stoloc = il.stoloc
    and lm.wh_id  = il.wh_id
    and il.lodnum = ivs.lodnum 
    and ivs.subnum = id.subnum
    and lm.useflg = 1
    and lm.stoflg = 1