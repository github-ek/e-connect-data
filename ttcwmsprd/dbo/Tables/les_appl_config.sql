CREATE TABLE [dbo].[les_appl_config] (
    [user_id]   NVARCHAR (40)  NOT NULL,
    [locale_id] NVARCHAR (20)  NOT NULL,
    [appl_id]   NVARCHAR (20)  NOT NULL,
    [frm_id]    NVARCHAR (40)  NOT NULL,
    [ctl_nam]   NVARCHAR (30)  NOT NULL,
    [prf_lbl]   NVARCHAR (50)  NOT NULL,
    [srt_seq]   NVARCHAR (2)   NULL,
    [prf_num]   INT            NULL,
    [prf_str]   NVARCHAR (255) NULL,
    [grp_nam]   NVARCHAR (40)  NULL,
    CONSTRAINT [les_appl_config_pk] PRIMARY KEY CLUSTERED ([user_id] ASC, [locale_id] ASC, [appl_id] ASC, [frm_id] ASC, [ctl_nam] ASC, [prf_lbl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_appl_config';

