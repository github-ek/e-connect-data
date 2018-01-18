CREATE TABLE [dbo].[sl_sys_parm] (
    [sl_sys_parm_id]    NVARCHAR (30)  NOT NULL,
    [sl_sys_parm_grp]   NVARCHAR (30)  NULL,
    [sl_sys_parm_descr] NVARCHAR (250) NULL,
    [data_typ_cd]       NVARCHAR (5)   NOT NULL,
    [sl_sys_parm_val]   NVARCHAR (MAX) NULL,
    [u_version]         NUMERIC (5)    NULL,
    [ins_dt]            DATETIME       NULL,
    [last_upd_dt]       DATETIME       NULL,
    [ins_user_id]       NVARCHAR (40)  NULL,
    [last_upd_user_id]  NVARCHAR (40)  NULL,
    CONSTRAINT [sl_sys_parm_pk] PRIMARY KEY CLUSTERED ([sl_sys_parm_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_sys_parm_fk_grp] FOREIGN KEY ([sl_sys_parm_grp]) REFERENCES [dbo].[sl_sys_parm_grp] ([sl_sys_parm_grp])
);


GO
CREATE NONCLUSTERED INDEX [sl_sys_parm_fk_grp]
    ON [dbo].[sl_sys_parm]([sl_sys_parm_grp] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines Integrator system parameter.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Integrator system parameter', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm', @level2type = N'COLUMN', @level2name = N'sl_sys_parm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The Integrator system parameter group name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm', @level2type = N'COLUMN', @level2name = N'sl_sys_parm_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of Integrator system parameter', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm', @level2type = N'COLUMN', @level2name = N'sl_sys_parm_descr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The data type code: C = Character String, D = Date/Time, N = Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm', @level2type = N'COLUMN', @level2name = N'data_typ_cd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Integrator system parameter value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm', @level2type = N'COLUMN', @level2name = N'sl_sys_parm_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_sys_parm', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

