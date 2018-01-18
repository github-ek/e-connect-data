CREATE TABLE [dbo].[devmst] (
    [devcod]             NVARCHAR (20) NOT NULL,
    [wh_id]              NVARCHAR (32) NOT NULL,
    [devcls]             NVARCHAR (1)  NOT NULL,
    [devnam]             NVARCHAR (20) NOT NULL,
    [voc_term_id]        NVARCHAR (40) NULL,
    [prtadr]             NVARCHAR (10) NULL,
    [lst_usr_id]         NVARCHAR (40) NULL,
    [lbl_prtadr]         NVARCHAR (10) NULL,
    [rfid_prtadr]        NVARCHAR (10) NULL,
    [locale_id]          NVARCHAR (20) NULL,
    [wko_prcloc]         NVARCHAR (20) NULL,
    [touchscreen_flg]    INT           DEFAULT ((0)) NOT NULL,
    [pko_prcare]         NVARCHAR (10) NULL,
    [spl_hand_loc]       NVARCHAR (20) NULL,
    [pko_autoctnnum_flg] INT           DEFAULT ((0)) NOT NULL,
    [moddte]             DATETIME      NULL,
    [mod_usr_id]         NVARCHAR (40) NULL,
    [u_version]          INT           NULL,
    [scale_ser_dev_id]   NVARCHAR (50) NULL,
    [scanner_ser_dev_id] NVARCHAR (50) NULL,
    [ins_dt]             DATETIME      NULL,
    [last_upd_dt]        DATETIME      NULL,
    [ins_user_id]        NVARCHAR (40) NULL,
    [last_upd_user_id]   NVARCHAR (40) NULL,
    CONSTRAINT [devmst_pk] PRIMARY KEY CLUSTERED ([devcod] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [devmst_ctnnmflg_ck] CHECK ([pko_autoctnnum_flg]=(0) OR [pko_autoctnnum_flg]=(1)),
    CONSTRAINT [devmst_touchflg_ck] CHECK ([touchscreen_flg]=(0) OR [touchscreen_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The device master table is the table that defines devices within the system and the attributes of the devices', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Device Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'devcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Device Class', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'devcls';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Device Name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'devnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Voice Terminal ID, this is one identifier for the voice device which the system first looks at to find a voice device code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'voc_term_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Printer Address', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'prtadr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last user to use the device', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'lst_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Label Printer Address', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'lbl_prtadr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'RFID Label Printer Address', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'rfid_prtadr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the locale of the device, dictates the language spoken on voice devices', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'locale_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Production Station - The station current workstation is associated with.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'wko_prcloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag to indicate if this device supports touchscreen operation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'touchscreen_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The area code within which this device is to perform packout.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'pko_prcare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The location used to send containers marked for special handling for this device.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'spl_hand_loc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag to determine whether automatic carton numbering will be used during the Packout process.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'pko_autoctnnum_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last user to modify the device', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial Device Configuration ID for Scale', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'scale_ser_dev_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial Device Configuration ID for Bar Code Scanner', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'scanner_ser_dev_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'devmst', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

