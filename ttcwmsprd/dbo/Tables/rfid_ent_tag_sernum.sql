CREATE TABLE [dbo].[rfid_ent_tag_sernum] (
    [pure_identity_name] NVARCHAR (40) NOT NULL,
    [co_prefix]          NVARCHAR (13) NOT NULL,
    [reference]          NVARCHAR (8)  NOT NULL,
    [sernum_prefix]      NVARCHAR (20) NOT NULL,
    [sernum]             NVARCHAR (20) NULL,
    [last_sernum]        NVARCHAR (20) NULL,
    [u_version]          INT           NULL,
    [ins_dt]             DATETIME      NULL,
    [last_upd_dt]        DATETIME      NULL,
    [ins_user_id]        NVARCHAR (40) NULL,
    [last_upd_user_id]   NVARCHAR (40) NULL,
    CONSTRAINT [r_ent_tag_snm_pk] PRIMARY KEY CLUSTERED ([pure_identity_name] ASC, [co_prefix] ASC, [reference] ASC, [sernum_prefix] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains information for individual serial number generation, including the next serial number block range.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_ent_tag_sernum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pure identity name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_ent_tag_sernum', @level2type = N'COLUMN', @level2name = N'pure_identity_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Company prefix.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_ent_tag_sernum', @level2type = N'COLUMN', @level2name = N'co_prefix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item reference.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_ent_tag_sernum', @level2type = N'COLUMN', @level2name = N'reference';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial number prefix.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_ent_tag_sernum', @level2type = N'COLUMN', @level2name = N'sernum_prefix';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_ent_tag_sernum', @level2type = N'COLUMN', @level2name = N'sernum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last serial number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_ent_tag_sernum', @level2type = N'COLUMN', @level2name = N'last_sernum';

