CREATE TABLE [dbo].[prtmst_wh] (
    [prtnum]           NVARCHAR (50) NOT NULL,
    [prt_client_id]    NVARCHAR (32) DEFAULT (N'----') NOT NULL,
    [wh_id]            NVARCHAR (32) DEFAULT (N'----') NOT NULL,
    [lstrcv]           DATETIME      NULL,
    [lstvar]           INT           NULL,
    [numcnt]           INT           NULL,
    [cntdte]           DATETIME      NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [prtmst_wh_pk] PRIMARY KEY CLUSTERED ([prtnum] ASC, [wh_id] ASC, [prt_client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [prtmst_wh_n_c_w]
    ON [dbo].[prtmst_wh]([numcnt] ASC, [cntdte] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The item master warehouse table is used to represent valid items in the warehouse for the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst_wh';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Also referred to as item number or SKU. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst_wh', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The client which owns the item number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst_wh', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - The wh_id = ''----'' will represent a default item that will be shared by all warehouses. An entry with a wh_id != ''----'' is an override for that warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst_wh', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the last date and time this item was received. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst_wh', @level2type = N'COLUMN', @level2name = N'lstrcv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the last count variance of the item ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst_wh', @level2type = N'COLUMN', @level2name = N'lstvar';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of counts performed so far in the current cycle.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst_wh', @level2type = N'COLUMN', @level2name = N'numcnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the last date and time this item was cycle counted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtmst_wh', @level2type = N'COLUMN', @level2name = N'cntdte';

