CREATE TABLE [dbo].[grd_view_detail] (
    [lvl_id]            NVARCHAR (40)  NOT NULL,
    [appl_id]           NVARCHAR (20)  NOT NULL,
    [frm_id]            NVARCHAR (40)  NOT NULL,
    [addon_id]          NVARCHAR (512) NOT NULL,
    [grd_var_nam]       NVARCHAR (40)  NOT NULL,
    [view_nam]          NVARCHAR (40)  NOT NULL,
    [usr_id]            NVARCHAR (40)  NOT NULL,
    [view_type]         NVARCHAR (1)   NOT NULL,
    [view_fld_nam]      NVARCHAR (100) NOT NULL,
    [view_fld_width]    INT            DEFAULT ((40)) NULL,
    [view_fld_seq]      INT            DEFAULT ((0)) NULL,
    [view_fld_vis]      INT            DEFAULT ((1)) NULL,
    [view_fld_sort_ord] INT            DEFAULT ((-1)) NULL,
    [view_fld_sort_typ] INT            DEFAULT ((0)) NULL,
    [view_grp_ord]      INT            DEFAULT ((-1)) NULL,
    [view_formula]      NVARCHAR (200) NULL,
    [fixed_style]       NVARCHAR (1)   NULL,
    [grp_nam]           NVARCHAR (40)  NULL,
    CONSTRAINT [grd_view_detail_pk] PRIMARY KEY CLUSTERED ([lvl_id] ASC, [appl_id] ASC, [frm_id] ASC, [addon_id] ASC, [view_nam] ASC, [usr_id] ASC, [grd_var_nam] ASC, [view_type] ASC, [view_fld_nam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table has the detail information of a grid view.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_detail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'PK for the Entity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_detail', @level2type = N'COLUMN', @level2name = N'lvl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The application ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_detail', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the Form.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_detail', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The addon ID of the Form.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_detail', @level2type = N'COLUMN', @level2name = N'addon_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the view - possible MLS.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_detail', @level2type = N'COLUMN', @level2name = N'view_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user name of the customized view, otherwise LES for system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_detail', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'C=Column, G=Group By, T=Total.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_detail', @level2type = N'COLUMN', @level2name = N'view_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The field name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_detail', @level2type = N'COLUMN', @level2name = N'view_fld_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The width of the field.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_detail', @level2type = N'COLUMN', @level2name = N'view_fld_width';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The order of the field (applies to groups as well).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_detail', @level2type = N'COLUMN', @level2name = N'view_fld_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines Visibility.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_detail', @level2type = N'COLUMN', @level2name = N'view_fld_vis';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines the sorting order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_detail', @level2type = N'COLUMN', @level2name = N'view_fld_sort_ord';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines Sorting: -1 no Sort, 0, Ascending, 1 Descending.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_detail', @level2type = N'COLUMN', @level2name = N'view_fld_sort_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Grouping order of the fields', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_detail', @level2type = N'COLUMN', @level2name = N'view_grp_ord';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The formula of the field if it is a total.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_detail', @level2type = N'COLUMN', @level2name = N'view_formula';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fixed style of the field: L = Left Fixed, R = Right Fixed and N = None Fixed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_detail', @level2type = N'COLUMN', @level2name = N'fixed_style';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Group Name for the Data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'grd_view_detail', @level2type = N'COLUMN', @level2name = N'grp_nam';

