CREATE TABLE [dbo].[sl_evt_data] (
    [evt_data_seq]     NUMERIC (12)  NOT NULL,
    [evt_id]           NVARCHAR (30) NOT NULL,
    [evt_dt]           DATETIME      NOT NULL,
    [evt_ts]           NUMERIC (20)  NULL,
    [evt_cmpl_dt]      DATETIME      NULL,
    [evt_cmpl_ts]      NUMERIC (20)  NULL,
    [evt_user_id]      NVARCHAR (40) NOT NULL,
    [evt_stat_cd]      NVARCHAR (5)  NOT NULL,
    [sys_id]           NVARCHAR (30) NOT NULL,
    [ifd_id]           NVARCHAR (30) NULL,
    [ifd_ver]          NVARCHAR (15) NULL,
    [work_user_id]     NVARCHAR (40) NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [sl_evt_data_pk] PRIMARY KEY CLUSTERED ([evt_data_seq] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [sl_evtdtskevtdt]
    ON [dbo].[sl_evt_data]([evt_dt] ASC, [evt_data_seq] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_evt_data_sk_evt]
    ON [dbo].[sl_evt_data]([evt_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_evt_data_sk_ifd]
    ON [dbo].[sl_evt_data]([ifd_id] ASC, [ifd_ver] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_vtdtskevtstatcd]
    ON [dbo].[sl_evt_data]([evt_stat_cd] ASC, [evt_data_seq] ASC, [work_user_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains event data for events that have been logged.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Event data sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data', @level2type = N'COLUMN', @level2name = N'evt_data_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Event name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data', @level2type = N'COLUMN', @level2name = N'evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of event', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data', @level2type = N'COLUMN', @level2name = N'evt_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time stamp of event', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data', @level2type = N'COLUMN', @level2name = N'evt_ts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Complete date of event', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data', @level2type = N'COLUMN', @level2name = N'evt_cmpl_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Complete time stamp of event', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data', @level2type = N'COLUMN', @level2name = N'evt_cmpl_ts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User of event', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data', @level2type = N'COLUMN', @level2name = N'evt_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Event status: EB = Blocked, EC = EO Complete, EE = Event Error, EN = No data for EO, ES = Event Submitted, IC = IFD Complete, IE = IFD Creation Error, IN = IFD With No Data, SC = Event Sent, SE = Send Error', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data', @level2type = N'COLUMN', @level2name = N'evt_stat_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'IFD name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work user name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data', @level2type = N'COLUMN', @level2name = N'work_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_evt_data', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

