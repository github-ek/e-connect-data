CREATE TABLE [dbo].[stop] (
    [stop_id]         NVARCHAR (10)   NOT NULL,
    [stop_nam]        NVARCHAR (10)   NULL,
    [stop_seq]        INT             NOT NULL,
    [car_move_id]     NVARCHAR (10)   NOT NULL,
    [adr_id]          NVARCHAR (20)   NOT NULL,
    [doc_num]         NVARCHAR (20)   NULL,
    [track_num]       NVARCHAR (20)   NULL,
    [stop_cmpl_flg]   INT             DEFAULT ((0)) NULL,
    [stop_seal]       NVARCHAR (30)   NULL,
    [pln_arr_dte]     DATETIME        NULL,
    [pln_dep_dte]     DATETIME        NULL,
    [exp_arr_dte]     DATETIME        NULL,
    [exp_dep_dte]     DATETIME        NULL,
    [act_arr_dte]     DATETIME        NULL,
    [act_dep_dte]     DATETIME        NULL,
    [orig_appt_dte]   DATETIME        NULL,
    [appt_dte]        DATETIME        NULL,
    [first_atmpt_dte] DATETIME        NULL,
    [last_atmpt_dte]  DATETIME        NULL,
    [tms_stop_seq]    INT             NULL,
    [drive_time]      INT             NULL,
    [wait_time]       INT             NULL,
    [act_time]        INT             NULL,
    [arr_dist]        NUMERIC (19, 4) NULL,
    [moddte]          DATETIME        NULL,
    [mod_usr_id]      NVARCHAR (40)   NULL,
    CONSTRAINT [stop_pk] PRIMARY KEY CLUSTERED ([stop_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [stop_stopcmplflgck] CHECK ([stop_cmpl_flg]=(0) OR [stop_cmpl_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [stop_idx1]
    ON [dbo].[stop]([car_move_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The stop table is used to represent drop-off points for the shipments.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique identifier for the stop record. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'stop_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User identifieable name to describe the stop.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'stop_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The order in which the stops will be made by the trailer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'stop_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier which ties stops together for a single trailer. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'car_move_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The address of the drop-off point', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The docnument number for any paperowrk (bill of lading) ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'doc_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The tracking number for any paperwork ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'track_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inidicates whether all picking against this stop is complete', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'stop_cmpl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The seal identifer that is applied once the stop is complete.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'stop_seal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Planned (Estimated) Arrival (TL) or Delivery (LTL) Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'pln_arr_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Planned (Estimated) Departure (TL) Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'pln_dep_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Expected (Latest Estimate) Arrival (TL) or Delivery (LTL) Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'exp_arr_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Expected (Latest Estimate) Departure (TL)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'exp_dep_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Actual Arrival (TL) or Delivery (LTL) at stop', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'act_arr_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Actual Departure (TL) or Pickup (LTL) from the stop', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'act_dep_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Original Appointment Date (Last appointment, if different from appt_dte)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'orig_appt_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Appointment Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'appt_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related)Date when first attempt to deliver was made', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'first_atmpt_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Date when last attempt to deliver was made', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'last_atmpt_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Stop sequence number of the stop in the carrier move. This is the TM stop number which indicates the order in stops are visited by a carrier move.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'tms_stop_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Driving time from previous stop in minutes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'drive_time';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Waiting time at the stop in minutes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'wait_time';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Activity time at the stop in minutes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'act_time';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The distance calculated from the stop and the previous stop of a move. If there is no previous stop the distance is 0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'stop', @level2type = N'COLUMN', @level2name = N'arr_dist';

