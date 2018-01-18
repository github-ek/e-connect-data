CREATE TABLE [dbo].[asset_carton] (
    [wh_id]            NVARCHAR (32) NOT NULL,
    [asset_typ]        NVARCHAR (30) NOT NULL,
    [ctncod]           NVARCHAR (4)  NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [asset_carton_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [asset_typ] ASC, [ctncod] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table specifies the carton types or codes supported by each of the asset types. This will be a child table of Asset_typ.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_carton';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_carton', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The asset type to which the carton code is assigned.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_carton', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The carton code being used for the asset type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_carton', @level2type = N'COLUMN', @level2name = N'ctncod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_carton', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_carton', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_carton', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'asset_carton', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

