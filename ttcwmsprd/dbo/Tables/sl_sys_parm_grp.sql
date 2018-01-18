CREATE TABLE [dbo].[sl_sys_parm_grp] (
    [sl_sys_parm_grp]       NVARCHAR (30)  NOT NULL,
    [sl_sys_parm_grp_descr] NVARCHAR (250) NULL,
    [u_version]             NUMERIC (5)    NULL,
    [ins_dt]                DATETIME       NULL,
    [last_upd_dt]           DATETIME       NULL,
    [ins_user_id]           NVARCHAR (40)  NULL,
    [last_upd_user_id]      NVARCHAR (40)  NULL,
    CONSTRAINT [sl_sys_parm_grp_pk] PRIMARY KEY CLUSTERED ([sl_sys_parm_grp] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines Integrator system parameter group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Integrator system parameter group name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm_grp', @level2type = N'COLUMN', @level2name = N'sl_sys_parm_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of Integrator system parameter group', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm_grp', @level2type = N'COLUMN', @level2name = N'sl_sys_parm_grp_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm_grp', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm_grp', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm_grp', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm_grp', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm_grp', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

