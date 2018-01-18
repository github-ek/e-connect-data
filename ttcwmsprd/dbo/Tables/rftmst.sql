CREATE TABLE [dbo].[rftmst] (
    [devcod]     NVARCHAR (20) NOT NULL,
    [wh_id]      NVARCHAR (32) NOT NULL,
    [curwrkare]  NVARCHAR (8)  NULL,
    [curwrkzon]  NVARCHAR (10) NULL,
    [curstoloc]  NVARCHAR (20) NULL,
    [hmewrkare]  NVARCHAR (8)  NULL,
    [vehtyp]     NVARCHAR (10) NULL,
    [rftmod]     NVARCHAR (1)  NULL,
    [actdte]     DATETIME      NULL,
    [moddte]     DATETIME      NULL,
    [mod_usr_id] NVARCHAR (40) NULL,
    CONSTRAINT [rftmst_pk] PRIMARY KEY CLUSTERED ([devcod] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The rf master table is used to represent real-time information about an rf terminal.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rftmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Device code of the rf terminal.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rftmst', @level2type = N'COLUMN', @level2name = N'devcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the warehouse where the device originated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rftmst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the current work area of the device.  This initially gets set at the Login Work Info screen when starting a dcsrdt connection.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rftmst', @level2type = N'COLUMN', @level2name = N'curwrkare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the current work zone of the device.  This initially gets set at the Login Work Info screen when starting a dcsrdt connection.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rftmst', @level2type = N'COLUMN', @level2name = N'curwrkzon';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the current location of the rf terminal. It gets set when the user picks up something from a location or deposits to it.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rftmst', @level2type = N'COLUMN', @level2name = N'curstoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The home work area gets set when creating an rf device. Used when processing directed work to figure out preferred wrkare, i.e., if a home wrkare is defined and it is different from the cur wrkare then it becomes the preferred wrkare.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rftmst', @level2type = N'COLUMN', @level2name = N'hmewrkare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates what type of vehicle can get into the location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rftmst', @level2type = N'COLUMN', @level2name = N'vehtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether the rf terminal is performing directed or undirected work.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rftmst', @level2type = N'COLUMN', @level2name = N'rftmod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the last login activity date on the rf terminal.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rftmst', @level2type = N'COLUMN', @level2name = N'actdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modification Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rftmst', @level2type = N'COLUMN', @level2name = N'moddte';

