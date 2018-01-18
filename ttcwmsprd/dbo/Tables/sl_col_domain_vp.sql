CREATE TABLE [dbo].[sl_col_domain_vp] (
    [col_domain_id]     NVARCHAR (30)  NOT NULL,
    [col_domain_vp_seq] NUMERIC (6)    NOT NULL,
    [col_domain_vp_val] NVARCHAR (60)  NULL,
    [col_domain_vp_rep] NVARCHAR (100) NULL,
    [u_version]         NUMERIC (5)    NULL,
    [ins_dt]            DATETIME       NULL,
    [last_upd_dt]       DATETIME       NULL,
    [ins_user_id]       NVARCHAR (40)  NULL,
    [last_upd_user_id]  NVARCHAR (40)  NULL,
    CONSTRAINT [sl_coldomvppk] PRIMARY KEY CLUSTERED ([col_domain_id] ASC, [col_domain_vp_seq] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_coldomvpfkcdmn] FOREIGN KEY ([col_domain_id]) REFERENCES [dbo].[sl_col_domain] ([col_domain_id]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines the valid possibilities of the column domain.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain_vp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) Column Domain identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain_vp', @level2type = N'COLUMN', @level2name = N'col_domain_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The sequence of the valid possibilities of the column domain', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain_vp', @level2type = N'COLUMN', @level2name = N'col_domain_vp_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The value of the valid possibilities of the column domain', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain_vp', @level2type = N'COLUMN', @level2name = N'col_domain_vp_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The represent of the valid possibilities of the column domain', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain_vp', @level2type = N'COLUMN', @level2name = N'col_domain_vp_rep';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain_vp', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain_vp', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain_vp', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain_vp', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_col_domain_vp', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

