CREATE TABLE [dbo].[wh_serv_exitpnt_arecod] (
    [serv_id]     NVARCHAR (20) NOT NULL,
    [wh_id]       NVARCHAR (32) NOT NULL,
    [exitpnt_typ] NVARCHAR (30) NOT NULL,
    [exitpnt]     NVARCHAR (15) NOT NULL,
    [srcare]      NVARCHAR (10) NOT NULL,
    [dstare]      NVARCHAR (10) NOT NULL,
    [moddte]      DATETIME      NULL,
    [mod_usr_id]  NVARCHAR (40) NULL,
    CONSTRAINT [whsrv_xtpntarecdpk] PRIMARY KEY CLUSTERED ([serv_id] ASC, [wh_id] ASC, [exitpnt_typ] ASC, [exitpnt] ASC, [srcare] ASC, [dstare] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is considered a child table of the wh_serv_exitpnt table. It allows the user to associate one or more area codes with a service and an exit point. This will allow the user to specify when & where a srv will be required', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv_exitpnt_arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv_exitpnt_arecod', @level2type = N'COLUMN', @level2name = N'serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'WareHouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv_exitpnt_arecod', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exit Point Type - determines the general process during which the exit point should be evaluated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv_exitpnt_arecod', @level2type = N'COLUMN', @level2name = N'exitpnt_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exit Point - determines the exact point in the warehouse process when this exit point should be evaluated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv_exitpnt_arecod', @level2type = N'COLUMN', @level2name = N'exitpnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source Area Code - defaults to ''XXXX''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv_exitpnt_arecod', @level2type = N'COLUMN', @level2name = N'srcare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Area Code - defaults to ''XXXX''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wh_serv_exitpnt_arecod', @level2type = N'COLUMN', @level2name = N'dstare';

