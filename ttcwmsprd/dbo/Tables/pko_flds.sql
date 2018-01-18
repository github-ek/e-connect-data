CREATE TABLE [dbo].[pko_flds] (
    [colnam]           NVARCHAR (100) NOT NULL,
    [wh_id]            NVARCHAR (32)  NOT NULL,
    [aud_typ]          NVARCHAR (20)  NOT NULL,
    [srtseq]           INT            NOT NULL,
    [id_fld_flg]       INT            DEFAULT ((0)) NOT NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    [auto_fill_flg]    INT            DEFAULT ((0)) NOT NULL,
    [vis_flg]          INT            DEFAULT ((1)) NOT NULL,
    CONSTRAINT [pko_flds_pk] PRIMARY KEY CLUSTERED ([colnam] ASC, [wh_id] ASC, [aud_typ] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [pko_flds_idfld_ck] CHECK ([id_fld_flg]=(0) OR [id_fld_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This new table will store the identification fields configuration for packout', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_flds';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the field that must be scanned', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_flds', @level2type = N'COLUMN', @level2name = N'colnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The warehouse of the device to which this configuration applies', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_flds', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to distinguish between Pack Station Audits and Outbound Inventory Audits', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_flds', @level2type = N'COLUMN', @level2name = N'aud_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The sort sequence in which this field will appear on screen', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_flds', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag to indicate whether to use this field for identification', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_flds', @level2type = N'COLUMN', @level2name = N'id_fld_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_flds', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_flds', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_flds', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_flds', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to determine if the packout field should be populated automatically during the packout process', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_flds', @level2type = N'COLUMN', @level2name = N'auto_fill_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to determine if the packout field should be visible on the packout form', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pko_flds', @level2type = N'COLUMN', @level2name = N'vis_flg';

