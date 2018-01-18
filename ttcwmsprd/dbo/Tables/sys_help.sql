CREATE TABLE [dbo].[sys_help] (
    [help_obj_typ] NVARCHAR (100) NOT NULL,
    [help_obj_id]  NVARCHAR (100) NOT NULL,
    [appl_id]      NVARCHAR (20)  NOT NULL,
    [frm_id]       NVARCHAR (40)  NOT NULL,
    [addon_id]     NVARCHAR (512) NOT NULL,
    [cust_lvl]     INT            NOT NULL,
    [help_id]      NVARCHAR (64)  NULL,
    [help_fil_id]  NVARCHAR (20)  NULL,
    [grp_nam]      NVARCHAR (40)  NULL,
    CONSTRAINT [sys_help_pk] PRIMARY KEY CLUSTERED ([help_obj_id] ASC, [help_obj_typ] ASC, [appl_id] ASC, [frm_id] ASC, [addon_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to link help files and topics to system objects.  ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_help';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Indicates if the help topic is specific to a specific application.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_help', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Indicates if the help topic is specific to a specific form.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_help', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Indicates if the help topic is specific to a add on configuration.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_help', @level2type = N'COLUMN', @level2name = N'addon_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_help', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Points to the context level help topic for this system object.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_help', @level2type = N'COLUMN', @level2name = N'help_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Points to the help file master record that lists the help file in which the help topic is located', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_help', @level2type = N'COLUMN', @level2name = N'help_fil_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sys_help', @level2type = N'COLUMN', @level2name = N'grp_nam';

