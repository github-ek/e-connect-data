CREATE TABLE [dbo].[sl_cache_parm] (
    [cache_id]             NVARCHAR (30)  NOT NULL,
    [cache_descr]          NVARCHAR (250) NULL,
    [ena_flg]              NVARCHAR (1)   NOT NULL,
    [cache_siz]            NUMERIC (5)    NOT NULL,
    [cache_ageout_pct]     NUMERIC (3)    NOT NULL,
    [def_cache_siz]        NUMERIC (5)    NOT NULL,
    [def_cache_ageout_pct] NUMERIC (3)    NOT NULL,
    [u_version]            NUMERIC (5)    NULL,
    [ins_dt]               DATETIME       NULL,
    [last_upd_dt]          DATETIME       NULL,
    [ins_user_id]          NVARCHAR (40)  NULL,
    [last_upd_user_id]     NVARCHAR (40)  NULL,
    CONSTRAINT [sl_cache_parm_pk] PRIMARY KEY CLUSTERED ([cache_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines the configuration of cache size.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_cache_parm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The cache identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_cache_parm', @level2type = N'COLUMN', @level2name = N'cache_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of cache', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_cache_parm', @level2type = N'COLUMN', @level2name = N'cache_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enable the configuration of cache size', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_cache_parm', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The size of cache', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_cache_parm', @level2type = N'COLUMN', @level2name = N'cache_siz';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Obsolete) The percent of agent out cache size', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_cache_parm', @level2type = N'COLUMN', @level2name = N'cache_ageout_pct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Obsolete) The default size of cache', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_cache_parm', @level2type = N'COLUMN', @level2name = N'def_cache_siz';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Obsolete) The default percent of agent out cache size', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_cache_parm', @level2type = N'COLUMN', @level2name = N'def_cache_ageout_pct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_cache_parm', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_cache_parm', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_cache_parm', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_cache_parm', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_cache_parm', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

