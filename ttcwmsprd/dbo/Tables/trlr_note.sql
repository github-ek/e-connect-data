CREATE TABLE [dbo].[trlr_note] (
    [trlr_id] NVARCHAR (20) NOT NULL,
    [notlin]  NVARCHAR (4)  NOT NULL,
    [nottxt]  NVARCHAR (40) NOT NULL,
    CONSTRAINT [trlr_note_pk] PRIMARY KEY CLUSTERED ([trlr_id] ASC, [notlin] ASC) WITH (FILLFACTOR = 90)
);

