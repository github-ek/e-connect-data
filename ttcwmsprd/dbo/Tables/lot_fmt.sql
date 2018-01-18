CREATE TABLE [dbo].[lot_fmt] (
    [lot_fmt_id]       NVARCHAR (10)  NOT NULL,
    [lot_dte_cod]      INT            NOT NULL,
    [raw_lot_fmt]      NVARCHAR (25)  NOT NULL,
    [lot_valdt_cmd]    NVARCHAR (100) NOT NULL,
    [lot_date_cmd]     NVARCHAR (100) NOT NULL,
    [u_version]        INT            NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [lot_fmt_pk] PRIMARY KEY CLUSTERED ([lot_fmt_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table holds the lot parsing command information.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lot_fmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier for the lot format records.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lot_fmt', @level2type = N'COLUMN', @level2name = N'lot_fmt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The lot date control, 1 for production date, 2 for expiration date, 0 for neither.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lot_fmt', @level2type = N'COLUMN', @level2name = N'lot_dte_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The format of the lot number for the corresponding item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lot_fmt', @level2type = N'COLUMN', @level2name = N'raw_lot_fmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The lot number validation command to be used for the corresponding item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lot_fmt', @level2type = N'COLUMN', @level2name = N'lot_valdt_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The lot date parsing command to be used for the corresponding item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lot_fmt', @level2type = N'COLUMN', @level2name = N'lot_date_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lot_fmt', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lot_fmt', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lot_fmt', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lot_fmt', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lot_fmt', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

