CREATE TABLE [dbo].[locmap] (
    [stoloc]           NVARCHAR (20) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [loclvl]           INT           NOT NULL,
    [poslft]           INT           NOT NULL,
    [postop]           INT           NOT NULL,
    [poswid]           INT           NOT NULL,
    [poshgt]           INT           NOT NULL,
    [locflg]           INT           NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [locmap_pk] PRIMARY KEY CLUSTERED ([stoloc] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [locmap_locflg_ck] CHECK ([locflg]=(0) OR [locflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmap', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmap', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmap', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmap', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmap', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Comfirm Location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmap', @level2type = N'COLUMN', @level2name = N'locflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The height of the position', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmap', @level2type = N'COLUMN', @level2name = N'poshgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The width of the position', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmap', @level2type = N'COLUMN', @level2name = N'poswid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Postion top', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmap', @level2type = N'COLUMN', @level2name = N'postop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Postion left', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmap', @level2type = N'COLUMN', @level2name = N'poslft';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The location level', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmap', @level2type = N'COLUMN', @level2name = N'loclvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmap', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The storage location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmap', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Location map table is used to map the positon of locations.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'locmap';

