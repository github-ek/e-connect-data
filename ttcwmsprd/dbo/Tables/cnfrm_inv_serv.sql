CREATE TABLE [dbo].[cnfrm_inv_serv] (
    [cnfrm_serv_id] NVARCHAR (20) NOT NULL,
    [invtid]        NVARCHAR (30) NOT NULL,
    [alt_idn]       NVARCHAR (30) NULL,
    [lodlvl]        NVARCHAR (1)  NOT NULL,
    [wh_id]         NVARCHAR (32) NOT NULL,
    [serv_id]       NVARCHAR (20) NOT NULL,
    [serv_req_flg]  INT           NOT NULL,
    [exitpnt_typ]   NVARCHAR (30) NOT NULL,
    [exitpnt]       NVARCHAR (15) NOT NULL,
    [srtseq]        INT           NOT NULL,
    [cmp_usr_id]    NVARCHAR (40) NULL,
    [cmpflg]        INT           NOT NULL,
    [cmpdte]        DATETIME      NULL,
    [serv_result]   NVARCHAR (10) NULL,
    [trknum]        NVARCHAR (20) NULL,
    [invnum]        NVARCHAR (35) NULL,
    [supnum]        NVARCHAR (32) NULL,
    [client_id]     NVARCHAR (32) NULL,
    [invlin]        NVARCHAR (10) NULL,
    [invsln]        NVARCHAR (10) NULL,
    [invsts]        NVARCHAR (4)  NULL,
    [prtnum]        NVARCHAR (50) NULL,
    [prt_client_id] NVARCHAR (32) NULL,
    [untqty]        INT           NOT NULL,
    [ordnum]        NVARCHAR (35) NULL,
    [ordlin]        NVARCHAR (10) NULL,
    [ordsln]        NVARCHAR (10) NULL,
    [ship_id]       NVARCHAR (30) NULL,
    [usr_id]        NVARCHAR (40) NULL,
    [dstloc]        NVARCHAR (20) NULL,
    [adddte]        DATETIME      NULL,
    [moddte]        DATETIME      NULL,
    [mod_usr_id]    NVARCHAR (40) NULL,
    [devcod]        NVARCHAR (20) NULL,
    CONSTRAINT [cnfrm_inv_serv_pk] PRIMARY KEY CLUSTERED ([cnfrm_serv_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The confirm inventory service table is the table that confirm the services of the inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Service ID - unique Base 36 system-generated sequence to identify a service confirmation record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'cnfrm_serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'invtid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Alternate Identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'alt_idn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Level - currently we only support a load level of ''L''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Requeired - is the user required to perform this service before proceeding?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'serv_req_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exit Point Type - determines the general process during which the exit point was evaluated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'exitpnt_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exit Point - determines when this service was required during the service process.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'exitpnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort Sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Complete User ID - the user that completed this service.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'cmp_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Complete Flag - was this service completed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'cmpflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Results - what was the result of this service?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'serv_result';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Truck Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'trknum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'invnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Line Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'invlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Subline Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'invsln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Status - default to ''----''', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'untqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Number - for Future use', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Line Number - for Future use', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'ordlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order SubLine Number - for Future use', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'ordsln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipment ID - Since an order can be split amongst multiple shipments, this defines the shipment that the order line was allocated for.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'dstloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Added Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Device code on which the workflow is done. It would be the device code when the workflow is done on RF or the work station number when it is done in GUI', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_inv_serv', @level2type = N'COLUMN', @level2name = N'devcod';

