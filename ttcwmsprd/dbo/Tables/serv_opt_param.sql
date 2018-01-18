CREATE TABLE [dbo].[serv_opt_param] (
    [parm_nam]        NVARCHAR (100) NOT NULL,
    [opt_id]          NVARCHAR (40)  NOT NULL,
    [ordnum]          NVARCHAR (35)  NOT NULL,
    [ordlin]          NVARCHAR (10)  NOT NULL,
    [ordsln]          NVARCHAR (10)  NOT NULL,
    [wh_id]           NVARCHAR (32)  NOT NULL,
    [client_id]       NVARCHAR (32)  NOT NULL,
    [parm_val]        NVARCHAR (250) NULL,
    [ins_dt]          DATETIME       NULL,
    [last_upd_dt]     DATETIME       NULL,
    [ins_usr_id]      NVARCHAR (40)  NULL,
    [last_upd_usr_id] NVARCHAR (40)  NULL,
    CONSTRAINT [serv_opt_param_pk] PRIMARY KEY CLUSTERED ([parm_nam] ASC, [opt_id] ASC, [ordnum] ASC, [ordlin] ASC, [ordsln] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Service Parameter Name.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_opt_param', @level2type = N'COLUMN', @level2name = N'parm_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Service ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_opt_param', @level2type = N'COLUMN', @level2name = N'opt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_opt_param', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_opt_param', @level2type = N'COLUMN', @level2name = N'ordlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order Sub Line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_opt_param', @level2type = N'COLUMN', @level2name = N'ordsln';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_opt_param', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_opt_param', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value entered by the user for the parameter.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_opt_param', @level2type = N'COLUMN', @level2name = N'parm_val';

