CREATE TABLE [dbo].[supmst] (
    [client_id]        NVARCHAR (32) NOT NULL,
    [supnum]           NVARCHAR (32) NOT NULL,
    [adr_id]           NVARCHAR (20) NULL,
    [trk_cnsg_cod]     NVARCHAR (40) DEFAULT (N'TRKNONE') NOT NULL,
    [trust_flg]        INT           DEFAULT ((0)) NOT NULL,
    [rcvsts]           NVARCHAR (4)  NULL,
    [lot_fmt_id]       NVARCHAR (10) NULL,
    [ser_num_typ_id]   NVARCHAR (10) NULL,
    [asset_typ]        NVARCHAR (30) NULL,
    [bar_code_tmpl_id] NVARCHAR (32) NULL,
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
    CONSTRAINT [supmst_pk] PRIMARY KEY CLUSTERED ([supnum] ASC, [client_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [supmst_trust_flg_ck] CHECK ([trust_flg]=(0) OR [trust_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines supplier for a warehouse', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID - The client code that owns this supplier.  In a non-3PL system, this value defaults to ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Supplier Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'supnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Address ID - The address ID of the Supplier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Track Consignment Code - indicates if the supplier is allowed for consignment tracking and if it is for some specific items defined in child table sup_itm_cnsg_ovr.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'trk_cnsg_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trusted Flag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'trust_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The default inventory status that this product should get when identified during receiving.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'rcvsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier for the lot format records.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'lot_fmt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial Number Type ID - This will be the ID created by the user to specify a type of serial number.  There could potentially be more than one associated with a part/part client combination.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'ser_num_typ_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type - Identifies the asset type for this sub', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Barcode template to be used by a supplier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'bar_code_tmpl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Attribute 1 Configuration - This will be used to default the attribute value 1 based on the supplier at the time of receiving.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'load_attr1_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Attribute 2 Configuration - This will be used to default the attribute value 2 based on the supplier at the time of receiving.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'load_attr2_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Attribute 3 Configuration - This will be used to default the attribute value 3 based on the supplier at the time of receiving.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'load_attr3_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Attribute 4 Configuration - This will be used to default the attribute value 4 based on the supplier at the time of receiving.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'load_attr4_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Attribute 5 Configuration - This will be used to default the attribute value 5 based on the supplier at the time of receiving.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'load_attr5_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Consignment Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'cnsg_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Consignment Period', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'cnsg_period';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'supmst', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

