CREATE TABLE [dbo].[sl_es_sap_tid] (
    [es_sap_tid]       NVARCHAR (24) NOT NULL,
    [es_stat_cd]       NVARCHAR (5)  NULL,
    [ifd_data_seq]     NUMERIC (12)  NULL,
    [dtl_seq]          NUMERIC (12)  NULL,
    [dwnld_seq]        NUMERIC (12)  NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [sl_es_sap_tid_pk] PRIMARY KEY CLUSTERED ([es_sap_tid] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [sl_essaptidskifd]
    ON [dbo].[sl_es_sap_tid]([ifd_data_seq] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains SAP TID data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_tid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SAP TID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_tid', @level2type = N'COLUMN', @level2name = N'es_sap_tid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_tid', @level2type = N'COLUMN', @level2name = N'es_stat_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'IFD data sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_tid', @level2type = N'COLUMN', @level2name = N'ifd_data_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Detail sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_es_sap_tid', @level2type = N'COLUMN', @level2name = N'dtl_seq';

