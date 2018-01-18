CREATE TABLE [dbo].[les_ath_role] (
    [role_id]      NVARCHAR (20)   NOT NULL,
    [ena_flg]      INT             NULL,
    [par_role_id]  NVARCHAR (20)   NULL,
    [ath_grp_nam]  NVARCHAR (40)   NULL,
    [adj_thr_cst]  NUMERIC (19, 4) NULL,
    [adj_thr_unit] INT             NULL,
    [grp_nam]      NVARCHAR (40)   NULL,
    CONSTRAINT [les_ath_role_pk] PRIMARY KEY CLUSTERED ([role_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [lesathrol_enaflgck] CHECK ([ena_flg]=(0) OR [ena_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table lists all known roles on a system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_ath_role';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_ath_role', @level2type = N'COLUMN', @level2name = N'role_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is this role currently enabled', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_ath_role', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The parent of this role.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_ath_role', @level2type = N'COLUMN', @level2name = N'par_role_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Role adjustment threshold cost value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_ath_role', @level2type = N'COLUMN', @level2name = N'adj_thr_cst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Role adjustment threshold unit value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_ath_role', @level2type = N'COLUMN', @level2name = N'adj_thr_unit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_ath_role', @level2type = N'COLUMN', @level2name = N'grp_nam';

