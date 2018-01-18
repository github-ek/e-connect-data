CREATE TABLE [dbo].[tm_serv_cond_ord] (
    [wh_id]        NVARCHAR (32) NOT NULL,
    [ordnum]       NVARCHAR (35) NOT NULL,
    [client_id]    NVARCHAR (32) NOT NULL,
    [serv_cond_id] NVARCHAR (20) NOT NULL,
    [adddte]       DATETIME      NULL,
    [moddte]       DATETIME      NULL,
    [mod_usr_id]   NVARCHAR (40) NULL,
    CONSTRAINT [tm_serv_cond_ord_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [ordnum] ASC, [client_id] ASC, [serv_cond_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The tm_serv_cond_ord table tracks the service conditions for the order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tm_serv_cond_ord';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Wharehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tm_serv_cond_ord', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tm_serv_cond_ord', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tm_serv_cond_ord', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Condition ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tm_serv_cond_ord', @level2type = N'COLUMN', @level2name = N'serv_cond_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Added Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tm_serv_cond_ord', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tm_serv_cond_ord', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tm_serv_cond_ord', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

