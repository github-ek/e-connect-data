CREATE TABLE [dbo].[wh_serv_invsts] (
    [serv_id]    NVARCHAR (20) NOT NULL,
    [wh_id]      NVARCHAR (32) NOT NULL,
    [invsts]     NVARCHAR (4)  NOT NULL,
    [moddte]     DATETIME      NULL,
    [mod_usr_id] NVARCHAR (40) NULL,
    CONSTRAINT [wh_serv_invsts_pk] PRIMARY KEY CLUSTERED ([serv_id] ASC, [wh_id] ASC, [invsts] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The warehouse service inventory status table is the table that defines the inventory status of the service in the warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv_invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv_invsts', @level2type = N'COLUMN', @level2name = N'serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'WareHouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv_invsts', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv_invsts', @level2type = N'COLUMN', @level2name = N'invsts';

