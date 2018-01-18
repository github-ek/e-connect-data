create view dbo.alloc_search_hdr_view as 
    select alloc_search_hdr.alloc_search_id,
           alloc_search_hdr.wh_id,
           alloc_search_hdr.bldg_id,
           coalesce(pck_area.arecod, alloc_search_hdr.arecod) arecod,
           pck_area.pck_arecod,
           alloc_search_hdr.srtseq,
           alloc_search_hdr.search_path_typ,
           alloc_search_hdr.lodlvl,
           alloc_search_hdr.uomcod,
           alloc_search_hdr.reg_uom,
           alloc_search_hdr.thresh_flg,
           alloc_search_hdr.ins_dt,
           alloc_search_hdr.last_upd_dt,
           alloc_search_hdr.ins_user_id,
           alloc_search_hdr.last_upd_user_id,
           alloc_search_hdr.cstms_bond_flg,
           alloc_search_hdr.dty_stmp_flg,
           alloc_search_hdr.alloc_grp_nam,
           alloc_search_hdr.loc_cap_pck_pct, 
           alloc_search_hdr.lstpck_flg
      from alloc_search_hdr
      left join pck_area
        on alloc_search_hdr.arecod = pck_area.pck_arecod
       and alloc_search_hdr.wh_id = pck_area.wh_id
       and alloc_search_hdr.bldg_id = pck_area.bldg_id