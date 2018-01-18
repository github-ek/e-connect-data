CREATE TABLE [dbo].[oub_serv_ord_line] (
    [wh_id]        NVARCHAR (32) NOT NULL,
    [ordnum]       NVARCHAR (35) NOT NULL,
    [client_id]    NVARCHAR (32) NOT NULL,
    [ordlin]       NVARCHAR (10) NOT NULL,
    [ordsln]       NVARCHAR (10) NOT NULL,
    [serv_id]      NVARCHAR (20) NOT NULL,
    [serv_rate_id] NVARCHAR (20) NOT NULL,
    [def_serv_cod] NVARCHAR (10) NULL,
    [serv_req_flg] INT           NOT NULL,
    [ship_id]      NVARCHAR (30) NULL,
    [adddte]       DATETIME      NULL,
    [moddte]       DATETIME      NULL,
    [mod_usr_id]   NVARCHAR (40) NULL,
    CONSTRAINT [oub_serv_ordlin_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [ordnum] ASC, [ordlin] ASC, [ordsln] ASC, [serv_id] ASC, [serv_rate_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The table is used in the Outbound Service Plan View to identify services required for individual order lines. Rows in this table are generated when a shipment is allocated and are based on default services that apply to the order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'oub_serv_ord_line';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Wharehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'oub_serv_ord_line', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'oub_serv_ord_line', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'oub_serv_ord_line', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Line Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'oub_serv_ord_line', @level2type = N'COLUMN', @level2name = N'ordlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Subline Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'oub_serv_ord_line', @level2type = N'COLUMN', @level2name = N'ordsln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'oub_serv_ord_line', @level2type = N'COLUMN', @level2name = N'serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Rate ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'oub_serv_ord_line', @level2type = N'COLUMN', @level2name = N'serv_rate_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default Service Code - specifies what type of default service this entry resulted from.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'oub_serv_ord_line', @level2type = N'COLUMN', @level2name = N'def_serv_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Required - is the user required to perform this service before proceeding?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'oub_serv_ord_line', @level2type = N'COLUMN', @level2name = N'serv_req_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipment ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'oub_serv_ord_line', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Added Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'oub_serv_ord_line', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'oub_serv_ord_line', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'oub_serv_ord_line', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

