CREATE TABLE [dbo].[car_move] (
    [car_move_id]              NVARCHAR (10)   NOT NULL,
    [host_client_id]           NVARCHAR (32)   NULL,
    [host_ext_id]              NVARCHAR (40)   NULL,
    [carcod]                   NVARCHAR (10)   NULL,
    [trlr_id]                  NVARCHAR (20)   NULL,
    [attn_cod]                 NVARCHAR (40)   NULL,
    [tndr_sts]                 NVARCHAR (40)   NULL,
    [tms_sts]                  NVARCHAR (40)   NULL,
    [wh_sts]                   NVARCHAR (40)   NULL,
    [move_plan_id]             NVARCHAR (16)   NULL,
    [doc_num]                  NVARCHAR (20)   NULL,
    [track_num]                NVARCHAR (20)   NULL,
    [arcdte]                   DATETIME        NULL,
    [arc_src]                  NVARCHAR (30)   NULL,
    [tms_load_id]              NVARCHAR (10)   NULL,
    [trans_mode]               NVARCHAR (32)   NULL,
    [rate_serv_nam]            NVARCHAR (40)   NULL,
    [book_sts]                 NVARCHAR (40)   NULL,
    [book_id]                  NVARCHAR (12)   NULL,
    [targettempid]             NVARCHAR (32)   NULL,
    [moddte]                   DATETIME        NULL,
    [mod_usr_id]               NVARCHAR (40)   NULL,
    [wh_id]                    NVARCHAR (32)   NULL,
    [rte_tmpl_flg]             INT             DEFAULT ((0)) NULL,
    [route_id]                 NVARCHAR (10)   NULL,
    [srvlvl]                   NVARCHAR (10)   NULL,
    [vndr_ntfctn_sts]          NVARCHAR (40)   NULL,
    [adv_alc_flg]              INT             DEFAULT ((0)) NULL,
    [adv_alc_hrs]              INT             NULL,
    [begdaycod]                NVARCHAR (1)    NULL,
    [begtim]                   DATETIME        NULL,
    [enddaycod]                NVARCHAR (1)    NULL,
    [endtim]                   DATETIME        NULL,
    [car_move_src_sys]         NVARCHAR (40)   NULL,
    [direct_dist]              NUMERIC (19, 4) NULL,
    [route_dist]               NUMERIC (19, 4) NULL,
    [max_usr]                  INT             NULL,
    [lock_usr_flg]             INT             DEFAULT ((0)) NOT NULL,
    [pltctl_replan_inproc_flg] INT             DEFAULT ((0)) NOT NULL,
    [ctry_track_num]           NVARCHAR (20)   NULL,
    CONSTRAINT [car_move_pk] PRIMARY KEY CLUSTERED ([car_move_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [adv_alc_flg_ck] CHECK ([adv_alc_flg]=(0) OR [adv_alc_flg]=(1)),
    CONSTRAINT [car_move_replan_ck] CHECK ([pltctl_replan_inproc_flg]=(0) OR [pltctl_replan_inproc_flg]=(1)),
    CONSTRAINT [cm_lck_usr_flg_ck] CHECK ([lock_usr_flg]=(0) OR [lock_usr_flg]=(1)),
    CONSTRAINT [cm_rte_tmpl_flg_ck] CHECK ([rte_tmpl_flg]=(0) OR [rte_tmpl_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [car_move_idx1]
    ON [dbo].[car_move]([trlr_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [car_move_idx2]
    ON [dbo].[car_move]([host_ext_id] ASC, [host_client_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The carrier move table defines the carrier moves.  A carrier move associates shipments together into a trailer', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Move Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'car_move_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Host Client Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'host_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Host External Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'host_ext_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trailer Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'trlr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Code indicating level of attention required due to a condition of the move.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'attn_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Tender Status of the carrier move', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'tndr_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N' (TMS Related) Used by TM to track the planning related status of a carrier move. This would be used to track carrier moves that are still in the boiler or staged, but not warehouse ready, etc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'tms_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) Used to indicate if a carrier move is valid for DCS to start looking at.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'wh_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related) The move plan that this carrier move belongs to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'move_plan_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Document Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'doc_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tracking Number - Carrier tracking number for the carrier movement', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'track_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Archive Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'arcdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Archive Source', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'arc_src';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TMS Load Id - Load Id from the TMS system', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'tms_load_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Transportation Mode - Truck, Rail, Intermodal', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'trans_mode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TMS Related)  Identifying name of the rating service', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'rate_serv_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Booking status of the Carrier Move', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'book_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Booking assigned to Carrier Move', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'book_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Target Temperature Configuration ID assigned to freight', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'targettempid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Identifier - The warehouse from which this distribution is to be allocated/processed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Route Flag - specifies that this carrier move defines a static route. This carrier move is then used as a template for creating standard carrier moves', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'rte_tmpl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Route ID - when a carrier move is created from a static route, we use this value to track the route that the carrier move was created from', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'route_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Level - when shipments are automatically generated for this carrier move, this is the service level it will use', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'srvlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This column will track the status of vendor notification', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'vndr_ntfctn_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Advanced Allocation Flag. Does this route support planning and allocation of associated orders in advance of route scheduled arrival', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'adv_alc_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Advanced Allocation Hours. The number of hours that orders will be planned and allocated in advance of the route scheduled arrival', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'adv_alc_hrs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship Begin Day of Week Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'begdaycod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship Begin Time', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'begtim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship End Day of Week Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'enddaycod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship End Time', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'endtim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifies the TM sub-system that created the carrier move. TM use only', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'car_move_src_sys';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The straight-line distance from first stop to the last stop of the carrier move', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'direct_dist';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The travel (sum-of-legs) distance from first stop to the last stop of the carrier move', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'route_dist';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This indicates the maximum number of users that can be assigned to a carrier move. If max_usr is null or 0, any number of users can be assigned to the carrier move.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'max_usr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is set, user will be locked to the carrier move and system will not allow him to take up work of other carrier moves.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'lock_usr_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if there is currently a re-plan in process against this carrier move.  This is only used for PALLETCTL and is defaulted to 0.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'pltctl_replan_inproc_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'PARS Number - PARS Number required for country specific carrier types which are defined in the Configuration for Shipping.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_move', @level2type = N'COLUMN', @level2name = N'ctry_track_num';

