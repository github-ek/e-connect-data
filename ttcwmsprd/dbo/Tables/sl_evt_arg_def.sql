CREATE TABLE [dbo].[sl_evt_arg_def] (
    [evt_id]           NVARCHAR (30)  NOT NULL,
    [evt_arg_id]       NVARCHAR (30)  NOT NULL,
    [evt_arg_descr]    NVARCHAR (250) NULL,
    [data_typ_cd]      NVARCHAR (5)   NOT NULL,
    [require_flg]      NVARCHAR (1)   NOT NULL,
    [u_version]        NUMERIC (5)    NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [sl_evt_arg_def_pk] PRIMARY KEY CLUSTERED ([evt_id] ASC, [evt_arg_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_evtargdeffkevt] FOREIGN KEY ([evt_id]) REFERENCES [dbo].[sl_evt_def] ([evt_id]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines event argument data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_arg_def';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) Event name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_arg_def', @level2type = N'COLUMN', @level2name = N'evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Event argument name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_arg_def', @level2type = N'COLUMN', @level2name = N'evt_arg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of event argument', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_arg_def', @level2type = N'COLUMN', @level2name = N'evt_arg_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The data type of event argument: C = Character, D = Date/Time, N = Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_arg_def', @level2type = N'COLUMN', @level2name = N'data_typ_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Required flag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_arg_def', @level2type = N'COLUMN', @level2name = N'require_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_arg_def', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_arg_def', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_arg_def', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_arg_def', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_arg_def', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

