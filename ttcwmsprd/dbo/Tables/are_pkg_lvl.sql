CREATE TABLE [dbo].[are_pkg_lvl] (
    [arecod]           NVARCHAR (10) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [pkglvl]           NVARCHAR (2)  NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [are_pkg_lvl_pk] PRIMARY KEY CLUSTERED ([arecod] ASC, [wh_id] ASC, [pkglvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to maintain the package levels supported for an area for cartonization.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pkg_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Area Code - The area for which this package level is configured', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pkg_lvl', @level2type = N'COLUMN', @level2name = N'arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Identifier - The warehouse for which this store is configured', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pkg_lvl', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Package Level - package level that is allowed for this area e.g. Cases, Inner Packs, etc', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pkg_lvl', @level2type = N'COLUMN', @level2name = N'pkglvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert/Add Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pkg_lvl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pkg_lvl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert/Add User', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pkg_lvl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Update User', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_pkg_lvl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

