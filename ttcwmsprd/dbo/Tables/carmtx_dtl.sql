CREATE TABLE [dbo].[carmtx_dtl] (
    [carmtx_id]        INT            NOT NULL,
    [colnam]           NVARCHAR (100) NOT NULL,
    [colval]           NVARCHAR (200) NOT NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [carmtxdtl_pk] PRIMARY KEY CLUSTERED ([carmtx_id] ASC, [colnam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Carrier Matrix Detail table will be used to store the details that are defined for a carrier matrix header. This is the child table to carrier matrix header table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carmtx_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System generated identifier used to identify the carrier matrix header.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carmtx_dtl', @level2type = N'COLUMN', @level2name = N'carmtx_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Column Name - These column names are stored in codmst and represent the entities whether they be postal code, item family, cubic volume, estimated pallets, etc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carmtx_dtl', @level2type = N'COLUMN', @level2name = N'colnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Column Value - These are the actual values of the column.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carmtx_dtl', @level2type = N'COLUMN', @level2name = N'colval';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carmtx_dtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carmtx_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carmtx_dtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carmtx_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

