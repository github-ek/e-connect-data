CREATE TABLE [dbo].[invsum] (
    [arecod]            NVARCHAR (10)   NOT NULL,
    [stoloc]            NVARCHAR (20)   NOT NULL,
    [prtnum]            NVARCHAR (50)   NOT NULL,
    [prt_client_id]     NVARCHAR (32)   NOT NULL,
    [wh_id]             NVARCHAR (32)   NOT NULL,
    [invsts]            NVARCHAR (4)    NULL,
    [untpak]            INT             NOT NULL,
    [untcas]            INT             NOT NULL,
    [untpal]            INT             NOT NULL,
    [untqty]            INT             NOT NULL,
    [comqty]            INT             NOT NULL,
    [pndqty]            INT             NOT NULL,
    [com_catch_qty]     NUMERIC (19, 4) NULL,
    [catch_qty]         NUMERIC (19, 4) NULL,
    [olddte]            DATETIME        NOT NULL,
    [newdte]            DATETIME        NOT NULL,
    [old_expire_dte]    DATETIME        NULL,
    [new_expire_dte]    DATETIME        NULL,
    [old_inv_attr_dte1] DATETIME        NULL,
    [new_inv_attr_dte1] DATETIME        NULL,
    [old_inv_attr_dte2] DATETIME        NULL,
    [new_inv_attr_dte2] DATETIME        NULL,
    [u_version]         INT             NULL,
    [ins_dt]            DATETIME        NULL,
    [last_upd_dt]       DATETIME        NULL,
    [ins_user_id]       NVARCHAR (40)   NULL,
    [last_upd_user_id]  NVARCHAR (40)   NULL,
    [rowid]             INT             IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [invsum_pk] PRIMARY KEY CLUSTERED ([arecod] ASC, [stoloc] ASC, [prtnum] ASC, [wh_id] ASC, [prt_client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [invsum_prt_are_sto]
    ON [dbo].[invsum]([prtnum] ASC, [arecod] ASC, [stoloc] ASC, [wh_id] ASC, [prt_client_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE UNIQUE NONCLUSTERED INDEX [invsum_rowid]
    ON [dbo].[invsum]([rowid] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Area Code.  Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage Location.  Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number.  Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The client which owns the item number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Id.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Status.  Used when specifying product criteria for future holds.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Units per pack of the component to be consumed.  If set to 0, there is no restriction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'untpak';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Units per case of the component to be consumed.  If set to 0, there is no restriction.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'untcas';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit Per Pallet', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'untpal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit quantity of finished good produced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'untqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Committed Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'comqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pending quantity to locaton', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'pndqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Committed catch quantity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'com_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Current catch quantity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of old inventory', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'olddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of new inventory', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'newdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expiration date of the old inventory', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'old_expire_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expiration date of the new inventory', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'new_expire_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory atttribute Date1 date of the old inventory', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'old_inv_attr_dte1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory atttribute Date1 date of the new inventory', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'new_inv_attr_dte1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory atttribute Date2 date of the old inventory', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'old_inv_attr_dte2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory atttribute Date2 date of the new inventory', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'new_inv_attr_dte2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'invsum', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

