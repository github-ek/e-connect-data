CREATE TABLE [dbo].[vehopr] (
    [vehtyp] NVARCHAR (10) NOT NULL,
    [oprcod] NVARCHAR (9)  NOT NULL,
    [wh_id]  NVARCHAR (32) NOT NULL,
    CONSTRAINT [vehopr_pk] PRIMARY KEY CLUSTERED ([vehtyp] ASC, [oprcod] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'vehicle operation table is used to manage vehicle operation access in a warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vehopr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Vehicle Type - The unique identifier for the vehicle.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vehopr', @level2type = N'COLUMN', @level2name = N'vehtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Operation Code - The operation code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vehopr', @level2type = N'COLUMN', @level2name = N'oprcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - The unique identifier for the warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'vehopr', @level2type = N'COLUMN', @level2name = N'wh_id';

