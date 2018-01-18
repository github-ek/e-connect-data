CREATE TABLE [dbo].[vehacc] (
    [vehtyp] NVARCHAR (10) NOT NULL,
    [locacc] NVARCHAR (30) NOT NULL,
    CONSTRAINT [vehacc_pk] PRIMARY KEY CLUSTERED ([vehtyp] ASC, [locacc] ASC) WITH (FILLFACTOR = 90)
);

