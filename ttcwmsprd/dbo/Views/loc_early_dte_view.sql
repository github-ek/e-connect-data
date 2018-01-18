create view dbo.loc_early_dte_view as 
    select locmst.stoloc,
           min(ship_struct_view.early_shpdte) early_shpdte,
           min(appt.start_dte) appt_dte, (case when min(ship_struct_view.early_shpdte) is null then  0 else  1 end) early_shpdte_flg, (case when min(appt.start_dte) is null then  0 else  1 end) appt_dte_flg,
           locmst.wh_id
      from locmst
      left outer join invsum
        on locmst.stoloc = invsum.stoloc
       and locmst.wh_id  = invsum.wh_id
       and locmst.arecod = invsum.arecod 
      left outer join ord_line
        on invsum.prtnum = ord_line.prtnum
       and invsum.prt_client_id = ord_line.client_id 
       and invsum.wh_id = ord_line.wh_id
      left outer join shipment_line
        on ord_line.client_id = shipment_line.client_id 
       and ord_line.ordnum = shipment_line.ordnum
       and ord_line.ordlin = shipment_line.ordlin
       and ord_line.ordsln = shipment_line.ordsln
       and ord_line.wh_id = shipment_line.wh_id
      left outer join ship_struct_view
        on shipment_line.ship_id = ship_struct_view.ship_id
      left outer join appt
        on ship_struct_view.appt_id = appt.appt_id
  group by locmst.wh_id,
           locmst.stoloc