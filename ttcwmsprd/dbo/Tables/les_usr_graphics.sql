CREATE TABLE [dbo].[les_usr_graphics] (
    [usr_id]     NVARCHAR (40) NOT NULL,
    [frm_id]     NVARCHAR (40) NOT NULL,
    [obj_id]     NVARCHAR (40) NOT NULL,
    [fore_color] INT           NULL,
    [back_color] INT           NULL,
    [draw_width] INT           NULL,
    [fill_style] INT           NULL,
    [draw_style] INT           NULL,
    [moddte]     DATETIME      NULL,
    [mod_usr_id] NVARCHAR (40) NULL,
    CONSTRAINT [les_usr_grphics_pk] PRIMARY KEY CLUSTERED ([usr_id] ASC, [frm_id] ASC, [obj_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table supports the user defined color scheme.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_graphics';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier and user''s login.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_graphics', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The form containing the object to which the colors or graphics will be applied.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_graphics', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier for the object to which the colors or graphics will be applied.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_graphics', @level2type = N'COLUMN', @level2name = N'obj_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'RGB value for the foreground color.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_graphics', @level2type = N'COLUMN', @level2name = N'fore_color';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'RGB value for the background color.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_graphics', @level2type = N'COLUMN', @level2name = N'back_color';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A numeric expression from 1 through 32,767. This value represents the width of the line in pixels.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_graphics', @level2type = N'COLUMN', @level2name = N'draw_width';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An integer that specifies a fill pattern.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_graphics', @level2type = N'COLUMN', @level2name = N'fill_style';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An integer that specifies a line style.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_graphics', @level2type = N'COLUMN', @level2name = N'draw_style';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last time this user''s information was modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_graphics', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user that last changed this user''s information.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_usr_graphics', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

