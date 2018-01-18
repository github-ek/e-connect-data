CREATE TABLE [dbo].[crtmst] (
    [oprcod]  NVARCHAR (9)   NOT NULL,
    [prfnam]  NVARCHAR (30)  NOT NULL,
    [prftyp]  NVARCHAR (30)  NOT NULL,
    [crtnam]  NVARCHAR (30)  NOT NULL,
    [srtseq]  INT            NOT NULL,
    [prstr1]  NVARCHAR (150) NULL,
    [prstr2]  NVARCHAR (150) NULL,
    [grp_nam] NVARCHAR (40)  NULL,
    CONSTRAINT [crtmst_pk] PRIMARY KEY CLUSTERED ([oprcod] ASC, [prfnam] ASC, [prftyp] ASC, [crtnam] ASC, [srtseq] ASC) WITH (FILLFACTOR = 90)
);

