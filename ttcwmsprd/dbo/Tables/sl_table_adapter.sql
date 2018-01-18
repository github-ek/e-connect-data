CREATE TABLE [dbo].[sl_table_adapter] (
    [sl_tab_adp_seq]   NUMERIC (12)   NOT NULL,
    [ifd_typ_cd]       NVARCHAR (5)   NOT NULL,
    [adp_stat_cd]      NVARCHAR (5)   NOT NULL,
    [ifd_seg_data]     NVARCHAR (MAX) NULL,
    [u_version]        NUMERIC (5)    NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [sl_tableadapterpk] PRIMARY KEY CLUSTERED ([sl_tab_adp_seq] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [sl_leadapterfkstat]
    ON [dbo].[sl_table_adapter]([adp_stat_cd] ASC, [ifd_typ_cd] ASC, [sl_tab_adp_seq] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used by the Integrator table adapter (obsolete).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_table_adapter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Integrator table adapter sequence number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_table_adapter', @level2type = N'COLUMN', @level2name = N'sl_tab_adp_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD type code: I = Inbound IFD, O = Result IFD', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_table_adapter', @level2type = N'COLUMN', @level2name = N'ifd_typ_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The adapter status code: DONE = Done/Success, IDERR = Error During Identification, NEW = New/Unprocessed, RPLAY = Re-play/Re-try', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_table_adapter', @level2type = N'COLUMN', @level2name = N'adp_stat_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The IFD segment data', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_table_adapter', @level2type = N'COLUMN', @level2name = N'ifd_seg_data';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_table_adapter', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_table_adapter', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_table_adapter', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_table_adapter', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_table_adapter', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

