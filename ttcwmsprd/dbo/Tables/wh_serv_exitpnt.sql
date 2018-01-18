CREATE TABLE [dbo].[wh_serv_exitpnt] (
    [serv_id]     NVARCHAR (20) NOT NULL,
    [wh_id]       NVARCHAR (32) NOT NULL,
    [exitpnt_typ] NVARCHAR (30) NOT NULL,
    [exitpnt]     NVARCHAR (15) NOT NULL,
    [moddte]      DATETIME      NULL,
    [mod_usr_id]  NVARCHAR (40) NULL,
    CONSTRAINT [wh_serv_exitpnt_pk] PRIMARY KEY CLUSTERED ([serv_id] ASC, [wh_id] ASC, [exitpnt_typ] ASC, [exitpnt] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The warehouse service exit point table is the table that defines the exits point of the service in the warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv_exitpnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv_exitpnt', @level2type = N'COLUMN', @level2name = N'serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'WareHouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv_exitpnt', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exit Point Type - determines the general process during which the exit point should be evaluated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv_exitpnt', @level2type = N'COLUMN', @level2name = N'exitpnt_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exit Point - determines when this service will be required during the service process.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv_exitpnt', @level2type = N'COLUMN', @level2name = N'exitpnt';

