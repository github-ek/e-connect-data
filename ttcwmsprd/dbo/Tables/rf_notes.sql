CREATE TABLE [dbo].[rf_notes] (
    [usr_id] NVARCHAR (40)  NOT NULL,
    [notes]  NVARCHAR (240) NULL,
    CONSTRAINT [rf_notes_pk] PRIMARY KEY CLUSTERED ([usr_id] ASC) WITH (FILLFACTOR = 90)
);

