CREATE TABLE [dbo].[item_velocity] (
    [velocity_id]   NVARCHAR (20)   NOT NULL,
    [item_num]      NVARCHAR (50)   NOT NULL,
    [client_id]     NVARCHAR (32)   NOT NULL,
    [wh_id]         NVARCHAR (32)   NOT NULL,
    [plan_date]     DATETIME        NOT NULL,
    [velocity_type] NVARCHAR (40)   NOT NULL,
    [quantity]      NUMERIC (15, 3) NULL,
    [uomcod]        NVARCHAR (2)    NULL,
    [ordnum]        NVARCHAR (35)   NULL,
    [ordtyp]        NVARCHAR (4)    NULL,
    [invsts]        NVARCHAR (4)    NULL,
    [op_type]       NVARCHAR (1)    NULL,
    CONSTRAINT [item_velocity_pk] PRIMARY KEY CLUSTERED ([velocity_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [itmvel_idx1]
    ON [dbo].[item_velocity]([item_num] ASC, [client_id] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [itmvel_idx2]
    ON [dbo].[item_velocity]([plan_date] ASC, [velocity_type] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains all Item Velocity data for the Slotting Simulation feature', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'item_velocity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Velocity ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'item_velocity', @level2type = N'COLUMN', @level2name = N'velocity_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'item_velocity', @level2type = N'COLUMN', @level2name = N'item_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'item_velocity', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'item_velocity', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Plan Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'item_velocity', @level2type = N'COLUMN', @level2name = N'plan_date';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Velocity Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'item_velocity', @level2type = N'COLUMN', @level2name = N'velocity_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'item_velocity', @level2type = N'COLUMN', @level2name = N'quantity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit of Measure', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'item_velocity', @level2type = N'COLUMN', @level2name = N'uomcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'item_velocity', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'item_velocity', @level2type = N'COLUMN', @level2name = N'ordtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Status', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'item_velocity', @level2type = N'COLUMN', @level2name = N'invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Operation Type. C = Create or Change Record. D = Delete Record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'item_velocity', @level2type = N'COLUMN', @level2name = N'op_type';

