CREATE TABLE [dbo].[ship_move] (
    [ship_move_id]     NVARCHAR (12) NOT NULL,
    [ship_id]          NVARCHAR (30) NULL,
    [seqnum]           INT           NOT NULL,
    [orig_stop_id]     NVARCHAR (10) NULL,
    [dest_stop_id]     NVARCHAR (10) NULL,
    [car_move_id]      NVARCHAR (10) NOT NULL,
    [ship_plan_id]     NVARCHAR (12) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_dt]      DATETIME      NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [ship_move_pk] PRIMARY KEY CLUSTERED ([ship_move_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [shpmv_car_move_id]
    ON [dbo].[ship_move]([car_move_id] ASC, [ship_id] ASC, [seqnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [shpmv_ship_id]
    ON [dbo].[ship_move]([ship_id] ASC, [seqnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [shpmv_plan_id_seq]
    ON [dbo].[ship_move]([ship_plan_id] ASC, [ship_id] ASC, [seqnum] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the Shipment Move ID for the ship move.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_move', @level2type = N'COLUMN', @level2name = N'ship_move_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the Shipment ID that this ship move is for.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_move', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the sequence number for the shipment on this ship move.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_move', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stop ID of the origin stop of the ship move.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_move', @level2type = N'COLUMN', @level2name = N'orig_stop_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stop ID of the destination stop of the ship move.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_move', @level2type = N'COLUMN', @level2name = N'dest_stop_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier move ID for the shipment move.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_move', @level2type = N'COLUMN', @level2name = N'car_move_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trailer/container execution plan that the shipment move is part of.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_move', @level2type = N'COLUMN', @level2name = N'ship_plan_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_move', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_move', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_move', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_move', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ship_move', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

