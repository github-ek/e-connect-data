CREATE TABLE [dbo].[cst_wh_put_to_loc] (
    [cstnum]           NVARCHAR (20) NOT NULL,
    [client_id]        NVARCHAR (32) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [srtseq]           INT           NOT NULL,
    [arecod]           NVARCHAR (10) NOT NULL,
    [stoloc]           NVARCHAR (20) NULL,
    [lodflg]           INT           DEFAULT ((1)) NULL,
    [subflg]           INT           DEFAULT ((1)) NULL,
    [dtlflg]           INT           DEFAULT ((1)) NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [cw_put_to_loc_pk] PRIMARY KEY CLUSTERED ([cstnum] ASC, [client_id] ASC, [wh_id] ASC, [srtseq] ASC, [arecod] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [cw_loc_dtlflg_ck] CHECK ([dtlflg]=(0) OR [dtlflg]=(1)),
    CONSTRAINT [cw_loc_lodflg_ck] CHECK ([lodflg]=(0) OR [lodflg]=(1)),
    CONSTRAINT [cw_loc_subflg_ck] CHECK ([subflg]=(0) OR [subflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines the store''s put to locations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer Number - The store identifier that a distribution will be sent to', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc', @level2type = N'COLUMN', @level2name = N'cstnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Id - The client for which this distribution is to be allocated/processed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Identifier - Warehouse this store is configured for', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort Sequence - When multiple areas/locations are configured for a store, this determines the order to attempt to allocate a destination location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Put to Area', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc', @level2type = N'COLUMN', @level2name = N'arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Put to Location - Uniquely identifies of the storage location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load level enable flag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc', @level2type = N'COLUMN', @level2name = N'lodflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sub-load level enable flag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc', @level2type = N'COLUMN', @level2name = N'subflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Detail level enable flag', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc', @level2type = N'COLUMN', @level2name = N'dtlflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

