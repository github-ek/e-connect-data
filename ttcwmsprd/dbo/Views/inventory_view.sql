create view dbo.inventory_view as 
    select  il.wh_id, il.stoloc, il.lodnum, il.prmflg, il.mvlflg, il.loducc, il.asset_typ,
            ivs.subwgt, ivs.phyflg, ivs.prmflg prmsubflg,
 	    ivs.ctnflg, ivs.subucc, ivs.wrkref subref,
	    id.*
      from invdtl id, invsub ivs, invlod il
     where il.lodnum = ivs.lodnum
       and ivs.subnum = id.subnum