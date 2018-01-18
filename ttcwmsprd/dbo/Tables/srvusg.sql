CREATE TABLE [dbo].[srvusg] (
    [stverb]  NVARCHAR (15)   NOT NULL,
    [stnoun]  NVARCHAR (60)   NOT NULL,
    [cmplvl]  NVARCHAR (100)  NOT NULL,
    [tcpadr]  NVARCHAR (45)   NOT NULL,
    [lstdte]  DATETIME        NULL,
    [numexe]  INT             NULL,
    [tottim]  NUMERIC (19, 4) NULL,
    [usr_id]  NVARCHAR (40)   NULL,
    [grp_nam] NVARCHAR (40)   NULL,
    CONSTRAINT [srvusg_pk] PRIMARY KEY CLUSTERED ([stverb] ASC, [stnoun] ASC, [cmplvl] ASC, [tcpadr] ASC) WITH (FILLFACTOR = 90)
);

