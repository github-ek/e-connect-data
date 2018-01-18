CREATE TABLE [dbo].[distro_typ_lodlvl] (
    [distro_typ]       NVARCHAR (40) NOT NULL,
    [lodlvl]           NVARCHAR (1)  NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_dt]      DATETIME      NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [distro_typ_lvl_pk] PRIMARY KEY CLUSTERED ([distro_typ] ASC, [lodlvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The table defines the distribution types for moving inventory put to store location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ_lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The distribution type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ_lodlvl', @level2type = N'COLUMN', @level2name = N'distro_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Levels - Load, Case, Detail.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ_lodlvl', @level2type = N'COLUMN', @level2name = N'lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ_lodlvl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ_lodlvl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ_lodlvl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'distro_typ_lodlvl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

