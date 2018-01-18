CREATE TABLE [dbo].[bomdtl_prc] (
    [bomnum]           NVARCHAR (30) NOT NULL,
    [client_id]        NVARCHAR (32) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [bomlin]           NVARCHAR (10) NOT NULL,
    [wko_typ]          NVARCHAR (10) NOT NULL,
    [prcloc]           NVARCHAR (20) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [bomdtl_prc_pk] PRIMARY KEY CLUSTERED ([bomnum] ASC, [bomlin] ASC, [wh_id] ASC, [client_id] ASC, [wko_typ] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This tables is added to trace the processing station information linked to the BOM detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl_prc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identify of this BOM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl_prc', @level2type = N'COLUMN', @level2name = N'bomnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID of the BOM line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl_prc', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID of the BOM line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl_prc', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identify of this BOM line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl_prc', @level2type = N'COLUMN', @level2name = N'bomlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The work order type will be used to determine the processing station for the work order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl_prc', @level2type = N'COLUMN', @level2name = N'wko_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The default process station for the work order line created by this bom line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl_prc', @level2type = N'COLUMN', @level2name = N'prcloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl_prc', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl_prc', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl_prc', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomdtl_prc', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

