CREATE TABLE [dbo].[sl_fld_fmt_vp] (
    [data_typ_cd]      NVARCHAR (5)   NOT NULL,
    [fld_fmt_vp_seq]   NUMERIC (5)    NOT NULL,
    [fld_fmt_ordr]     NUMERIC (5)    NULL,
    [fld_fmt]          NVARCHAR (50)  NULL,
    [descr]            NVARCHAR (250) NULL,
    [u_version]        NUMERIC (5)    NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [sl_fld_fmt_vp_pk] PRIMARY KEY CLUSTERED ([data_typ_cd] ASC, [fld_fmt_vp_seq] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines valid possibility of field format.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_fld_fmt_vp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The data type of field: C = Character, D = Date/Time, N = Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_fld_fmt_vp', @level2type = N'COLUMN', @level2name = N'data_typ_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Field format VP sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_fld_fmt_vp', @level2type = N'COLUMN', @level2name = N'fld_fmt_vp_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Field format order', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_fld_fmt_vp', @level2type = N'COLUMN', @level2name = N'fld_fmt_ordr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Field format', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_fld_fmt_vp', @level2type = N'COLUMN', @level2name = N'fld_fmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Description', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_fld_fmt_vp', @level2type = N'COLUMN', @level2name = N'descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_fld_fmt_vp', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_fld_fmt_vp', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_fld_fmt_vp', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_fld_fmt_vp', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_fld_fmt_vp', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

