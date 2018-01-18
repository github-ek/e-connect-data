CREATE TABLE [dbo].[nottyp_hdr] (
    [nottyp]           NVARCHAR (40) NOT NULL,
    [bill_print_flg]   INT           DEFAULT ((0)) NOT NULL,
    [pack_print_flg]   INT           DEFAULT ((0)) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [nottyp_hdr_pk] PRIMARY KEY CLUSTERED ([nottyp] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [nottyp_hdr_bill_print_flg] CHECK ([bill_print_flg]=(0) OR [bill_print_flg]=(1)),
    CONSTRAINT [nottyp_hdr_pack_print_flg] CHECK ([pack_print_flg]=(0) OR [pack_print_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Note Type Header - This table defines a note type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'nottyp_hdr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicate order notes type. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'nottyp_hdr', @level2type = N'COLUMN', @level2name = N'nottyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if notes of this type should be printed on the Bill of Lading.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'nottyp_hdr', @level2type = N'COLUMN', @level2name = N'bill_print_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if notes of this type should be printed on the Packing Slip.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'nottyp_hdr', @level2type = N'COLUMN', @level2name = N'pack_print_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'nottyp_hdr', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'nottyp_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'nottyp_hdr', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'nottyp_hdr', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

