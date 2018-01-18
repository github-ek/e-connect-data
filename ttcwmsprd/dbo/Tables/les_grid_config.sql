CREATE TABLE [dbo].[les_grid_config] (
    [usr_id]         NVARCHAR (40) NOT NULL,
    [locale_id]      NVARCHAR (20) NOT NULL,
    [appl_id]        NVARCHAR (20) NOT NULL,
    [frm_id]         NVARCHAR (40) NOT NULL,
    [grid_nam]       NVARCHAR (60) NOT NULL,
    [grid_fld_nam]   NVARCHAR (60) NOT NULL,
    [grid_fld_width] INT           NULL,
    [grid_fld_seq]   INT           NULL,
    [grid_fld_vis]   INT           NULL,
    [srt_dir]        INT           NULL,
    [srt_idx]        INT           NULL,
    [grp_nam]        NVARCHAR (40) NULL,
    CONSTRAINT [les_grid_config_pk] PRIMARY KEY CLUSTERED ([usr_id] ASC, [locale_id] ASC, [appl_id] ASC, [frm_id] ASC, [grid_nam] ASC, [grid_fld_nam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores configurations of grids on an application and user specific level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_grid_config';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Each grid configuration applies to a single user, or to ALL users.  If this value is ''''LES'''', it applies to all users.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_grid_config', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'There can be different grid configurations for each locale.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_grid_config', @level2type = N'COLUMN', @level2name = N'locale_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which application the grid is in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_grid_config', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which form the grid is on.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_grid_config', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Object name of the grid that this configuration applies to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_grid_config', @level2type = N'COLUMN', @level2name = N'grid_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of a column in the grid', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_grid_config', @level2type = N'COLUMN', @level2name = N'grid_fld_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Width of this column in pixels', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_grid_config', @level2type = N'COLUMN', @level2name = N'grid_fld_width';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order of display for this column', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_grid_config', @level2type = N'COLUMN', @level2name = N'grid_fld_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag indicating this grid is hidden or visible', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_grid_config', @level2type = N'COLUMN', @level2name = N'grid_fld_vis';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_grid_config', @level2type = N'COLUMN', @level2name = N'grp_nam';

