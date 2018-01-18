CREATE TABLE [dbo].[shipment_line] (
    [ship_line_id]      NVARCHAR (10)   NOT NULL,
    [ship_id]           NVARCHAR (30)   NOT NULL,
    [wh_id]             NVARCHAR (32)   NULL,
    [client_id]         NVARCHAR (32)   NOT NULL,
    [ordnum]            NVARCHAR (35)   NOT NULL,
    [ordlin]            NVARCHAR (10)   NOT NULL,
    [ordsln]            NVARCHAR (10)   NOT NULL,
    [cons_batch]        NVARCHAR (10)   NULL,
    [shpwth]            NVARCHAR (10)   NULL,
    [linsts]            NVARCHAR (1)    NOT NULL,
    [prcpri]            NVARCHAR (1)    NOT NULL,
    [pckgr1]            NVARCHAR (20)   NULL,
    [pckgr2]            NVARCHAR (20)   NULL,
    [pckgr3]            NVARCHAR (20)   NULL,
    [pckgr4]            NVARCHAR (20)   NULL,
    [schbat]            NVARCHAR (32)   NULL,
    [pckqty]            INT             NOT NULL,
    [inpqty]            INT             NOT NULL,
    [stgqty]            INT             NOT NULL,
    [shpqty]            INT             NOT NULL,
    [oviqty]            INT             NOT NULL,
    [ovramt]            INT             NULL,
    [ovrcod]            NVARCHAR (4)    NULL,
    [edtflg]            INT             DEFAULT ((0)) NULL,
    [tot_pln_cas_qty]   NUMERIC (19, 4) NULL,
    [tot_pln_misc2_qty] NUMERIC (19, 4) NULL,
    [tot_pln_wgt]       NUMERIC (19, 4) NULL,
    [tot_pln_cube]      NUMERIC (19, 4) NULL,
    [tot_pln_misc_qty]  NUMERIC (19, 4) NULL,
    [tot_pln_pal_qty]   NUMERIC (19, 4) NULL,
    [tot_pln_qty]       NUMERIC (19, 4) NULL,
    [unt_ins_val]       NUMERIC (19, 4) NULL,
    [rel_val]           NUMERIC (19, 4) NULL,
    [rel_val_unt_typ]   NVARCHAR (30)   NULL,
    [wkonum]            NVARCHAR (20)   NULL,
    [wkorev]            NVARCHAR (10)   NULL,
    [moddte]            DATETIME        NULL,
    [mod_usr_id]        NVARCHAR (40)   NULL,
    CONSTRAINT [shipment_line_pk] PRIMARY KEY CLUSTERED ([ship_line_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [shp_lin_edtflg_ck] CHECK ([edtflg]=(0) OR [edtflg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [shipment_line_idx1]
    ON [dbo].[shipment_line]([pckgr1] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [shipment_line_idx2]
    ON [dbo].[shipment_line]([ordnum] ASC, [ordlin] ASC, [ordsln] ASC, [client_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [shipment_line_idx3]
    ON [dbo].[shipment_line]([ship_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [shipment_line_idx4]
    ON [dbo].[shipment_line]([schbat] ASC, [pckqty] ASC, [linsts] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [shipment_line_idx5]
    ON [dbo].[shipment_line]([ordnum] ASC, [ordlin] ASC, [ordsln] ASC, [client_id] ASC, [wh_id] ASC, [ship_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [shipment_line_idx6]
    ON [dbo].[shipment_line]([ship_id] ASC, [wh_id] ASC, [client_id] ASC, [ordnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [shipment_line_idx7]
    ON [dbo].[shipment_line]([ship_id] ASC, [wh_id] ASC, [client_id] ASC, [ordnum] ASC, [ordlin] ASC, [ordsln] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [shp_lin_schbat]
    ON [dbo].[shipment_line]([schbat] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [shp_lin_cons_bat]
    ON [dbo].[shipment_line]([cons_batch] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [shp_lin_wrk_ord]
    ON [dbo].[shipment_line]([wkonum] ASC, [wkorev] ASC, [client_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines the shipments in the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipment Line ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'ship_line_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipment ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID - The client code that owns this shipment Line. In a non-3PL system, this value defaults to ''----''. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Line', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'ordlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Sub-Line', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'ordsln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Consolidate Batch', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'cons_batch';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship With', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'shpwth';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Line Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'linsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Processing Priority', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'prcpri';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Group 1', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'pckgr1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Group 2', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'pckgr2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Group 3', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'pckgr3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Group 4', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'pckgr4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Schedule Batch Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'schbat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'pckqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inprocess Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'inpqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Staged Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'stgqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipped Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'shpqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Over-Alloc In-Process Qty', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'oviqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Over-Allocation Amount', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'ovramt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Over-Allocation Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'ovrcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Edited by Host', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'edtflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Total number of cases. This value is to be used only for transportation planning purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'tot_pln_cas_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Total miscellaneous quantity for the order line. This value is to be used only for transportation planning purposes.  ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'tot_pln_misc2_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Holds the total weight of the pieces on the shipment line. This value is to be used only for transportation planning purposes. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'tot_pln_wgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Holds the total cube/volume for the pieces on the order line. This value is to be used only for transporation planning purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'tot_pln_cube';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Total miscellaneous quantity for the order line. This value is to be used only for transportation planning purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'tot_pln_misc_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Total number of pallets. This value is to be used only for transportation planning purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'tot_pln_pal_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Total order Quantity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'tot_pln_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TM only) The total value of the goods on this shipment that need to be insured by the cargo insurance', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'unt_ins_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TM only) The value for a release value basis, this value can be in any currencies', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'rel_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TM only) The unit basis for the release value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'rel_val_unt_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Order Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'wkonum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Order Revision', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'wkorev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date Last Modified', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Modified By', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'shipment_line', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

