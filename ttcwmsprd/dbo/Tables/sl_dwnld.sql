CREATE TABLE [dbo].[sl_dwnld] (
    [dwnld_seq]        NUMERIC (12)   NOT NULL,
    [sys_id]           NVARCHAR (30)  NOT NULL,
    [dwnld_stat_cd]    NVARCHAR (5)   NULL,
    [dwnld_info]       NVARCHAR (500) NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    [dwnld_dt]         DATETIME       NOT NULL,
    [xml_flg]          NVARCHAR (1)   NULL,
    [modified_flg]     NVARCHAR (1)   NULL,
    [ext_codepage]     NVARCHAR (50)  NULL,
    CONSTRAINT [sl_dwnld_pk] PRIMARY KEY CLUSTERED ([dwnld_seq] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [sl_dldskdlddt]
    ON [dbo].[sl_dwnld]([dwnld_dt] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_dldskdldstatcd]
    ON [dbo].[sl_dwnld]([dwnld_stat_cd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_dwnld_sk_ins_dt]
    ON [dbo].[sl_dwnld]([ins_dt] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines download data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dwnld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The download sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dwnld', @level2type = N'COLUMN', @level2name = N'dwnld_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The download system', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dwnld', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The download status: EDONE = Event Done, EERR = Error, EPROC = Event Being Processed, ID = Download Idenitifed, NEW = New Download', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dwnld', @level2type = N'COLUMN', @level2name = N'dwnld_stat_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The download information', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dwnld', @level2type = N'COLUMN', @level2name = N'dwnld_info';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dwnld', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dwnld', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dwnld', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dwnld', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The download date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dwnld', @level2type = N'COLUMN', @level2name = N'dwnld_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is download data in XML format?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dwnld', @level2type = N'COLUMN', @level2name = N'xml_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is download data modified?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dwnld', @level2type = N'COLUMN', @level2name = N'modified_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The external code page that download was identified with', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_dwnld', @level2type = N'COLUMN', @level2name = N'ext_codepage';

