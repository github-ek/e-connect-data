CREATE TABLE [dbo].[dda_fltr_grp] (
    [fltr_grp]      NVARCHAR (60) NOT NULL,
    [cust_lvl]      INT           NOT NULL,
    [srtseq]        INT           NOT NULL,
    [grp_typ]       NUMERIC (1)   NOT NULL,
    [par_grp]       NVARCHAR (60) NULL,
    [attach_grp]    NVARCHAR (60) NULL,
    [attach_loc]    INT           NULL,
    [attach_offset] INT           NULL,
    [grp_nam]       NVARCHAR (40) NULL,
    [moddte]        DATETIME      NULL,
    [mod_usr_id]    NVARCHAR (40) NULL,
    CONSTRAINT [dda_fltr_grp_pk] PRIMARY KEY CLUSTERED ([fltr_grp] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains the data needed to configure a filter group.  It is joined with les_layout to allow DDA to paint the  layout controsl for the filter groups.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_fltr_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The filter group identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_fltr_grp', @level2type = N'COLUMN', @level2name = N'fltr_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_fltr_grp', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The sort order for appearance of the groups.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_fltr_grp', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of group.  0 = Tab, 1 = Group Box.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_fltr_grp', @level2type = N'COLUMN', @level2name = N'grp_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines a parent group for this group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_fltr_grp', @level2type = N'COLUMN', @level2name = N'par_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines a group to attach to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_fltr_grp', @level2type = N'COLUMN', @level2name = N'attach_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_fltr_grp', @level2type = N'COLUMN', @level2name = N'grp_nam';

