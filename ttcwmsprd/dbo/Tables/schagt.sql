CREATE TABLE [dbo].[schagt] (
    [taskid]  NVARCHAR (20)   NOT NULL,
    [actseq]  INT             NOT NULL,
    [enbflg]  INT             NULL,
    [errflg]  INT             NULL,
    [srwflg]  INT             NULL,
    [cmdtxt]  NVARCHAR (2000) NULL,
    [cmdnot]  NVARCHAR (255)  NULL,
    [schmin]  NVARCHAR (40)   NULL,
    [schhou]  NVARCHAR (40)   NULL,
    [schwkd]  NVARCHAR (40)   NULL,
    [schdom]  NVARCHAR (40)   NULL,
    [schmoy]  NVARCHAR (40)   NULL,
    [trclvl]  NVARCHAR (10)   NULL,
    [moddte]  DATETIME        NULL,
    [modusr]  NVARCHAR (40)   NULL,
    [grp_nam] NVARCHAR (40)   NULL,
    CONSTRAINT [schagt_pk] PRIMARY KEY CLUSTERED ([taskid] ASC, [actseq] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [schagt_enbflg_ck] CHECK ([enbflg]=(0) OR [enbflg]=(1)),
    CONSTRAINT [schagt_errflg_ck] CHECK ([errflg]=(0) OR [errflg]=(1)),
    CONSTRAINT [schagt_srwflg_ck] CHECK ([srwflg]=(0) OR [srwflg]=(1))
);

