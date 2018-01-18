CREATE TABLE [dbo].[appt] (
    [appt_id]          NVARCHAR (10) NOT NULL,
    [stoloc]           NVARCHAR (20) NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [appt_typ]         NVARCHAR (4)  NOT NULL,
    [trlr_cod]         NVARCHAR (4)  NOT NULL,
    [turn_flg]         INT           NULL,
    [carcod]           NVARCHAR (10) NULL,
    [trlr_num]         NVARCHAR (20) NULL,
    [start_dte]        DATETIME      NOT NULL,
    [end_dte]          DATETIME      NOT NULL,
    [car_move_id]      NVARCHAR (10) NULL,
    [adv_alc_flg]      INT           NULL,
    [adv_alc_hrs]      INT           NULL,
    [auto_generated]   INT           NULL,
    [rec_appt_id]      NVARCHAR (10) NULL,
    [slot_id]          NVARCHAR (20) NULL,
    [ext_appt_id]      NVARCHAR (10) NULL,
    [moddte]           DATETIME      NULL,
    [mod_usr_id]       NVARCHAR (40) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [appt_pk] PRIMARY KEY CLUSTERED ([appt_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [appt_advalcflgck] CHECK ([adv_alc_flg]=(0) OR [adv_alc_flg]=(1)),
    CONSTRAINT [appt_auto_genrt_ck] CHECK ([auto_generated]=(0) OR [auto_generated]=(1)),
    CONSTRAINT [appt_turn_flg_ck] CHECK ([turn_flg]=(0) OR [turn_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [appt_trlr_num]
    ON [dbo].[appt]([trlr_num] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The appt table is the table that defines the appointment time with a dock door and a trailer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Appointment ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'appt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Dock Door', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Appointment Type.  Valid appointment types are  S - Standard and E - Exception.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'appt_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipping/Receiving Trailer', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'trlr_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Turn around flag. If the trailer is a receiving trailer, will it be turned around for shipping?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'turn_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trailer Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'trlr_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Appointment Start Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'start_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Appointment End Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'end_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Move Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'car_move_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Advanced Allocation Flag. Does this carrier support allocation of associated shipments in advance of the trailer''s arrival.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'adv_alc_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Advanced Allocation Hours. The number of hours shipments will be allocated in advance of the trailer''s arrival.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'adv_alc_hrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag to determine if an appointment was automatically generated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'auto_generated';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Recurring Appointment ID.Value will be NULL for non recurring appointments.If it is recurring, 1st instance''s appointment id will become recurring appointment id for all the other instances.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'rec_appt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Slot ID represents a grouping of dock doors in a dock. A dock can contain multiple slots and a slot can contain multiple doors. This is used to support appointments being added by the TM system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'slot_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Appointment Id which is created by the TM system', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'ext_appt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modification Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Modified User', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'appt', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

