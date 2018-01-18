CREATE TABLE [dbo].[bldg_mst] (
    [bldg_id]          NVARCHAR (10) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [business_unt]     NVARCHAR (10) NULL,
    [adr_id]           NVARCHAR (20) NOT NULL,
    [fluid_load_flg]   INT           DEFAULT ((0)) NULL,
    [sort_attr_locsts] NVARCHAR (1)  NULL,
    [sort_default_flg] INT           DEFAULT ((0)) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [bldg_mst_pk] PRIMARY KEY CLUSTERED ([bldg_id] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [bldg_mst_fldldg_ck] CHECK ([fluid_load_flg]=(0) OR [fluid_load_flg]=(1)),
    CONSTRAINT [srt_default_flg_ck] CHECK ([sort_default_flg]=(0) OR [sort_default_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [bldg_mst_wh_id]
    ON [dbo].[bldg_mst]([wh_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The building master table is used to represent buildings in the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bldg_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the building exists.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bldg_mst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the business unit in which this building belongs.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bldg_mst', @level2type = N'COLUMN', @level2name = N'business_unt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to associate an address to this building.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bldg_mst', @level2type = N'COLUMN', @level2name = N'adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether fluid loading is allowed at Building level', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bldg_mst', @level2type = N'COLUMN', @level2name = N'fluid_load_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort Attribute by Location Status - This attribute will sort the locations for determining inbound optimal dock door by the location status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bldg_mst', @level2type = N'COLUMN', @level2name = N'sort_attr_locsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort Default Flag - This flag will decide if we will use the default rule to arrive at the list of Inbound Optimal dock doors in this building', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bldg_mst', @level2type = N'COLUMN', @level2name = N'sort_default_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bldg_mst', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bldg_mst', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bldg_mst', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bldg_mst', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bldg_mst', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

