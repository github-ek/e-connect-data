CREATE TABLE [dbo].[wh_lblfmt] (
    [wh_id]            NVARCHAR (32)  NOT NULL,
    [lblfmt]           NVARCHAR (20)  NOT NULL,
    [def_printer]      NVARCHAR (200) NOT NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [wh_lblfmt_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [lblfmt] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse label format.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_lblfmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_lblfmt', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Label Format.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_lblfmt', @level2type = N'COLUMN', @level2name = N'lblfmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default Printer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_lblfmt', @level2type = N'COLUMN', @level2name = N'def_printer';

