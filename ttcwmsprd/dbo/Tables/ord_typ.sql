CREATE TABLE [dbo].[ord_typ] (
    [wh_id]            NVARCHAR (32) NOT NULL,
    [ordtyp]           NVARCHAR (20) NOT NULL,
    [bulk_pck_flg]     INT           DEFAULT ((1)) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [ord_typ_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [ordtyp] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [ord_typ_bulk_pck_flgck] CHECK ([bulk_pck_flg]=(0) OR [bulk_pck_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'stored on the dscmst table with colnam as ''ordtyp|wh_id''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID for the order type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_typ', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_typ', @level2type = N'COLUMN', @level2name = N'ordtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'the flag indicated whether the bulk pick is enabled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_typ', @level2type = N'COLUMN', @level2name = N'bulk_pck_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_typ', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_typ', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_typ', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ord_typ', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

