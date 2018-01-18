CREATE TABLE [dbo].[tree_node_config] (
    [node_typ]       NVARCHAR (40)   NOT NULL,
    [node_mode]      NVARCHAR (20)   NOT NULL,
    [cust_lvl]       INT             NOT NULL,
    [child_list_cmd] NVARCHAR (2000) NULL,
    [child_col]      NVARCHAR (250)  NULL,
    [desc_col]       NVARCHAR (40)   NULL,
    [child_typ]      NVARCHAR (40)   NULL,
    [child_typ_col]  NVARCHAR (40)   NULL,
    [img_id]         NVARCHAR (512)  NULL,
    [img_id_col]     NVARCHAR (40)   NULL,
    [exp_img_id]     NVARCHAR (512)  NULL,
    [exp_img_id_col] NVARCHAR (40)   NULL,
    [sel_img_id]     NVARCHAR (512)  NULL,
    [sel_img_id_col] NVARCHAR (40)   NULL,
    [par_flds]       NVARCHAR (256)  NULL,
    [node_ctrl]      NVARCHAR (40)   NULL,
    [node_list_cmd]  NVARCHAR (2000) NULL,
    [grp_nam]        NVARCHAR (40)   NULL,
    CONSTRAINT [tree_node_cfg_pk] PRIMARY KEY CLUSTERED ([node_typ] ASC, [node_mode] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains configuration data for MCS Tree Views and MCS Explorer controls.  These controls use the data in this table to dynamically build trees.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tree_node_config';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier.  This defines a specific node type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tree_node_config', @level2type = N'COLUMN', @level2name = N'node_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A tree can be placed into modes that link data differently in the tree.  The default value of LES applies to all modes unless a more specific mode is found.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tree_node_config', @level2type = N'COLUMN', @level2name = N'node_mode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tree_node_config', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines a command to generate a list of children nodes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tree_node_config', @level2type = N'COLUMN', @level2name = N'child_list_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines the column that represents the child node data.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tree_node_config', @level2type = N'COLUMN', @level2name = N'child_col';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines a column that is used to display a description instead of the data value for child nodes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tree_node_config', @level2type = N'COLUMN', @level2name = N'desc_col';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines what kind of nodes the children are.  This column takes precedence over the child_typ_col.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tree_node_config', @level2type = N'COLUMN', @level2name = N'child_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines a column of data in the results that lists what type of node EACH child node represents.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tree_node_config', @level2type = N'COLUMN', @level2name = N'child_typ_col';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Filename of the icon for this node.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tree_node_config', @level2type = N'COLUMN', @level2name = N'img_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines a column in the data that lists an img_id for each node.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tree_node_config', @level2type = N'COLUMN', @level2name = N'img_id_col';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Filename of the expanded icon for this node.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tree_node_config', @level2type = N'COLUMN', @level2name = N'exp_img_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines a column in the data that lists an img_id for each node when expanded.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tree_node_config', @level2type = N'COLUMN', @level2name = N'exp_img_id_col';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Filename of the selected icon for this node.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tree_node_config', @level2type = N'COLUMN', @level2name = N'sel_img_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines a column in the data that lists an img_id for each node when selected.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tree_node_config', @level2type = N'COLUMN', @level2name = N'sel_img_id_col';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines the names of parents fields that should be used to pass to the child_list_cmd', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tree_node_config', @level2type = N'COLUMN', @level2name = N'par_flds';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The command that is executed when a node is clicked in the MCS Explorer control.  The results are passed to the node_ctl.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tree_node_config', @level2type = N'COLUMN', @level2name = N'node_list_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tree_node_config', @level2type = N'COLUMN', @level2name = N'grp_nam';

