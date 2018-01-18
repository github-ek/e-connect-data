CREATE TABLE [dbo].[wh_basepoint] (
    [wh_id]            NVARCHAR (32)   NOT NULL,
    [basepoint_id]     NVARCHAR (32)   NOT NULL,
    [latitude]         NUMERIC (19, 4) NOT NULL,
    [longitude]        NUMERIC (19, 4) NOT NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    CONSTRAINT [wh_basepoint_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [basepoint_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The warehouse basepoint table defines different base points in the warehouse for mapping the RFID locations coordinates against such reference', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_basepoint';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the warehouse of the base point', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_basepoint', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Base point identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_basepoint', @level2type = N'COLUMN', @level2name = N'basepoint_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The real latitude coordinate value for the base point', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_basepoint', @level2type = N'COLUMN', @level2name = N'latitude';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The real longitude coordinate value for the base point', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_basepoint', @level2type = N'COLUMN', @level2name = N'longitude';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_basepoint', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_basepoint', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_basepoint', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_basepoint', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

