CREATE TABLE [dbo].[sl_msg_log] (
    [msg_log_seq]       NUMERIC (12)   NOT NULL,
    [msg_log_dtl_seq]   NUMERIC (6)    NOT NULL,
    [msg_log_dt]        DATETIME       NULL,
    [user_id]           NVARCHAR (40)  NULL,
    [src_file]          NVARCHAR (40)  NULL,
    [src_line_num]      NUMERIC (5)    NULL,
    [func_name]         NVARCHAR (40)  NULL,
    [stat]              NUMERIC (12)   NULL,
    [async_evt_que_seq] NUMERIC (12)   NULL,
    [dwnld_seq]         NUMERIC (12)   NULL,
    [in_sys_id]         NVARCHAR (30)  NULL,
    [in_ifd_id]         NVARCHAR (30)  NULL,
    [in_ifd_ver]        NVARCHAR (15)  NULL,
    [in_ifd_data_seq]   NUMERIC (12)   NULL,
    [evt_data_seq]      NUMERIC (12)   NULL,
    [evt_sys_id]        NVARCHAR (30)  NULL,
    [evt_id]            NVARCHAR (30)  NULL,
    [def_typ_cd]        NVARCHAR (5)   NULL,
    [data_hdr_seq]      NUMERIC (12)   NULL,
    [data_dtl_seq]      NUMERIC (6)    NULL,
    [def_id]            NVARCHAR (30)  NULL,
    [def_ver]           NVARCHAR (15)  NULL,
    [seg_id]            NVARCHAR (30)  NULL,
    [out_sys_id]        NVARCHAR (30)  NULL,
    [comm_mthd_id]      NVARCHAR (30)  NULL,
    [comm_mode_cd]      NVARCHAR (5)   NULL,
    [comm_dir_cd]       NVARCHAR (5)   NULL,
    [msg_log_data]      NVARCHAR (MAX) NULL,
    CONSTRAINT [sl_msg_log_pk] PRIMARY KEY CLUSTERED ([msg_log_seq] ASC, [msg_log_dtl_seq] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [sl_logskinifddtseq]
    ON [dbo].[sl_msg_log]([in_ifd_data_seq] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_msglogskdldseq]
    ON [dbo].[sl_msg_log]([dwnld_seq] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_msglogskmsgdt]
    ON [dbo].[sl_msg_log]([msg_log_dt] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_sglogskasyncevt]
    ON [dbo].[sl_msg_log]([async_evt_que_seq] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_sglogskevtdtseq]
    ON [dbo].[sl_msg_log]([evt_data_seq] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains message log messages.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The message log sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'msg_log_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The message log detail sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'msg_log_dtl_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The message log date/time', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'msg_log_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The source file name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'src_file';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The source file line number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'src_line_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The function name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'func_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The return status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'stat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The async event sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'async_evt_que_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The download sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'dwnld_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'In system Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'in_sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'In IFD Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'in_ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'In IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'in_ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) In IFD data sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'in_ifd_data_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'evt_data_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The event system Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'evt_sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The event Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The definition type code: COMM = Communication, DWNLD = Download, EO = Event Output, EVT = Event, IFD = IFD', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'def_typ_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The (EO/IFD) data header sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'data_hdr_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The (EO/IFD) data detail sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'data_dtl_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The (EO/IFD) definition Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'def_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The (EO/IFD) definition version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'def_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The (EO/IFD) definition segment', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The outbound system Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'out_sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The communication method Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'comm_mthd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The communication mode code: ASYNC = Asynchronous, SYNCD = Synchronous Delivery, SYNCE = Synchronous Except Send', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'comm_mode_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The communication direction code: I = Inbound, O = Outbound', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'comm_dir_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Message log message', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_msg_log', @level2type = N'COLUMN', @level2name = N'msg_log_data';

