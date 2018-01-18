CREATE TABLE [dbo].[sl_evt_def] (
    [evt_id]           NVARCHAR (30)  NOT NULL,
    [evt_descr]        NVARCHAR (250) NULL,
    [log_evt_flg]      NVARCHAR (1)   NULL,
    [evt_grp_id]       NVARCHAR (30)  NULL,
    [u_version]        NUMERIC (5)    NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [sl_evt_def_pk] PRIMARY KEY CLUSTERED ([evt_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_evt_def_fk_grp] FOREIGN KEY ([evt_grp_id]) REFERENCES [dbo].[sl_evt_def_grp] ([evt_grp_id])
);


GO
CREATE NONCLUSTERED INDEX [sl_evt_def_fk_grp]
    ON [dbo].[sl_evt_def]([evt_grp_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines event.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_def';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Event name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_def', @level2type = N'COLUMN', @level2name = N'evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of event', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_def', @level2type = N'COLUMN', @level2name = N'evt_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag for log event', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_def', @level2type = N'COLUMN', @level2name = N'log_evt_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) Event group name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_def', @level2type = N'COLUMN', @level2name = N'evt_grp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_def', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_def', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_def', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_def', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_def', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

