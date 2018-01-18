CREATE TABLE [dbo].[sysctl] (
    [numcod]  NVARCHAR (30)    NOT NULL,
    [prefix]  NVARCHAR (15)    NULL,
    [prelen]  INT              NOT NULL,
    [prlflg]  INT              NULL,
    [lstseq]  INT              NOT NULL,
    [seqlen]  INT              NOT NULL,
    [suffix]  NVARCHAR (10)    NULL,
    [suflen]  INT              NOT NULL,
    [btsflg]  INT              NULL,
    [seqflg]  INT              NULL,
    [grp_nam] NVARCHAR (40)    NULL,
    [rowid]   UNIQUEIDENTIFIER DEFAULT (newid()) ROWGUIDCOL NULL,
    CONSTRAINT [sysctl_pk] PRIMARY KEY CLUSTERED ([numcod] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sysctl_btsflg_ck] CHECK ([btsflg]=(0) OR [btsflg]=(1)),
    CONSTRAINT [sysctl_prlflg_ck] CHECK ([prlflg]=(0) OR [prlflg]=(1)),
    CONSTRAINT [sysctl_seqflg_ck] CHECK ([seqflg]=(0) OR [seqflg]=(1))
);

