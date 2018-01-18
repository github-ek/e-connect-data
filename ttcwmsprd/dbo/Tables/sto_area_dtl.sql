CREATE TABLE [dbo].[sto_area_dtl] (
    [sto_area_id]      NVARCHAR (20)  NOT NULL,
    [colnam]           NVARCHAR (100) NOT NULL,
    [colval]           NVARCHAR (200) NOT NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [sto_area_dtl_pk] PRIMARY KEY CLUSTERED ([sto_area_id] ASC, [colnam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The table is used to store the area preferences details for storage of the inventory on putaway.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage Area Header ID -Unique Id to identify the storage rule. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_dtl', @level2type = N'COLUMN', @level2name = N'sto_area_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Column Name- Indicates the storage options for which the storage rule apply. This values are distributed in codmst for colnam as sto_area_dtl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_dtl', @level2type = N'COLUMN', @level2name = N'colnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Column Value -Indicates the specific column value for which the storage rule apply.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_dtl', @level2type = N'COLUMN', @level2name = N'colval';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_dtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_dtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sto_area_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

