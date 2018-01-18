CREATE TABLE [dbo].[sl_sys_def] (
    [sys_id]                NVARCHAR (30)   NOT NULL,
    [sys_descr]             NVARCHAR (250)  NULL,
    [native_nam]            NVARCHAR (60)   NOT NULL,
    [sys_grp_id]            NVARCHAR (30)   NOT NULL,
    [ena_flg]               NVARCHAR (1)    NOT NULL,
    [sl_host_sys_flg]       NVARCHAR (1)    NOT NULL,
    [i_commit_ctxt_defn_cd] NVARCHAR (5)    NULL,
    [pre_async_alg_id]      NVARCHAR (30)   NULL,
    [post_async_alg_id]     NVARCHAR (30)   NULL,
    [pre_dwnld_alg_id]      NVARCHAR (30)   NULL,
    [post_dwnld_alg_id]     NVARCHAR (30)   NULL,
    [fail_evt_id]           NVARCHAR (30)   NULL,
    [prsrv_evt_seq_flg]     NVARCHAR (1)    NOT NULL,
    [snd_err_stat_flg]      NVARCHAR (1)    NULL,
    [rcv_fail_evt_id]       NVARCHAR (30)   NULL,
    [rcv_succ_evt_id]       NVARCHAR (30)   NULL,
    [null_ind_char]         NVARCHAR (5)    NULL,
    [nochg_ind_char]        NVARCHAR (5)    NULL,
    [absent_ind_char]       NVARCHAR (5)    NULL,
    [eol_delim]             NVARCHAR (5)    NULL,
    [mailbox_nam]           NVARCHAR (20)   NULL,
    [host_port]             NVARCHAR (10)   NULL,
    [host_nam]              NVARCHAR (60)   NULL,
    [sys_user_id]           NVARCHAR (40)   NULL,
    [sys_password]          NVARCHAR (30)   NULL,
    [sys_conn_data]         NVARCHAR (30)   NULL,
    [moca_sys_flg]          NVARCHAR (1)    NULL,
    [xml_tag_data_inst]     NVARCHAR (60)   NULL,
    [xml_tag_ifd]           NVARCHAR (60)   NULL,
    [xml_tag_data]          NVARCHAR (60)   NULL,
    [max_grp_siz]           NUMERIC (8)     NULL,
    [u_version]             NUMERIC (5)     NULL,
    [ins_dt]                DATETIME        NULL,
    [last_upd_dt]           DATETIME        NULL,
    [ins_user_id]           NVARCHAR (40)   NULL,
    [last_upd_user_id]      NVARCHAR (40)   NULL,
    [service]               NVARCHAR (1000) NULL,
    CONSTRAINT [sl_sys_def_pk] PRIMARY KEY CLUSTERED ([sys_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_sys_def_fk_evtf] FOREIGN KEY ([fail_evt_id]) REFERENCES [dbo].[sl_evt_def] ([evt_id]),
    CONSTRAINT [sl_sys_def_fk_grp] FOREIGN KEY ([sys_grp_id]) REFERENCES [dbo].[sl_sys_def_grp] ([sys_grp_id]),
    CONSTRAINT [sl_sysdeffkevtrcvf] FOREIGN KEY ([rcv_fail_evt_id]) REFERENCES [dbo].[sl_evt_def] ([evt_id]),
    CONSTRAINT [sl_sysdeffkevtrcvs] FOREIGN KEY ([rcv_succ_evt_id]) REFERENCES [dbo].[sl_evt_def] ([evt_id]),
    CONSTRAINT [sl_sysdeffkprealg] FOREIGN KEY ([pre_async_alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_sysdeffkpredalg] FOREIGN KEY ([pre_dwnld_alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_sysdeffkpstalg] FOREIGN KEY ([post_async_alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_sysdeffkpstdalg] FOREIGN KEY ([post_dwnld_alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id])
);


GO
CREATE NONCLUSTERED INDEX [sl_sysdeffkevtrcvf]
    ON [dbo].[sl_sys_def]([rcv_fail_evt_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_sysdeffkevtrcvs]
    ON [dbo].[sl_sys_def]([rcv_succ_evt_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_sysdeffkprealg]
    ON [dbo].[sl_sys_def]([pre_async_alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_sysdeffkpredalg]
    ON [dbo].[sl_sys_def]([pre_dwnld_alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_sysdeffkpstalg]
    ON [dbo].[sl_sys_def]([post_async_alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_sysdeffkpstdalg]
    ON [dbo].[sl_sys_def]([post_dwnld_alg_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE UNIQUE NONCLUSTERED INDEX [sl_sysdefsknatnam]
    ON [dbo].[sl_sys_def]([native_nam] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_sys_def_fk_evtf]
    ON [dbo].[sl_sys_def]([fail_evt_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_sys_def_fk_grp]
    ON [dbo].[sl_sys_def]([sys_grp_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The system identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of system', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'sys_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(UNIQUE) The native name of system', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'native_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system group name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'sys_grp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is system enabled?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Obsolete) Is system a host system?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'sl_host_sys_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The inbound commit context define code: COMM = Whole Communication Set, IFD = Every root segment, SIFD = Same IFDs', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'i_commit_ctxt_defn_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm runs before asynchronous communication method is called', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'pre_async_alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm runs after asynchronous communication method is called', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'post_async_alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm runs before download is processed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'pre_dwnld_alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm runs after download is processed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'post_dwnld_alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event for send failure', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'fail_evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Preserve event sequence order?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'prsrv_evt_seq_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Change status on send error?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'snd_err_stat_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event for receive failure (not currently used)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'rcv_fail_evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The event for receive success (not currently used)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'rcv_succ_evt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The indicator character for null value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'null_ind_char';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The indicator character for no change value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'nochg_ind_char';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The indicator character for absent value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'absent_ind_char';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The delimiter characters for end of line', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'eol_delim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Obsolete) The mailbox name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'mailbox_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Obsolete) The host port', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'host_port';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Obsolete) The host name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'host_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The system user identifier (not currently used)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'sys_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The password of system user (not currently used)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'sys_password';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The system connection data (not currently used)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'sys_conn_data';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Obsolete) Is system a MOCA system?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'moca_sys_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The XML tag for data instance', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'xml_tag_data_inst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The XML tag for IFD', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'xml_tag_ifd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The XML tag for data', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'xml_tag_data';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The maximum send group size', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'max_grp_siz';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service connection string to application server', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_def', @level2type = N'COLUMN', @level2name = N'service';

