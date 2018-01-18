CREATE TABLE [dbo].[pcklst] (
    [list_id]             NVARCHAR (15)   NOT NULL,
    [list_typ]            NVARCHAR (3)    NOT NULL,
    [list_sts]            NVARCHAR (4)    NOT NULL,
    [pcklst_rule_id]      INT             NULL,
    [pcklst_rule_grp_id]  INT             NULL,
    [max_list_wgt]        NUMERIC (19, 4) NULL,
    [max_list_cube]       NUMERIC (19, 4) NULL,
    [list_cube_wgt_thr]   NUMERIC (19, 4) NULL,
    [list_max_add_caswgt] NUMERIC (19, 4) NULL,
    [totvol]              NUMERIC (19, 4) NULL,
    [totwgt]              NUMERIC (19, 4) NULL,
    [est_time]            INT             NULL,
    [adddte]              DATETIME        NULL,
    [cmpdte]              DATETIME        NULL,
    [u_version]           INT             NULL,
    [ins_dt]              DATETIME        NULL,
    [last_upd_dt]         DATETIME        NULL,
    [ins_user_id]         NVARCHAR (40)   NULL,
    [last_upd_user_id]    NVARCHAR (40)   NULL,
    [extvol]              INT             NULL,
    [intvol]              INT             NULL,
    [one_pass_only]       INT             NULL,
    [asset_typ]           NVARCHAR (30)   NULL,
    [tot_ord]             INT             NULL,
    [tot_ordlin]          INT             NULL,
    [tot_wko]             INT             NULL,
    [tot_wkolin]          INT             NULL,
    [tot_ctn]             INT             NULL,
    [tot_item]            INT             NULL,
    [tot_cust]            INT             NULL,
    [tot_client]          INT             NULL,
    [tot_list]            INT             NULL,
    [tot_load_picks]      INT             NULL,
    [tot_slot]            INT             NULL,
    CONSTRAINT [pcklst_pk] PRIMARY KEY CLUSTERED ([list_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [pcklst_list_sts]
    ON [dbo].[pcklst]([list_sts] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to store the pick lists.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies a group of picks for RF list picking.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'list_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'List Type - The type of a list - options include: ORD, WKO.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'list_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The status of a list - options include: P (Pending), R (Released), I (Picking In Process), C (Completed).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'list_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier of the Rule which created the list.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'pcklst_rule_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier of the Rule Group which created the list.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'pcklst_rule_grp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum List Weight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'max_list_wgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum List Cube.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'max_list_cube';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'List Cube Threshold For Restricting Pick Weight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'list_cube_wgt_thr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum Additional Case Weight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'list_max_add_caswgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Total Volume.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'totvol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Total Weight.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'totwgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Estimated time to pick the list.  Currently only valid with Labor Futures installed. Invalid estimates are set to -1. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'est_time';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Added date - Date/time when pick list was added.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Completed date - Date/time when pick list was completed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'cmpdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Total usable extra space volume of cartons in a list.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'extvol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Total volume of picks that can use carton''s extra space.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'intvol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag determining whether the system can continue to add picks to the pick list. Updated only when ''List Changes Not Allowed'' flag is set on the Rule (pick list is closed).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'one_pass_only';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The asset type into which this list will be picked.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'asset_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total number of orders in this list.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'tot_ord';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total number of order lines in this list.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'tot_ordlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total number of Work orders in this list.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'tot_wko';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total number of Work order lines in this list.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'tot_wkolin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total number of Cartons in this list.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'tot_ctn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total number of different items in this list.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'tot_item';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total number of Customers in this list.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'tot_cust';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total number of Clients in this list.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'tot_client';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total number of Pick Lists processed by this list.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'tot_list';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total number of Load Picks processed by this list.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'tot_load_picks';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Total Count of the Slots by the list', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pcklst', @level2type = N'COLUMN', @level2name = N'tot_slot';

