CREATE TABLE [dbo].[sl_i_ifd_action_id] (
    [sys_id]           NVARCHAR (30)  NOT NULL,
    [ifd_id]           NVARCHAR (30)  NOT NULL,
    [ifd_ver]          NVARCHAR (15)  NOT NULL,
    [ifd_action]       NVARCHAR (5)   NOT NULL,
    [fld_ifd_id]       NVARCHAR (30)  NULL,
    [fld_ifd_ver]      NVARCHAR (15)  NULL,
    [fld_ifd_seg_id]   NVARCHAR (30)  NULL,
    [fld_ifd_fld_id]   NVARCHAR (30)  NULL,
    [fld_val]          NVARCHAR (MAX) NULL,
    [alg_id]           NVARCHAR (30)  NULL,
    [ord_ind]          NUMERIC (5)    NOT NULL,
    [u_version]        NUMERIC (5)    NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    CONSTRAINT [sl_iifdactidpk] PRIMARY KEY CLUSTERED ([sys_id] ASC, [ifd_id] ASC, [ifd_ver] ASC, [ifd_action] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [sl_fdactidfkifdfld] FOREIGN KEY ([fld_ifd_id], [fld_ifd_ver], [fld_ifd_seg_id], [fld_ifd_fld_id]) REFERENCES [dbo].[sl_ifd_fld] ([ifd_id], [ifd_ver], [ifd_seg_id], [ifd_fld_id]),
    CONSTRAINT [sl_iifdactidfkalg] FOREIGN KEY ([alg_id]) REFERENCES [dbo].[sl_alg_def] ([alg_id]),
    CONSTRAINT [sl_iifdactidfksid] FOREIGN KEY ([sys_id], [ifd_id], [ifd_ver]) REFERENCES [dbo].[sl_i_sys_ifd_id] ([sys_id], [ifd_id], [ifd_ver]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [sl_fdactidfkifdfld]
    ON [dbo].[sl_i_ifd_action_id]([fld_ifd_id] ASC, [fld_ifd_ver] ASC, [fld_ifd_seg_id] ASC, [fld_ifd_fld_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [sl_iifdactidfkalg]
    ON [dbo].[sl_i_ifd_action_id]([alg_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines inbound IFD action.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_action_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The system name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_action_id', @level2type = N'COLUMN', @level2name = N'sys_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The inbound IFD name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_action_id', @level2type = N'COLUMN', @level2name = N'ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The inbound IFD version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_action_id', @level2type = N'COLUMN', @level2name = N'ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD action', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_action_id', @level2type = N'COLUMN', @level2name = N'ifd_action';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD name of the field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_action_id', @level2type = N'COLUMN', @level2name = N'fld_ifd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD version of the field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_action_id', @level2type = N'COLUMN', @level2name = N'fld_ifd_ver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD segment name of the field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_action_id', @level2type = N'COLUMN', @level2name = N'fld_ifd_seg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The IFD field name of the field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_action_id', @level2type = N'COLUMN', @level2name = N'fld_ifd_fld_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The field value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_action_id', @level2type = N'COLUMN', @level2name = N'fld_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(FK) The algorithm name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_action_id', @level2type = N'COLUMN', @level2name = N'alg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The order indicator', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_action_id', @level2type = N'COLUMN', @level2name = N'ord_ind';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_action_id', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insert date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_action_id', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last update date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_action_id', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who created this record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_action_id', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User who performed the last update to the entry', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sl_i_ifd_action_id', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

