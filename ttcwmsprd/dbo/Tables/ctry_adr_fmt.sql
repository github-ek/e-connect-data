CREATE TABLE [dbo].[ctry_adr_fmt] (
    [ctry_name] NVARCHAR (60) NOT NULL,
    [adrcty]    NVARCHAR (70) NOT NULL,
    [adrpsz]    NVARCHAR (20) NOT NULL,
    [dom_flg]   INT           NOT NULL,
    [pers_cd]   NVARCHAR (1)  NOT NULL,
    [adr_fmt]   NVARCHAR (20) NOT NULL,
    [grp_nam]   NVARCHAR (40) NULL,
    CONSTRAINT [ctry_adr_fmt_pk] PRIMARY KEY CLUSTERED ([ctry_name] ASC, [adrcty] ASC, [adrpsz] ASC, [dom_flg] ASC, [pers_cd] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [ctry_adr_fmtdomflg] CHECK ([dom_flg]=(0) OR [dom_flg]=(1))
);

