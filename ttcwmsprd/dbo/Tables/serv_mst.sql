CREATE TABLE [dbo].[serv_mst] (
    [serv_id]        NVARCHAR (20) NOT NULL,
    [serv_typ]       NVARCHAR (10) NOT NULL,
    [actcod]         NVARCHAR (40) NULL,
    [retry_fail_flg] INT           DEFAULT ((0)) NOT NULL,
    [auto_cnfrm_flg] INT           DEFAULT ((0)) NOT NULL,
    [yestoall_flg]   INT           DEFAULT ((0)) NOT NULL,
    [moddte]         DATETIME      NULL,
    [mod_usr_id]     NVARCHAR (40) NULL,
    CONSTRAINT [serv_mst_pk] PRIMARY KEY CLUSTERED ([serv_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [serv_mst_ytaflg_ck] CHECK ([yestoall_flg]=(0) OR [yestoall_flg]=(1)),
    CONSTRAINT [srvmst_atcnfrmflg] CHECK ([auto_cnfrm_flg]=(0) OR [auto_cnfrm_flg]=(1)),
    CONSTRAINT [srvmst_rtyfalflgck] CHECK ([retry_fail_flg]=(0) OR [retry_fail_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents Service Master', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_mst', @level2type = N'COLUMN', @level2name = N'serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Type, which has four possible types: Inbound Service, Outbound Service, Non-Inventory Service and Background Service.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_mst', @level2type = N'COLUMN', @level2name = N'serv_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Activity Code to be applied to this service when sending this service activity to LM', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_mst', @level2type = N'COLUMN', @level2name = N'actcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'When this flag is set, if the workflow receives a failed result when it is executed, the workflow is immediately rescheduled for execution again the next time the exit point is triggered.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_mst', @level2type = N'COLUMN', @level2name = N'retry_fail_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Auto Confirmation Flag - Determines whether or not to skip service confirmation', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_mst', @level2type = N'COLUMN', @level2name = N'auto_cnfrm_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Yes To All Flag - Determines whether or not ''Yes To All'' check box is visible and enabled on Workflow Instruction Operation', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_mst', @level2type = N'COLUMN', @level2name = N'yestoall_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_mst', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_mst', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

