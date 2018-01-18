CREATE TABLE [dbo].[rf_term_mst] (
    [rf_ven_nam]       NVARCHAR (10)  NOT NULL,
    [wh_id]            NVARCHAR (32)  NOT NULL,
    [term_id]          NVARCHAR (20)  NOT NULL,
    [dsply_wid]        INT            NOT NULL,
    [dsply_hgt]        INT            NOT NULL,
    [term_typ]         NVARCHAR (15)  NOT NULL,
    [devcod]           NVARCHAR (20)  NOT NULL,
    [locale_id]        NVARCHAR (20)  NOT NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    [recplycod]        NVARCHAR (2)   NULL,
    [recplyfil]        NVARCHAR (200) NULL,
    CONSTRAINT [rf_term_mst_pk] PRIMARY KEY CLUSTERED ([rf_ven_nam] ASC, [wh_id] ASC, [term_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains terminal configuration settings used by MTF.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_term_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the vendor who manufactures the RF devices.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_term_mst', @level2type = N'COLUMN', @level2name = N'rf_ven_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The warehouse for this RF terminal.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_term_mst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is value identifying the terminal''s response or answerback.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_term_mst', @level2type = N'COLUMN', @level2name = N'term_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of columns in character cells reflecting the width of client''s terminal display screen.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_term_mst', @level2type = N'COLUMN', @level2name = N'dsply_wid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of rows in character cells reflecting the height of client''s terminal display screen.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_term_mst', @level2type = N'COLUMN', @level2name = N'dsply_hgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies the terminal''s screen type. (i.e. handheld, vehicle).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_term_mst', @level2type = N'COLUMN', @level2name = N'term_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Terminal''s unique identifier within the application.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_term_mst', @level2type = N'COLUMN', @level2name = N'devcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the locale of the device, dictates the language spoken on voice devices.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_term_mst', @level2type = N'COLUMN', @level2name = N'locale_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_term_mst', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_term_mst', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_term_mst', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_term_mst', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Record replay code. (Various options are: R for Record, P for Fast Play and PP for Play with Pauses).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_term_mst', @level2type = N'COLUMN', @level2name = N'recplycod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Absolute path for the record file.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_term_mst', @level2type = N'COLUMN', @level2name = N'recplyfil';

