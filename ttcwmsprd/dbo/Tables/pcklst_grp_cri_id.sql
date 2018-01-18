﻿CREATE TABLE [dbo].[pcklst_grp_cri_id] (
    [currval] NUMERIC (28) IDENTITY (1, 1) NOT NULL,
    [nextval] NUMERIC (28) NULL,
    [seedval] NUMERIC (28) NULL,
    [incval]  NUMERIC (28) NULL,
    [maxval]  NUMERIC (28) NULL,
    PRIMARY KEY CLUSTERED ([currval] ASC) WITH (FILLFACTOR = 90)
);

