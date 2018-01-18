CREATE TABLE [dbo].[sup_prt] (
    [supnum]           NVARCHAR (32) NOT NULL,
    [client_id]        NVARCHAR (32) NOT NULL,
    [prtnum]           NVARCHAR (50) NOT NULL,
    [prt_client_id]    NVARCHAR (32) NOT NULL,
    [rcvsts]           NVARCHAR (4)  NULL,
    [lot_fmt_id]       NVARCHAR (10) NULL,
    [asset_typ]        NVARCHAR (30) NULL,
    [ser_num_typ_id]   NVARCHAR (10) NULL,
    [reopnt]           INT           NULL,
    [reoqty]           INT           NULL,
    [load_attr1_cfg]   NVARCHAR (1)  NULL,
    [load_attr2_cfg]   NVARCHAR (1)  NULL,
    [load_attr3_cfg]   NVARCHAR (1)  NULL,
    [load_attr4_cfg]   NVARCHAR (1)  NULL,
    [load_attr5_cfg]   NVARCHAR (1)  NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [cnsg_cod]         NVARCHAR (20) NULL,
    [cnsg_period]      INT           NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [sup_prt_pk] PRIMARY KEY CLUSTERED ([supnum] ASC, [client_id] ASC, [prtnum] ASC, [prt_client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is being added to store the relationship of the vendor to the item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PK of vendor) Vendor Number : Vendor number specific to the component', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PK of vendor) Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client ID : Client idenfidier of an item', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Receive Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'rcvsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot Format ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'lot_fmt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial Number Format', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'ser_num_typ_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reorder Point', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'reopnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reorder Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'reoqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Attribute 1 Configuration - This will be used to default the attribute value 1 based on the supplier item at the time of receiving.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'load_attr1_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Attribute 2 Configuration - This will be used to default the attribute value 2 based on the supplier item at the time of receiving.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'load_attr2_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Attribute 3 Configuration - This will be used to default the attribute value 3 based on the supplier item at the time of receiving.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'load_attr3_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Attribute 4 Configuration - This will be used to default the attribute value 4 based on the supplier item at the time of receiving.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'load_attr4_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Attribute 5 Configuration - This will be used to default the attribute value 5 based on the supplier item at the time of receiving.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'load_attr5_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Consignment Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'cnsg_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Consignment Period', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'cnsg_period';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sup_prt', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

