CREATE TABLE [dbo].[reltyp_cmd] (
    [wh_id]            NVARCHAR (32)  NOT NULL,
    [reltyp_id]        NVARCHAR (10)  NOT NULL,
    [srcare]           NVARCHAR (10)  NOT NULL,
    [rel_cmd]          NVARCHAR (200) NULL,
    [extra_args]       NVARCHAR (150) NULL,
    [pricod]           INT            NULL,
    [grp_cols]         NVARCHAR (150) NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [reltyp_cmd_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [reltyp_id] ASC, [srcare] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Release Type Command table is the table that defines the command, operation code and priority of an area for Physical Inventory Count.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reltyp_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - Warehouse where release happens', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reltyp_cmd', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Release Type ID - Type of work being released (i.e. a count type such as A (audit count))', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reltyp_cmd', @level2type = N'COLUMN', @level2name = N'reltyp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source Area - area where the PI count will be released', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reltyp_cmd', @level2type = N'COLUMN', @level2name = N'srcare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Release command - the command to execute during release', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reltyp_cmd', @level2type = N'COLUMN', @level2name = N'rel_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Additional arguments - user can add to release commands', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reltyp_cmd', @level2type = N'COLUMN', @level2name = N'extra_args';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Priority Code - determines Base Priority in the work queue', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reltyp_cmd', @level2type = N'COLUMN', @level2name = N'pricod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Group Columns - specifies columns by which to group counts', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reltyp_cmd', @level2type = N'COLUMN', @level2name = N'grp_cols';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reltyp_cmd', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reltyp_cmd', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reltyp_cmd', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reltyp_cmd', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

