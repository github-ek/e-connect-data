CREATE TABLE [dbo].[usr_faves] (
    [usr_id]    NVARCHAR (40)  NOT NULL,
    [fave_name] NVARCHAR (100) NOT NULL,
    [dda_id]    NVARCHAR (40)  NULL,
    [dda_qual]  NVARCHAR (512) NULL,
    CONSTRAINT [usr_faves_pk] PRIMARY KEY CLUSTERED ([usr_id] ASC, [fave_name] ASC) WITH (FILLFACTOR = 90)
);

