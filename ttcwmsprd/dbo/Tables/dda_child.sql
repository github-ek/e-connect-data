CREATE TABLE [dbo].[dda_child] (
    [dda_id]        NVARCHAR (40)   NOT NULL,
    [dda_typ]       NVARCHAR (1)    NOT NULL,
    [dda_child_id]  NVARCHAR (40)   NOT NULL,
    [dda_child_typ] NVARCHAR (1)    NOT NULL,
    [cust_lvl]      INT             NOT NULL,
    [child_flds]    NVARCHAR (2000) NULL,
    [srtseq]        INT             NULL,
    [ena_flg]       INT             DEFAULT ((0)) NULL,
    [init_vis_flg]  INT             DEFAULT ((0)) NULL,
    [grp_nam]       NVARCHAR (40)   NULL,
    CONSTRAINT [dda_child_pk] PRIMARY KEY CLUSTERED ([dda_id] ASC, [dda_typ] ASC, [dda_child_id] ASC, [dda_child_typ] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [dda_child_enaflgck] CHECK ([ena_flg]=(0) OR [ena_flg]=(1)),
    CONSTRAINT [ddachd_inivisflgck] CHECK ([init_vis_flg]=(0) OR [init_vis_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to setup child DDA realtions as well as cascade DDA', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_child';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The parent DDA identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_child', @level2type = N'COLUMN', @level2name = N'dda_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The parent DDA type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_child', @level2type = N'COLUMN', @level2name = N'dda_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The child DDA identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_child', @level2type = N'COLUMN', @level2name = N'dda_child_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The child DDA type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_child', @level2type = N'COLUMN', @level2name = N'dda_child_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_child', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fields whose data is passed from the parent to the child.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_child', @level2type = N'COLUMN', @level2name = N'child_flds';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'sequence the children are displayed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_child', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines if the child is enabled', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_child', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Web Only:Indicates if the child is initially visible.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_child', @level2type = N'COLUMN', @level2name = N'init_vis_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_child', @level2type = N'COLUMN', @level2name = N'grp_nam';

