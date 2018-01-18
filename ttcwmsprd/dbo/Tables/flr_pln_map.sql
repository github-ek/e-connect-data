CREATE TABLE [dbo].[flr_pln_map] (
    [wh_id]            NVARCHAR (32) NOT NULL,
    [bldg_id]          NVARCHAR (10) NOT NULL,
    [id]               NVARCHAR (40) NOT NULL,
    [type]             NVARCHAR (40) NOT NULL,
    [x]                INT           NOT NULL,
    [y]                INT           NOT NULL,
    [height]           INT           NOT NULL,
    [width]            INT           NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [flr_pln_map_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [bldg_id] ASC, [id] ASC, [type] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The flr_pln_map table provides the mapping for areas on the application setup warehouse map', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'flr_pln_map';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'flr_pln_map', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Building ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'flr_pln_map', @level2type = N'COLUMN', @level2name = N'bldg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The area ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'flr_pln_map', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Area type (i.e. building, area, etc...)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'flr_pln_map', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The horizontal position on the map', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'flr_pln_map', @level2type = N'COLUMN', @level2name = N'x';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The vertical position on the map', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'flr_pln_map', @level2type = N'COLUMN', @level2name = N'y';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The height of the area in pixels', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'flr_pln_map', @level2type = N'COLUMN', @level2name = N'height';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The width of the area in pixels', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'flr_pln_map', @level2type = N'COLUMN', @level2name = N'width';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'flr_pln_map', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'flr_pln_map', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'flr_pln_map', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'flr_pln_map', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

