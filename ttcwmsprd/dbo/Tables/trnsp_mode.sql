CREATE TABLE [dbo].[trnsp_mode] (
    [trnsp_mode]       NVARCHAR (10) NOT NULL,
    [sml_pkg_flg]      INT           NULL,
    [dir_flg]          INT           NULL,
    [palletctl_flg]    INT           NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    [plbld_consol_by]  NVARCHAR (15) NULL,
    CONSTRAINT [trnsp_mode_pk] PRIMARY KEY CLUSTERED ([trnsp_mode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [trnmd_palctlflgck] CHECK ([palletctl_flg]=(0) OR [palletctl_flg]=(1)),
    CONSTRAINT [trnmod_dirflgck] CHECK ([dir_flg]=(0) OR [dir_flg]=(1)),
    CONSTRAINT [trnmod_smpkgflgck] CHECK ([sml_pkg_flg]=(0) OR [sml_pkg_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Transport Modes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trnsp_mode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PK, Required) Unique identifier and primary key. Mode of transport.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trnsp_mode', @level2type = N'COLUMN', @level2name = N'trnsp_mode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is this a parcel/small package mode?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trnsp_mode', @level2type = N'COLUMN', @level2name = N'sml_pkg_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is this a direct mode?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trnsp_mode', @level2type = N'COLUMN', @level2name = N'dir_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For this transport mode, send transaction to PalletCtl?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trnsp_mode', @level2type = N'COLUMN', @level2name = N'palletctl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Required) Generation Number (used for optimistic locking).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trnsp_mode', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of the create.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trnsp_mode', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of the last update.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trnsp_mode', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the user that created the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trnsp_mode', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID of the user that last modified the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trnsp_mode', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pallet build across shipments consolidation', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trnsp_mode', @level2type = N'COLUMN', @level2name = N'plbld_consol_by';

