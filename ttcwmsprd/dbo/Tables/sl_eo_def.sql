CREATE TABLE [dbo].[sl_eo_def] (
    [eo_id]             NVARCHAR (30)  NOT NULL,
    [eo_ver]            NVARCHAR (15)  NOT NULL,
    [eo_descr]          NVARCHAR (250) NULL,
    [evt_id]            NVARCHAR (30)  NOT NULL,
    [always_create_flg] NVARCHAR (1)   NULL,
    [u_version]         NUMERIC (5)    NULL,
    [ins_dt]            DATETIME       NULL,
    [last_upd_dt]       DATETIME       NULL,
    [ins_user_id]       NVARCHAR (40)  NULL,
    [last_upd_user_id]  NVARCHAR (40)  NULL,
    CONSTRAINT [sl_eo_def_pk] PRIMARY KEY CLUSTERED ([eo_id] ASC, [eo_ver] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_eo_def_fk_evt] FOREIGN KEY ([evt_id]) REFERENCES [dbo].[sl_evt_def] ([evt_id])
);


GO
CREATE NONCLUSTERED INDEX [sl_eo_def_fk_evt]
    ON [dbo].[sl_eo_def]([evt_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines event outputs.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_def';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Event output name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_def', @level2type = N'COLUMN', @level2name = N'eo_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Event output version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_def', @level2type = N'COLUMN', @level2name = N'eo_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of event output', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_def', @level2type = N'COLUMN', @level2name = N'eo_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) Event name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_def', @level2type = N'COLUMN', @level2name = N'evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag for always create (currently not used)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_def', @level2type = N'COLUMN', @level2name = N'always_create_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_def', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_def', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_def', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_def', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_eo_def', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

