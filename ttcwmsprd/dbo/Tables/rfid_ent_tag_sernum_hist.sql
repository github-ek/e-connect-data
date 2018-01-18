CREATE TABLE [dbo].[rfid_ent_tag_sernum_hist] (
    [trnnum]             NVARCHAR (20) NOT NULL,
    [sitnam]             NVARCHAR (60) NULL,
    [trndte]             DATETIME      NULL,
    [pure_identity_name] NVARCHAR (40) NULL,
    [co_prefix]          NVARCHAR (13) NULL,
    [reference]          NVARCHAR (8)  NULL,
    [sernum_prefix]      NVARCHAR (20) NULL,
    [sernum]             NVARCHAR (20) NULL,
    [last_sernum]        NVARCHAR (20) NULL,
    [prev_trnnum]        NVARCHAR (20) NULL,
    [u_version]          INT           NULL,
    [ins_dt]             DATETIME      NULL,
    [last_upd_dt]        DATETIME      NULL,
    [ins_user_id]        NVARCHAR (40) NULL,
    [last_upd_user_id]   NVARCHAR (40) NULL,
    CONSTRAINT [rfidentag_s_n_h_pk] PRIMARY KEY CLUSTERED ([trnnum] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains all previous rfid_ent_tag_sernum entries with additional fields.  Previous last serial number is used to determine if there is a new request.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_ent_tag_sernum_hist';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Transaction number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_ent_tag_sernum_hist', @level2type = N'COLUMN', @level2name = N'trnnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Site name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_ent_tag_sernum_hist', @level2type = N'COLUMN', @level2name = N'sitnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Transaction date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_ent_tag_sernum_hist', @level2type = N'COLUMN', @level2name = N'trndte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pure identity name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_ent_tag_sernum_hist', @level2type = N'COLUMN', @level2name = N'pure_identity_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Company prefix.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_ent_tag_sernum_hist', @level2type = N'COLUMN', @level2name = N'co_prefix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item reference.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_ent_tag_sernum_hist', @level2type = N'COLUMN', @level2name = N'reference';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial number prefix.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_ent_tag_sernum_hist', @level2type = N'COLUMN', @level2name = N'sernum_prefix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_ent_tag_sernum_hist', @level2type = N'COLUMN', @level2name = N'sernum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last serial number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_ent_tag_sernum_hist', @level2type = N'COLUMN', @level2name = N'last_sernum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Previous transaction number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_ent_tag_sernum_hist', @level2type = N'COLUMN', @level2name = N'prev_trnnum';

