CREATE TABLE [dbo].[sup_prtftp] (
    [supnum]           NVARCHAR (32) NOT NULL,
    [client_id]        NVARCHAR (32) NOT NULL,
    [prtnum]           NVARCHAR (50) NOT NULL,
    [prt_client_id]    NVARCHAR (32) NOT NULL,
    [ftpcod]           NVARCHAR (30) NOT NULL,
    [asset_typ]        NVARCHAR (30) NULL,
    [defftp_flg]       INT           DEFAULT ((0)) NOT NULL,
    [load_attr1_cfg]   NVARCHAR (1)  NULL,
    [load_attr2_cfg]   NVARCHAR (1)  NULL,
    [load_attr3_cfg]   NVARCHAR (1)  NULL,
    [load_attr4_cfg]   NVARCHAR (1)  NULL,
    [load_attr5_cfg]   NVARCHAR (1)  NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [sup_prtftp_pk] PRIMARY KEY CLUSTERED ([supnum] ASC, [client_id] ASC, [prtnum] ASC, [prt_client_id] ASC, [ftpcod] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sup_prtftp_defftp_flg_ck] CHECK ([defftp_flg]=(0) OR [defftp_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is being added to store the relationship of the vendor to the item footprint', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prtftp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PK of vendor) Vendor Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prtftp', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PK of vendor) Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prtftp', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prtftp', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prtftp', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Footprint Code -- Must be valid ftpcod of item', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prtftp', @level2type = N'COLUMN', @level2name = N'ftpcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prtftp', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default Ftpcod Flag -- Default Flag which indicates current footprint is default footprint for the vendor/item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prtftp', @level2type = N'COLUMN', @level2name = N'defftp_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Attribute 1 Configuration - This will be used to default the attribute value 1 based on the supplier item footprint at the time of receiving.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prtftp', @level2type = N'COLUMN', @level2name = N'load_attr1_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Attribute 2 Configuration - This will be used to default the attribute value 2 based on the supplier item footprint at the time of receiving.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prtftp', @level2type = N'COLUMN', @level2name = N'load_attr2_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Attribute 3 Configuration - This will be used to default the attribute value 3 based on the supplier item footprint at the time of receiving.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prtftp', @level2type = N'COLUMN', @level2name = N'load_attr3_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Attribute 4 Configuration - This will be used to default the attribute value 4 based on the supplier item footprint at the time of receiving.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prtftp', @level2type = N'COLUMN', @level2name = N'load_attr4_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Attribute 5 Configuration - This will be used to default the attribute value 5 based on the supplier item footprint at the time of receiving.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prtftp', @level2type = N'COLUMN', @level2name = N'load_attr5_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prtftp', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prtftp', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prtftp', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prtftp', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

