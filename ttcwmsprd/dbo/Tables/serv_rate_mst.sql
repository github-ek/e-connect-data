CREATE TABLE [dbo].[serv_rate_mst] (
    [serv_rate_id] NVARCHAR (20) NOT NULL,
    [qty_by_cod]   NVARCHAR (10) NOT NULL,
    [moddte]       DATETIME      NULL,
    [mod_usr_id]   NVARCHAR (40) NULL,
    CONSTRAINT [serv_rate_mst_pk] PRIMARY KEY CLUSTERED ([serv_rate_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents Service Rate Master', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_rate_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Rate ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_rate_mst', @level2type = N'COLUMN', @level2name = N'serv_rate_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity By Code - determines how the quantity should be evaluated. Options are: LOAD', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_rate_mst', @level2type = N'COLUMN', @level2name = N'qty_by_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_rate_mst', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_rate_mst', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

