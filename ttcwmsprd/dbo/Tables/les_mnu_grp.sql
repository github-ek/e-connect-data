CREATE TABLE [dbo].[les_mnu_grp] (
    [mnu_grp]    NVARCHAR (20)  NOT NULL,
    [par_grp]    NVARCHAR (20)  NOT NULL,
    [mnu_seq]    INT            NOT NULL,
    [btn_img_id] NVARCHAR (512) NULL,
    [grp_nam]    NVARCHAR (40)  NULL,
    CONSTRAINT [les_mnu_grp_pk] PRIMARY KEY CLUSTERED ([mnu_grp] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [les_mnu_grp_pargrp]
    ON [dbo].[les_mnu_grp]([par_grp] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains configuration data for all menu groups in the MCS Framework.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_grp', @level2type = N'COLUMN', @level2name = N'mnu_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which menu group is this groups parent.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_grp', @level2type = N'COLUMN', @level2name = N'par_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An integer value to provide specific sorting of the groups.  The sorting method is by sort sequence first, then by alphabetical by description.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_grp', @level2type = N'COLUMN', @level2name = N'mnu_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Filename of the icon for this menu group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_grp', @level2type = N'COLUMN', @level2name = N'btn_img_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mnu_grp', @level2type = N'COLUMN', @level2name = N'grp_nam';

