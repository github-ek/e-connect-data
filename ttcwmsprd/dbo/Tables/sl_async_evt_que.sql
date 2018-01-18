CREATE TABLE [dbo].[sl_async_evt_que] (
    [async_evt_que_seq] NUMERIC (12)  NOT NULL,
    [async_evt_dt]      DATETIME      NULL,
    [evt_id]            NVARCHAR (30) NOT NULL,
    [sys_id]            NVARCHAR (30) NOT NULL,
    [evt_user_id]       NVARCHAR (40) NULL,
    [async_evt_stat_cd] NVARCHAR (5)  NULL,
    [work_user_id]      NVARCHAR (40) NULL,
    [ins_dt]            DATETIME      NULL,
    [last_upd_dt]       DATETIME      NULL,
    [ins_user_id]       NVARCHAR (40) NULL,
    [last_upd_user_id]  NVARCHAR (40) NULL,
    CONSTRAINT [sl_asyncevtquepk] PRIMARY KEY CLUSTERED ([async_evt_que_seq] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines asynchronous event queue.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_async_evt_que';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The asychronous event queue sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_async_evt_que', @level2type = N'COLUMN', @level2name = N'async_evt_que_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The asychronous event date/time', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_async_evt_que', @level2type = N'COLUMN', @level2name = N'async_evt_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The event name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_async_evt_que', @level2type = N'COLUMN', @level2name = N'evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The triggering system', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_async_evt_que', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who logged this event', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_async_evt_que', @level2type = N'COLUMN', @level2name = N'evt_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The asychronous event status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_async_evt_que', @level2type = N'COLUMN', @level2name = N'async_evt_stat_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who worked on this event', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_async_evt_que', @level2type = N'COLUMN', @level2name = N'work_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_async_evt_que', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_async_evt_que', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_async_evt_que', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_async_evt_que', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

