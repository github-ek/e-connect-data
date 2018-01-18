CREATE TABLE [dbo].[prtftp] (
    [prtnum]           NVARCHAR (50)   NOT NULL,
    [ftpcod]           NVARCHAR (30)   NOT NULL,
    [prt_client_id]    NVARCHAR (32)   NOT NULL,
    [wh_id]            NVARCHAR (32)   NOT NULL,
    [caslvl]           INT             NULL,
    [nstlen]           NUMERIC (19, 4) NULL,
    [nstwid]           NUMERIC (19, 4) NULL,
    [nsthgt]           NUMERIC (19, 4) NULL,
    [pal_stck_hgt]     INT             DEFAULT ((0)) NOT NULL,
    [def_asset_typ]    NVARCHAR (30)   NULL,
    [defftp_flg]       INT             DEFAULT ((0)) NOT NULL,
    [stkmtd]           NVARCHAR (20)   NULL,
    [load_attr1_cfg]   NVARCHAR (1)    NULL,
    [load_attr2_cfg]   NVARCHAR (1)    NULL,
    [load_attr3_cfg]   NVARCHAR (1)    NULL,
    [load_attr4_cfg]   NVARCHAR (1)    NULL,
    [load_attr5_cfg]   NVARCHAR (1)    NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    CONSTRAINT [prtftp_pk] PRIMARY KEY CLUSTERED ([prtnum] ASC, [prt_client_id] ASC, [wh_id] ASC, [ftpcod] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [prtftp_defftp_ck] CHECK ([defftp_flg]=(0) OR [defftp_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [prtftp_idx1]
    ON [dbo].[prtftp]([wh_id] ASC, [pal_stck_hgt] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [prtftp_idx2]
    ON [dbo].[prtftp]([defftp_flg] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The table associates multiple footprint codes linked to a specific item number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The item number to which a footprint is associated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is footprint code associate with the item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'ftpcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'In non-3PL systems, this will be set to a default of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the item number and footprint code are to be associated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Case per tier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'caslvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nested Length', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'nstlen';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nested Width', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'nstwid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nested Height', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'nsthgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet Stack Height', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'pal_stck_hgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default Asset Type: The default asset type identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'def_asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default Flag which indicates current ftpcod is default ftpcod for the item', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'defftp_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stack Method', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'stkmtd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The first load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'load_attr1_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The second load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'load_attr2_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The third load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'load_attr3_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fourth load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'load_attr4_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fifth load attribute. A load attribute is a configurable field to indicate attributes of a load such as the load being wrapped.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'load_attr5_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row as was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtftp', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

