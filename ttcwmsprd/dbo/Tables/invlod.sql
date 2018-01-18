CREATE TABLE [dbo].[invlod] (
    [lodnum]            NVARCHAR (30)   NOT NULL,
    [wh_id]             NVARCHAR (32)   NOT NULL,
    [stoloc]            NVARCHAR (20)   NOT NULL,
    [lodwgt]            NUMERIC (19, 4) NULL,
    [prmflg]            INT             NULL,
    [unkflg]            INT             NULL,
    [mvlflg]            INT             NULL,
    [adddte]            DATETIME        NOT NULL,
    [lstmov]            DATETIME        NULL,
    [lstdte]            DATETIME        NULL,
    [lstcod]            NVARCHAR (20)   NULL,
    [lst_usr_id]        NVARCHAR (40)   NULL,
    [loducc]            NVARCHAR (20)   NULL,
    [uccdte]            DATETIME        NULL,
    [palpos]            NVARCHAR (20)   NULL,
    [asset_typ]         NVARCHAR (30)   NULL,
    [avg_unt_catch_qty] NUMERIC (19, 4) NULL,
    [u_version]         INT             NULL,
    [ins_dt]            DATETIME        NULL,
    [last_upd_dt]       DATETIME        NULL,
    [ins_user_id]       NVARCHAR (40)   NULL,
    [last_upd_user_id]  NVARCHAR (40)   NULL,
    [lodtag]            NVARCHAR (40)   NULL,
    [lod_tagsts]        NVARCHAR (40)   NULL,
    [lodhgt]            NUMERIC (19, 4) NULL,
    [bundled_flg]       INT             DEFAULT ((0)) NULL,
    [distro_palopn_flg] INT             DEFAULT ((0)) NULL,
    [load_attr1_flg]    INT             DEFAULT ((0)) NOT NULL,
    [load_attr2_flg]    INT             DEFAULT ((0)) NOT NULL,
    [load_attr3_flg]    INT             DEFAULT ((0)) NOT NULL,
    [load_attr4_flg]    INT             DEFAULT ((0)) NOT NULL,
    [load_attr5_flg]    INT             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [invlod_pk] PRIMARY KEY CLUSTERED ([lodnum] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [invlod_bundled_ck] CHECK ([bundled_flg]=(0) OR [bundled_flg]=(1)),
    CONSTRAINT [invlod_distropalopn_ck] CHECK ([distro_palopn_flg]=(0) OR [distro_palopn_flg]=(1)),
    CONSTRAINT [invlod_lodatr1_ck] CHECK ([load_attr1_flg]=(0) OR [load_attr1_flg]=(1)),
    CONSTRAINT [invlod_lodatr2_ck] CHECK ([load_attr2_flg]=(0) OR [load_attr2_flg]=(1)),
    CONSTRAINT [invlod_lodatr3_ck] CHECK ([load_attr3_flg]=(0) OR [load_attr3_flg]=(1)),
    CONSTRAINT [invlod_lodatr4_ck] CHECK ([load_attr4_flg]=(0) OR [load_attr4_flg]=(1)),
    CONSTRAINT [invlod_lodatr5_ck] CHECK ([load_attr5_flg]=(0) OR [load_attr5_flg]=(1)),
    CONSTRAINT [invlod_mvlflg_ck] CHECK ([mvlflg]=(0) OR [mvlflg]=(1)),
    CONSTRAINT [invlod_prmflg_ck] CHECK ([prmflg]=(0) OR [prmflg]=(1)),
    CONSTRAINT [invlod_unkflg_ck] CHECK ([unkflg]=(0) OR [unkflg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [invlod_idx1]
    ON [dbo].[invlod]([wh_id] ASC, [stoloc] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invlod_idx2]
    ON [dbo].[invlod]([wh_id] ASC, [lodnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invlod_loducc]
    ON [dbo].[invlod]([loducc] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [invlod_lodtag]
    ON [dbo].[invlod]([lodtag] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The inventory load table is used to represent pallets in the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Uniquely identifies invlod record.  In many systems, this value is the same as the label on a pallet.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the inventory is to be received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the storage location for this pallet.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'In systems where scales are available, this field may be used to store the physical weight of the pallet that this entry represents.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'lodwgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Set if this is a ''permanent'' subload.  Permanent subloads are used throughout the system when it is necessary to provide a container to attach details to.  Additionally, in systems utilizing totes, they are represented as ''perm subloads''', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'prmflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This will be set to 1 if this invsub record represents a physical case in the system.  In this case, the subnum will be set to the external labeling on the physical case.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'unkflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is used to indicate if this subload entry may be moved.  In the case where permanent subloads are used to provide places to attach inventory, it is seldom desired that those permanent subs be allowed to move.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'mvlflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date/time this load was added to the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The last date/time this load was moved.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'lstmov';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The last date/time an activity happened against this load.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'lstdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last activity code on this load', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'lstcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last user which performed an activity on this load.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'lst_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If UCC128 processing is installed and this load receives a UCC128 shipping label, then this field will be filled in with the value of that label.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'loducc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date/time the UCC128 shipping label was applied.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'uccdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates what position the load''s pallet occupies.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'palpos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Asset Type - Identifies the asset type for this load', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Catch Quantity.  Used by the Average Catch Quantity functionality to store an average catch value for a load''s units.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'avg_unt_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The RFID tag associated to pallet', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'lodtag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet RFID Tag Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'lod_tagsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Load Height.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'lodhgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bundled Flag - Indicate if the load was created by bundling multiple cases for parcel manifesting.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'bundled_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Distribution Pallet Open Flag - Indicate whether the shipping pallet is open or not.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'distro_palopn_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The first load attribute. A load attribute is a configurable flag field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'load_attr1_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The second load attribute. A load attribute is a configurable flag field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'load_attr2_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The third load attribute. A load attribute is a configurable flag field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'load_attr3_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fourth load attribute. A load attribute is a configurable flag field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'load_attr4_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fifth load attribute. A load attribute is a configurable flag field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invlod', @level2type = N'COLUMN', @level2name = N'load_attr5_flg';

