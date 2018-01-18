create view dbo.yard_loc_trlr_view as 
   select aremst.bldg_id,
          aremst.arecod,
          locmst.stoloc yard_loc,
          locmst.locsts,
          locmst.useflg,
          locmst.wh_id,
          trlr.trlr_id,
          trlr.trlr_stat,
          trlr.carcod,
          trlr.trlr_num,
          trlr.trlr_size,
          trlr.refrig_flg,
          trlr.trlr_broker,
          trlr.yard_stat,
          trlr.close_dte,
          trlr.pend_dte,
          trlr.autogen_flg,
          trlr.trlr_cod,
          trlr.hot_flg,
          trlr.turn_flg,
          trlr.appt_id,
          trlr.arrdte,
          trlr.client_id,
          trlr.trlr_ref,
          car_move.car_move_id,
          ser_asset.asset_tag,
          rcvtrk.lm_goal_seconds
     from aremst join locmst 
       on (aremst.arecod = locmst.arecod)
      and (aremst.wh_id  = locmst.wh_id)
     left outer join trlr 
       on (locmst.stoloc = trlr.yard_loc)
      and (locmst.wh_id  = trlr.yard_loc_wh_id)
     left outer join car_move 
       on (trlr.trlr_id = car_move.trlr_id)     
     left outer join asset_link
       on (trlr.carcod+ N'|'+trlr.trlr_num = asset_link.asset_num)   
     left outer join ser_asset
       on (asset_link.asset_id = ser_asset.asset_id)
     left outer join (select sum(rcvtrk.lm_goal_seconds) lm_goal_seconds,
                             trlr_id,
                             wh_id
                        from rcvtrk
                    group by trlr_id,
                             wh_id) rcvtrk on (rcvtrk.trlr_id = trlr.trlr_id)
                                          and (rcvtrk.wh_id = trlr.stoloc_wh_id)
    where (aremst.yrdflg = 1 or 
           aremst.rcv_dck_flg = 1 or
           aremst.shp_dck_flg = 1)