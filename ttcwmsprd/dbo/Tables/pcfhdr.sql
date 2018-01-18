CREATE TABLE [dbo].[pcfhdr] (
    [pcfkey]     NVARCHAR (30) NOT NULL,
    [client_id]  NVARCHAR (32) NOT NULL,
    [supnum]     NVARCHAR (32) NOT NULL,
    [wh_id]      NVARCHAR (32) NOT NULL,
    [pcftyp]     NVARCHAR (1)  NULL,
    [moddte]     DATETIME      NULL,
    [mod_usr_id] NVARCHAR (40) NULL,
    CONSTRAINT [pcfhdr_pk] PRIMARY KEY CLUSTERED ([pcfkey] ASC, [supnum] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to represent item configuration details. It is maintained by Item Configuration Maintenance. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcfhdr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item configuration key', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcfhdr', @level2type = N'COLUMN', @level2name = N'pcfkey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcfhdr', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcfhdr', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcfhdr', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item configuration type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcfhdr', @level2type = N'COLUMN', @level2name = N'pcftyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date last modified', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcfhdr', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last modified by', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcfhdr', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

