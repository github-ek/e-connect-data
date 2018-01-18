CREATE TABLE [dbo].[rfid_tag_sernum] (
    [pure_identity_name] NVARCHAR (40) NOT NULL,
    [co_prefix]          NVARCHAR (13) NOT NULL,
    [reference]          NVARCHAR (8)  NOT NULL,
    [sernum_prefix]      NVARCHAR (20) NOT NULL,
    [sernum]             NVARCHAR (20) NULL,
    [last_sernum]        NVARCHAR (20) NULL,
    [threshold]          NVARCHAR (20) NULL,
    [trnnum]             NVARCHAR (20) NULL,
    [nxtblk_start]       NVARCHAR (20) NULL,
    [nxtblk_end]         NVARCHAR (20) NULL,
    [nxtblk_threshold]   NVARCHAR (20) NULL,
    [nxtblk_trnnum]      NVARCHAR (20) NULL,
    [u_version]          INT           NULL,
    [ins_dt]             DATETIME      NULL,
    [last_upd_dt]        DATETIME      NULL,
    [ins_user_id]        NVARCHAR (40) NULL,
    [last_upd_user_id]   NVARCHAR (40) NULL,
    CONSTRAINT [rfid_tag_sernum_pk] PRIMARY KEY CLUSTERED ([pure_identity_name] ASC, [co_prefix] ASC, [reference] ASC, [sernum_prefix] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The tag serial number table contains information regarding the serial numbers for a tag.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_tag_sernum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The pure identity name for this serial number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_tag_sernum', @level2type = N'COLUMN', @level2name = N'pure_identity_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The tag company prefix for this serial number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_tag_sernum', @level2type = N'COLUMN', @level2name = N'co_prefix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The tag reference number for this serial number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_tag_sernum', @level2type = N'COLUMN', @level2name = N'reference';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The prefix used for this serial number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_tag_sernum', @level2type = N'COLUMN', @level2name = N'sernum_prefix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The next serial number to use.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_tag_sernum', @level2type = N'COLUMN', @level2name = N'sernum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The last serial number that can be used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_tag_sernum', @level2type = N'COLUMN', @level2name = N'last_sernum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Treshold value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_tag_sernum', @level2type = N'COLUMN', @level2name = N'threshold';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Block request transaction number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_tag_sernum', @level2type = N'COLUMN', @level2name = N'trnnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Start of the next block.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_tag_sernum', @level2type = N'COLUMN', @level2name = N'nxtblk_start';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'End of the next block.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_tag_sernum', @level2type = N'COLUMN', @level2name = N'nxtblk_end';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Threshold of the next block.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_tag_sernum', @level2type = N'COLUMN', @level2name = N'nxtblk_threshold';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Transaction of the next block.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_tag_sernum', @level2type = N'COLUMN', @level2name = N'nxtblk_trnnum';

