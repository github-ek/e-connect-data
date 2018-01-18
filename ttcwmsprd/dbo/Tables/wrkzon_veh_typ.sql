CREATE TABLE [dbo].[wrkzon_veh_typ] (
    [wh_id]            NVARCHAR (32) NOT NULL,
    [wrkzon]           NVARCHAR (10) NOT NULL,
    [vehtyp]           NVARCHAR (10) NOT NULL,
    [maxdev]           INT           NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [wrkzon_veh_typ_pk] PRIMARY KEY CLUSTERED ([wh_id] ASC, [wrkzon] ASC, [vehtyp] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores the configuration of the device limit by vehicle type for a work zone', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkzon_veh_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkzon_veh_typ', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work zone', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkzon_veh_typ', @level2type = N'COLUMN', @level2name = N'wrkzon';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Vehicle type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkzon_veh_typ', @level2type = N'COLUMN', @level2name = N'vehtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum devices that can access work zone', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkzon_veh_typ', @level2type = N'COLUMN', @level2name = N'maxdev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkzon_veh_typ', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkzon_veh_typ', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkzon_veh_typ', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkzon_veh_typ', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkzon_veh_typ', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

