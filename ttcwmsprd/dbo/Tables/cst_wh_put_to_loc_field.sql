CREATE TABLE [dbo].[cst_wh_put_to_loc_field] (
    [cstnum]           NVARCHAR (20)  NOT NULL,
    [client_id]        NVARCHAR (32)  NOT NULL,
    [wh_id]            NVARCHAR (32)  NOT NULL,
    [srtseq]           INT            NOT NULL,
    [arecod]           NVARCHAR (10)  NOT NULL,
    [colnam]           NVARCHAR (100) NOT NULL,
    [colval]           NVARCHAR (200) NOT NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [cw_putoloc_fld_pk] PRIMARY KEY CLUSTERED ([cstnum] ASC, [client_id] ASC, [wh_id] ASC, [srtseq] ASC, [arecod] ASC, [colnam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to maintin the put-to-locations configuration field/value records for stores.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc_field';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer Number - The custmer that a distribution will be sent to', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc_field', @level2type = N'COLUMN', @level2name = N'cstnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Id - The client for which this distribution is to be allocated/processed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc_field', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Identifier - The warehouse for which this store is configured', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc_field', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort Sequence - When multiple areas/locations are configured for a store, this value determines the order in which to attempt to allocate a destination location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc_field', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Put to Area', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc_field', @level2type = N'COLUMN', @level2name = N'arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The column name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc_field', @level2type = N'COLUMN', @level2name = N'colnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The column value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc_field', @level2type = N'COLUMN', @level2name = N'colval';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert/Add Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc_field', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc_field', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert/Add User', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc_field', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Update User', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cst_wh_put_to_loc_field', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

