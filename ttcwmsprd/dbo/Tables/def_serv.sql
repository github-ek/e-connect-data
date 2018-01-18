CREATE TABLE [dbo].[def_serv] (
    [def_serv_id]      NVARCHAR (20)   NOT NULL,
    [wh_id]            NVARCHAR (32)   NOT NULL,
    [def_serv_cod]     NVARCHAR (10)   NOT NULL,
    [client_id]        NVARCHAR (32)   NULL,
    [carcod]           NVARCHAR (10)   NULL,
    [prtnum]           NVARCHAR (50)   NULL,
    [prt_client_id]    NVARCHAR (32)   NULL,
    [invsts]           NVARCHAR (4)    NULL,
    [invtyp]           NVARCHAR (4)    NULL,
    [supnum]           NVARCHAR (32)   NULL,
    [cstnum]           NVARCHAR (20)   NULL,
    [csttyp]           NVARCHAR (4)    NULL,
    [ordnum]           NVARCHAR (35)   NULL,
    [ordtyp]           NVARCHAR (4)    NULL,
    [ordlin]           NVARCHAR (10)   NULL,
    [ordsln]           NVARCHAR (10)   NULL,
    [dstare]           NVARCHAR (10)   NULL,
    [srvlvl]           NVARCHAR (10)   NULL,
    [serv_id]          NVARCHAR (20)   NOT NULL,
    [serv_rate_id]     NVARCHAR (20)   NULL,
    [serv_req_flg]     INT             NOT NULL,
    [trlr_typ]         NVARCHAR (4)    NULL,
    [vehtyp]           NVARCHAR (10)   NULL,
    [rate_serv_nam]    NVARCHAR (40)   NULL,
    [adr_id]           NVARCHAR (20)   NULL,
    [stop_act_typ]     NVARCHAR (40)   NULL,
    [comcod]           NVARCHAR (32)   NULL,
    [untcst]           NUMERIC (19, 4) NULL,
    [usr_id]           NVARCHAR (40)   NULL,
    [moddte]           DATETIME        NULL,
    [mod_usr_id]       NVARCHAR (40)   NULL,
    [u_version]        INT             NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    [trlr_cod]         NVARCHAR (4)    NULL,
    [crncy_code]       NVARCHAR (4)    NULL,
    [bomnum]           NVARCHAR (30)   NULL,
    [bomlin]           NVARCHAR (10)   NULL,
    [wkonum]           NVARCHAR (20)   NULL,
    [wkorev]           NVARCHAR (10)   NULL,
    [wkolin]           NVARCHAR (10)   NULL,
    CONSTRAINT [def_serv_pk] PRIMARY KEY CLUSTERED ([def_serv_id] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default Services', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default Service ID - system generated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'def_serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default Service Code - specifies what type of default service this is.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'def_serv_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'invtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'cstnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'csttyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'ordtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Line Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'ordlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Subline Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'ordsln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Area', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'dstare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Level', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'srvlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Rate ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'serv_rate_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Requeired - is the user required to perform this service before proceeding.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'serv_req_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Trailer Type is a user-defined value that can be assigned to the trailer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'trlr_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Vehicle Type is a user-defined value that can be assigned to the RF device.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'vehtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Transportation Rating Service.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'rate_serv_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Address Transportation Operation address identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Address Transportation Operation stop action type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'stop_act_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Commodity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'comcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit Cost - Compares to item cost to determine if service is applied.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'untcst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines the trailer as either a Shipping or Receiving trailer. Trailer Code options are RCV or SHIP.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'trlr_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Currency Code for the Currency fields in the table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'crncy_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'BOM number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'bomnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'BOM line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'bomlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Order Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'wkonum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Order Revision.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'wkorev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Order Detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'def_serv', @level2type = N'COLUMN', @level2name = N'wkolin';

