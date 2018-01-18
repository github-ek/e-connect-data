CREATE TABLE [dbo].[alloc_search_hdr] (
    [alloc_search_id]  NVARCHAR (9)  NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [bldg_id]          NVARCHAR (10) NOT NULL,
    [srtseq]           INT           NOT NULL,
    [search_path_typ]  NVARCHAR (9)  NOT NULL,
    [arecod]           NVARCHAR (10) NOT NULL,
    [lodlvl]           NVARCHAR (1)  NULL,
    [uomcod]           NVARCHAR (2)  NULL,
    [reg_uom]          NVARCHAR (2)  NULL,
    [thresh_flg]       INT           NOT NULL,
    [cstms_bond_flg]   INT           NULL,
    [dty_stmp_flg]     INT           NULL,
    [alloc_grp_nam]    NVARCHAR (9)  NULL,
    [loc_cap_pck_pct]  INT           NULL,
    [lstpck_flg]       INT           DEFAULT ((0)) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [alc_search_hdr_pk] PRIMARY KEY CLUSTERED ([alloc_search_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [alcsrchdr_lstpckck] CHECK ([lstpck_flg]=(0) OR [lstpck_flg]=(1)),
    CONSTRAINT [alcsrchdr_threshck] CHECK ([thresh_flg]=(0) OR [thresh_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [alc_srch_hdr_idx1]
    ON [dbo].[alloc_search_hdr]([wh_id] ASC, [bldg_id] ASC, [search_path_typ] ASC, [arecod] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents Pick and Replenishment Allocation policies.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique Id to identify the allocation search rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'alloc_search_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Id for the allocation search path.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Building Id for the allocation search path.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'bldg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the priority of the preferred area for allocation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether the allocation search paths are for picks or replenishments.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'search_path_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The source area. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UOM code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'uomcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Path Regulating UOM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'reg_uom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Thresh hold pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'thresh_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag used to filter the inventory allocated for this allocation search path. ''1'' to look for under bond inventory and ''0'' for non-bond inventory. A value of NULL indicates that it can look for any inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'cstms_bond_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag used to filter the inventory allocated for this allocation search path. ''1'' to look for Excise Duty Stamp inventory and ''0'' for Non-Excise Duty Stamp inventory. A value of NULL indicates that it can look for any inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'dty_stmp_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique Id to identify the allocation search group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'alloc_grp_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is used to indicate the maximum inventory that can be allocated from the location, without exceeding the location maximum pick threshold percentage.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'loc_cap_pck_pct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag to signify if list picking is enabled for this allocation search path.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'lstpck_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'alloc_search_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

