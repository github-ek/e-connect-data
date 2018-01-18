CREATE TABLE [dbo].[prop_frm] (
    [frm_id]  NVARCHAR (40) NOT NULL,
    [var_nam] NVARCHAR (40) NOT NULL,
    [grp_nam] NVARCHAR (40) NULL,
    CONSTRAINT [prop_frm_pk] PRIMARY KEY CLUSTERED ([frm_id] ASC, [var_nam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is not currently in use.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prop_frm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prop_frm', @level2type = N'COLUMN', @level2name = N'grp_nam';

