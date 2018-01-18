CREATE TABLE [dbo].[sl_sys_comm] (
    [sys_id]           NVARCHAR (30) NOT NULL,
    [comm_mode_cd]     NVARCHAR (5)  NOT NULL,
    [comm_dir_cd]      NVARCHAR (5)  NOT NULL,
    [comm_mthd_id]     NVARCHAR (30) NOT NULL,
    [head_evt_id]      NVARCHAR (30) NULL,
    [tail_evt_id]      NVARCHAR (30) NULL,
    [u_version]        NUMERIC (5)   NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [sl_sys_comm_pk] PRIMARY KEY CLUSTERED ([sys_id] ASC, [comm_mode_cd] ASC, [comm_dir_cd] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_sys_comm_fk_sys] FOREIGN KEY ([sys_id]) REFERENCES [dbo].[sl_sys_def] ([sys_id]),
    CONSTRAINT [sl_syscmfkcm] FOREIGN KEY ([comm_mthd_id]) REFERENCES [dbo].[sl_comm_mthd_def] ([comm_mthd_id]),
    CONSTRAINT [sl_syscmfkevth] FOREIGN KEY ([head_evt_id]) REFERENCES [dbo].[sl_evt_def] ([evt_id]),
    CONSTRAINT [sl_syscmfkevtt] FOREIGN KEY ([tail_evt_id]) REFERENCES [dbo].[sl_evt_def] ([evt_id])
);


GO
CREATE NONCLUSTERED INDEX [sl_syscmfkcm]
    ON [dbo].[sl_sys_comm]([comm_mthd_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_syscmfkevth]
    ON [dbo].[sl_sys_comm]([head_evt_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_syscmfkevtt]
    ON [dbo].[sl_sys_comm]([tail_evt_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines system communication.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The communication mode code: ASYNC = Asynchronous, SYNCD = Synchronous Delivery, SYNCE = Synchronous Except Send', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm', @level2type = N'COLUMN', @level2name = N'comm_mode_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The communication direction: I = Inbound, O = Outbound', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm', @level2type = N'COLUMN', @level2name = N'comm_dir_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The communication method name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm', @level2type = N'COLUMN', @level2name = N'comm_mthd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The header event name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm', @level2type = N'COLUMN', @level2name = N'head_evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The tail event name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm', @level2type = N'COLUMN', @level2name = N'tail_evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_comm', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

