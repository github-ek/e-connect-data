CREATE TABLE [dbo].[pck_area] (
    [pck_arecod]       NVARCHAR (10) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [arecod]           NVARCHAR (10) NOT NULL,
    [bldg_id]          NVARCHAR (10) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [pck_area_pk] PRIMARY KEY CLUSTERED ([pck_arecod] ASC, [wh_id] ASC, [bldg_id] ASC, [arecod] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'stored on the dscmst table with colnam as ''pck_arecod|wh_id''', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_area';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique value of one picking area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_area', @level2type = N'COLUMN', @level2name = N'pck_arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID for the Picking Area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_area', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Areas assigned to this picking area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_area', @level2type = N'COLUMN', @level2name = N'arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies which building this area resides in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_area', @level2type = N'COLUMN', @level2name = N'bldg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_area', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_area', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_area', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pck_area', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

