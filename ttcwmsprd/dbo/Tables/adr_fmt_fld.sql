CREATE TABLE [dbo].[adr_fmt_fld] (
    [adr_fmt]       NVARCHAR (20) NOT NULL,
    [adr_line_num]  INT           NOT NULL,
    [adr_fld_num]   INT           NOT NULL,
    [adr_colnam]    NVARCHAR (30) NULL,
    [adr_const_val] NVARCHAR (30) NULL,
    [delta_pos]     INT           NOT NULL,
    [grp_nam]       NVARCHAR (40) NULL,
    CONSTRAINT [adr_fmt_fld_pk] PRIMARY KEY CLUSTERED ([adr_fmt] ASC, [adr_line_num] ASC, [adr_fld_num] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [adr_fmt_fld_s_ck] CHECK ([adr_colnam] IS NOT NULL OR [adr_const_val] IS NOT NULL)
);

