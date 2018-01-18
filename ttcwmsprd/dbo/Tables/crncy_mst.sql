CREATE TABLE [dbo].[crncy_mst] (
    [crncy_code]    NVARCHAR (4)  NOT NULL,
    [decimal_point] NVARCHAR (4)  NULL,
    [thousands_sep] NVARCHAR (4)  NULL,
    [grouping_len]  NVARCHAR (4)  NULL,
    [crncy_sym]     NVARCHAR (6)  NULL,
    [pos_fmt]       NVARCHAR (20) NULL,
    [neg_fmt]       NVARCHAR (20) NULL,
    [frac_digits]   INT           NULL,
    [ena_flg]       INT           NULL,
    [grp_nam]       NVARCHAR (40) NULL,
    CONSTRAINT [crncy_mst_pk] PRIMARY KEY CLUSTERED ([crncy_code] ASC) WITH (FILLFACTOR = 90)
);

