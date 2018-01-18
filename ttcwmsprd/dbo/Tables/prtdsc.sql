CREATE TABLE [dbo].[prtdsc] (
    [colnam]    NVARCHAR (100) NOT NULL,
    [colval]    NVARCHAR (200) NOT NULL,
    [locale_id] NVARCHAR (20)  NOT NULL,
    [lngdsc]    NVARCHAR (250) NOT NULL,
    [short_dsc] NVARCHAR (20)  NULL,
    CONSTRAINT [prtdsc_pk] PRIMARY KEY CLUSTERED ([colval] ASC, [locale_id] ASC, [colnam] ASC) WITH (FILLFACTOR = 90)
);

