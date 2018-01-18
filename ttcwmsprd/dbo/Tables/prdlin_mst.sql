CREATE TABLE [dbo].[prdlin_mst] (
    [prdlin]           NVARCHAR (20) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [excl_flg]         INT           DEFAULT ((1)) NOT NULL,
    [prcare]           NVARCHAR (10) NOT NULL,
    [plan_typ]         NVARCHAR (20) NOT NULL,
    [stgloc]           NVARCHAR (20) NULL,
    [num_people]       INT           NULL,
    [speed]            INT           NULL,
    [actcod]           NVARCHAR (40) NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [prdlin_mst_pk] PRIMARY KEY CLUSTERED ([prdlin] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [excl_flgck] CHECK ([excl_flg]=(0) OR [excl_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Production Line Table', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prdlin_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Production Line', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prdlin_mst', @level2type = N'COLUMN', @level2name = N'prdlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prdlin_mst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exclusively Occupied by Single Started Work Order Flag.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prdlin_mst', @level2type = N'COLUMN', @level2name = N'excl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Processing Area - The area this production line is assigned to, it should be a WIP area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prdlin_mst', @level2type = N'COLUMN', @level2name = N'prcare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Plan Type - The type of plan user can make for the production line. It can be Schedule, Sequence or Priority.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prdlin_mst', @level2type = N'COLUMN', @level2name = N'plan_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Staging Location assigned to the production line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prdlin_mst', @level2type = N'COLUMN', @level2name = N'stgloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of people working on work order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prdlin_mst', @level2type = N'COLUMN', @level2name = N'num_people';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Production Speed. This value is the amount of finished good that can be produced per hour.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prdlin_mst', @level2type = N'COLUMN', @level2name = N'speed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Activity Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prdlin_mst', @level2type = N'COLUMN', @level2name = N'actcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prdlin_mst', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prdlin_mst', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prdlin_mst', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prdlin_mst', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

