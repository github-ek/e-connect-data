CREATE TABLE [dbo].[dat_fmt] (
    [dat_fmt]      NVARCHAR (40) NOT NULL,
    [dat_fmt_cd]   NVARCHAR (16) NOT NULL,
    [mon_dsp_typ]  NVARCHAR (10) NOT NULL,
    [dat_sep_char] NVARCHAR (14) NOT NULL,
    [grp_nam]      NVARCHAR (40) NULL,
    CONSTRAINT [dat_fmt_pk] PRIMARY KEY CLUSTERED ([dat_fmt] ASC) WITH (FILLFACTOR = 90)
);

