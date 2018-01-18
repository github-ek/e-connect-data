CREATE TABLE [dbo].[sl_alt_evt_arg_def] (
    [evt_id]            NVARCHAR (30)  NOT NULL,
    [evt_arg_id]        NVARCHAR (30)  NOT NULL,
    [evt_arg_alt_genid] NVARCHAR (60)  NOT NULL,
    [sys_id]            NVARCHAR (30)  NULL,
    [ifd_id]            NVARCHAR (30)  NULL,
    [ifd_ver]           NVARCHAR (15)  NULL,
    [alt_evt_arg_id]    NVARCHAR (MAX) NOT NULL,
    [u_version]         NUMERIC (5)    NULL,
    [ins_dt]            DATETIME       NULL,
    [last_upd_dt]       DATETIME       NULL,
    [ins_user_id]       NVARCHAR (40)  NULL,
    [last_upd_user_id]  NVARCHAR (40)  NULL,
    CONSTRAINT [sl_altevtargdefpk] PRIMARY KEY CLUSTERED ([evt_id] ASC, [evt_arg_id] ASC, [evt_arg_alt_genid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_tevtargdeffkarg] FOREIGN KEY ([evt_id], [evt_arg_id]) REFERENCES [dbo].[sl_evt_arg_def] ([evt_id], [evt_arg_id]) ON DELETE CASCADE,
    CONSTRAINT [sl_tevtargdeffkifd] FOREIGN KEY ([ifd_id], [ifd_ver]) REFERENCES [dbo].[sl_ifd_def] ([ifd_id], [ifd_ver]) ON DELETE CASCADE,
    CONSTRAINT [sl_tevtargdeffksys] FOREIGN KEY ([sys_id]) REFERENCES [dbo].[sl_sys_def] ([sys_id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [sl_tevtargdeffkifd]
    ON [dbo].[sl_alt_evt_arg_def]([ifd_id] ASC, [ifd_ver] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_tevtargdeffksys]
    ON [dbo].[sl_alt_evt_arg_def]([sys_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines alternative event argument expression.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alt_evt_arg_def';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alt_evt_arg_def', @level2type = N'COLUMN', @level2name = N'evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event argument', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alt_evt_arg_def', @level2type = N'COLUMN', @level2name = N'evt_arg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Generated identify for alternative event argument expression', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alt_evt_arg_def', @level2type = N'COLUMN', @level2name = N'evt_arg_alt_genid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alt_evt_arg_def', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The inbound IFD name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alt_evt_arg_def', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The inbound IFD Version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alt_evt_arg_def', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Alternative event argument expression', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alt_evt_arg_def', @level2type = N'COLUMN', @level2name = N'alt_evt_arg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alt_evt_arg_def', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alt_evt_arg_def', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alt_evt_arg_def', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alt_evt_arg_def', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alt_evt_arg_def', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

