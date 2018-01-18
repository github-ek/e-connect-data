CREATE TABLE [dbo].[wh] (
    [wh_id]               NVARCHAR (32)   NOT NULL,
    [adr_id]              NVARCHAR (20)   NOT NULL,
    [def_wh_flg]          INT             NULL,
    [wh_typ_cd]           NVARCHAR (8)    NOT NULL,
    [lens_sitnam]         NVARCHAR (40)   NULL,
    [lens_customer_id]    NVARCHAR (20)   NULL,
    [lens_cust_client_id] NVARCHAR (32)   NULL,
    [lens_ena_flg]        INT             NULL,
    [dflt_hldpfx]         NVARCHAR (32)   NULL,
    [orgcod]              NVARCHAR (25)   NULL,
    [perm_cre_lod]        NVARCHAR (30)   NULL,
    [perm_adj_lod]        NVARCHAR (30)   NULL,
    [perm_cre_sub]        NVARCHAR (30)   NULL,
    [perm_adj_sub]        NVARCHAR (30)   NULL,
    [moddte]              DATETIME        NULL,
    [mod_usr_id]          NVARCHAR (40)   NULL,
    [sgln]                NVARCHAR (40)   NULL,
    [rfid_ena_flg]        INT             NULL,
    [trans_wh_id]         NVARCHAR (32)   NULL,
    [auto_play_cst_thr]   NUMERIC (19, 4) NULL,
    [cnt_thr_unit]        INT             NULL,
    [cnt_thr_cst]         NUMERIC (19, 4) NULL,
    [u_version]           INT             NULL,
    [ins_dt]              DATETIME        NULL,
    [last_upd_dt]         DATETIME        NULL,
    [ins_user_id]         NVARCHAR (40)   NULL,
    [last_upd_user_id]    NVARCHAR (40)   NULL,
    [aisle_max]           INT             DEFAULT ((0)) NULL,
    [bay_max]             INT             DEFAULT ((0)) NULL,
    [slot_max]            INT             DEFAULT ((0)) NULL,
    [concat_order]        INT             NULL,
    [recalc_dist_flag]    INT             NULL,
    [recalc_date]         DATETIME        NULL,
    [last_regen_time]     NVARCHAR (20)   NULL,
    [wmp_left_x]          INT             DEFAULT ((0)) NULL,
    [wmp_right_x]         INT             DEFAULT ((0)) NULL,
    [wmp_upper_y]         INT             DEFAULT ((0)) NULL,
    [wmp_lower_y]         INT             DEFAULT ((0)) NULL,
    [active]              INT             NULL,
    [crncy_code]          NVARCHAR (4)    NULL,
    [lst_rttn_id]         NVARCHAR (10)   NULL,
    [rttn_id_min_value]   NVARCHAR (7)    NULL,
    [rttn_id_max_value]   NVARCHAR (7)    NULL,
    [adj_thr_cst]         NUMERIC (19, 4) NULL,
    [adj_thr_unit]        INT             NULL,
    [cnsg_cod]            NVARCHAR (20)   NULL,
    [cnsg_period]         INT             NULL,
    CONSTRAINT [wh_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [wh_def_wh_flg_ck] CHECK ([def_wh_flg]=(0) OR [def_wh_flg]=(1)),
    CONSTRAINT [wh_lens_ena_flg_ck] CHECK ([lens_ena_flg]=(0) OR [lens_ena_flg]=(1)),
    CONSTRAINT [wh_rfid_ena_flg_ck] CHECK ([rfid_ena_flg]=(0) OR [rfid_ena_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [wh_adr_id]
    ON [dbo].[wh]([adr_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE UNIQUE NONCLUSTERED INDEX [wh_perm_adj_lod]
    ON [dbo].[wh]([perm_adj_lod] ASC) WITH (FILLFACTOR = 90);


GO
CREATE UNIQUE NONCLUSTERED INDEX [wh_perm_adj_sub]
    ON [dbo].[wh]([perm_adj_sub] ASC) WITH (FILLFACTOR = 90);


GO
CREATE UNIQUE NONCLUSTERED INDEX [wh_perm_cre_lod]
    ON [dbo].[wh]([perm_cre_lod] ASC) WITH (FILLFACTOR = 90);


GO
CREATE UNIQUE NONCLUSTERED INDEX [wh_perm_cre_sub]
    ON [dbo].[wh]([perm_cre_sub] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Warehouse table is used to represent warehouses in the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - The unique identifier for the warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Address ID - Used to associate an address to this warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If true and no specific whse can be determined, use this wh_id. This is primarily used in facilities that do not require MW functionality to reduce the required overhead of always sending a wh_id to components.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'def_wh_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Type Code - Tracks the type of warehouse.  Options: EMPTY - Empty Warehouse, STARTER - Starter Warehouse Site.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'wh_typ_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lens Site Name - The name of this warehouse as it appears in the Lens applications. This value is typically entered at the time the warehouse is subscribed to Lens.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'lens_sitnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lens Customer ID - The customer id associated with this warehouse in a Lens instance. This value is used by Lens to track intransit shipments and is typically entered at the time the warehouse is subscribed to Lens.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'lens_customer_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The client id for the customer that is associated with this whse in a Lens instance. This value is used by Lens to track intransit shipments and is typically entered at the time the warehouse is subscribed to Lens.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'lens_cust_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lens Enabled Flag - When this flag is true, this indicates that this warehouse has been subscribed to Lens.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'lens_ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default Hold Prefix.  Used to default the hold prefix when creating hold definitions if the hold prefix is not specified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'dflt_hldpfx';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to determine Country of Origin in International Shipping.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'orgcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Permanent Create Load', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'perm_cre_lod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Permanent Adjust Load', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'perm_adj_lod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Permanent Create Sub-load', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'perm_cre_sub';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Permanent Adjust Sub-load', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'perm_adj_sub';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time this record was last modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serialized Global Location Number - This is used for transaction requiring standard location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'sgln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'RFID Enabled Flag - This is used to enable/disable RFID functionality by warehouse', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'rfid_ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Translated Warehouse ID - This is used to convert a real Warehouse ID to a recognizable Warehouse ID for Host system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'trans_wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Auto Play Cost Threshold - This is the maximum value of an adjustment that will be automatically played to the host.  A value of 0 or null indicates that all adjustments for the warehouse will be saved in the invadj table to be played at a later time.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'auto_play_cst_thr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Unit threshold of counting. We won''t genreate count if the current unit is lower than this value. 0 means the threshold is disabled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'cnt_thr_unit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The cost threshold of counting. We won''t genreate count if the current cost is lower than this value. 0 measn the threshold is disabled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'cnt_thr_cst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Max characters for a Physical Aisle ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'aisle_max';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Max characters for a Bay ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'bay_max';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Max characters for a Location ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'slot_max';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Concatenation order for building the Location ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'concat_order';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Recalc Distribution Flag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'recalc_dist_flag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Date Regen was run', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'recalc_date';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Regen Time', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'last_regen_time';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Upper left x coordinate range of warehouse', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'wmp_left_x';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Upper left y coordinate range of warehouse', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'wmp_right_x';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lower right x coordinate range of warehouse', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'wmp_upper_y';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lower right y coordinate range of warehouse', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'wmp_lower_y';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Status of the Warehouse', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'active';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Currency Code for the Currency fields in the table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'crncy_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the last rotation number used for the warehouse with the format of YY/1xxxxxx where YY is the year and xxxxxx is zero padded rotation number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'lst_rttn_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field holds the minimum value of the sequence number to start with for generating a rotation number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'rttn_id_min_value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field holds the maximum value of the sequence number that we can use for generating a rotation number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'rttn_id_max_value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse adjustment threshold cost value - This is the maximum value of an adjustment that will be allowed without requiring approval by supervisor.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'adj_thr_cst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse adjustment threshold unit value - This is the maximum value of an adjustment that will be allowed without requiring approval by supervisor.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'adj_thr_unit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Consignment Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'cnsg_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Consignment Period', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh', @level2type = N'COLUMN', @level2name = N'cnsg_period';

