CREATE TABLE [dbo].[sl_data_layout] (
    [data_lay_id]         NVARCHAR (30)  NOT NULL,
    [data_lay_descr]      NVARCHAR (250) NULL,
    [data_lay_cd]         NVARCHAR (5)   NOT NULL,
    [seg_pad_flg]         NVARCHAR (1)   NOT NULL,
    [seg_len]             NUMERIC (8)    NULL,
    [pad_char]            NVARCHAR (1)   NULL,
    [fld_delim]           NVARCHAR (5)   NULL,
    [pre_fld_delim_char]  NVARCHAR (5)   NULL,
    [post_fld_delim_char] NVARCHAR (5)   NULL,
    [pre_fld_delim_num]   NVARCHAR (5)   NULL,
    [post_fld_delim_num]  NVARCHAR (5)   NULL,
    [pre_fld_delim_dt]    NVARCHAR (5)   NULL,
    [post_fld_delim_dt]   NVARCHAR (5)   NULL,
    [trail_delim_flg]     NVARCHAR (1)   NULL,
    [u_version]           NUMERIC (5)    NULL,
    [ins_dt]              DATETIME       NULL,
    [last_upd_dt]         DATETIME       NULL,
    [ins_user_id]         NVARCHAR (40)  NULL,
    [last_upd_user_id]    NVARCHAR (40)  NULL,
    CONSTRAINT [sl_data_layout_pk] PRIMARY KEY CLUSTERED ([data_lay_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines a data layout.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The data layout identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'data_lay_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of data layout', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'data_lay_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The data layout type: ALG = Process Algorithm (unused at this time), F = Fixed Length, P = Pos. Delimited, PI = Pos. Indep. Delimited', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'data_lay_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Does segment allow padding?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'seg_pad_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The length of pad characters', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'seg_len';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The pad character', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'pad_char';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The field delimiter', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'fld_delim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The prefix delimiter of character type field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'pre_fld_delim_char';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The postfix delimiter of character type field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'post_fld_delim_char';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The prefix delimiter of number type field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'pre_fld_delim_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The postfix delimiter of number type field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'post_fld_delim_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The prefix delimiter of date type field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'pre_fld_delim_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The postfix delimiter of date type field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'post_fld_delim_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Does allow trailing delimiters for IFD?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'trail_delim_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_data_layout', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

