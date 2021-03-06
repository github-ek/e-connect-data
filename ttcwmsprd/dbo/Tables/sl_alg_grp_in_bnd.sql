﻿CREATE TABLE [dbo].[sl_alg_grp_in_bnd] (
    [alg_grp_id]           NVARCHAR (30)  NOT NULL,
    [in_bnd_var_id]        NVARCHAR (30)  NOT NULL,
    [alg_grp_in_bnd_descr] NVARCHAR (250) NULL,
    [u_version]            NUMERIC (5)    NULL,
    [ins_dt]               DATETIME       NULL,
    [last_upd_dt]          DATETIME       NULL,
    [ins_user_id]          NVARCHAR (40)  NULL,
    [last_upd_user_id]     NVARCHAR (40)  NULL,
    CONSTRAINT [sl_alggrpinbndpk] PRIMARY KEY CLUSTERED ([alg_grp_id] ASC, [in_bnd_var_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_lggrpinbndfkgrp] FOREIGN KEY ([alg_grp_id]) REFERENCES [dbo].[sl_alg_def_grp] ([alg_grp_id]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines in bind variable for algorithm group. (Not currently used.)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_grp_in_bnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm group name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_grp_in_bnd', @level2type = N'COLUMN', @level2name = N'alg_grp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The variable name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_grp_in_bnd', @level2type = N'COLUMN', @level2name = N'in_bnd_var_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of variable', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_grp_in_bnd', @level2type = N'COLUMN', @level2name = N'alg_grp_in_bnd_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_grp_in_bnd', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_grp_in_bnd', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_grp_in_bnd', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_grp_in_bnd', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_alg_grp_in_bnd', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

