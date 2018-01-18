create view dbo.shipping_pckwrk_view as 
    select stop.stop_id,
           stop.car_move_id,
           stop.adr_id stop_adr_id,
           shipment.carcod,
           shipment.shpsts,
           shipment.srvlvl,
           car_move.trlr_id,
           ord.st_adr_id,
           ord.bt_adr_id,
           ord.rt_adr_id,
           pckwrk_view.*
      from pckwrk_view join ord 
        on (pckwrk_view.ordnum    = ord.ordnum)
       and (pckwrk_view.client_id = ord.client_id)
      join shipment 
        on (pckwrk_view.ship_id = shipment.ship_id)
      left outer join stop 
        on (shipment.stop_id = stop.stop_id)
      left outer join car_move 
        on (stop.car_move_id = car_move.car_move_id)
     where shipment.ship_id is not null