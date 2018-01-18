CREATE TABLE [dbo].[serv_action] (
    [serv_id]          NVARCHAR (20)   NOT NULL,
    [serv_action_typ]  NVARCHAR (10)   NOT NULL,
    [serv_action_cod]  NVARCHAR (10)   NOT NULL,
    [seqnum]           INT             NOT NULL,
    [ems_evt_nam]      NVARCHAR (30)   NULL,
    [rpt_id]           NVARCHAR (30)   NULL,
    [cmd]              NVARCHAR (2000) NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    CONSTRAINT [serv_action_pk] PRIMARY KEY CLUSTERED ([serv_id] ASC, [serv_action_typ] ASC, [serv_action_cod] ASC, [seqnum] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents Service Actions', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_action';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Workflow ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_action', @level2type = N'COLUMN', @level2name = N'serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Instruction Action Type - code/description master entry determining if this is a Pass action or Fail action: PASS;FAIL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_action', @level2type = N'COLUMN', @level2name = N'serv_action_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Action Code - code/description master entry specifying the action to take: EMSEVT - Generate EMS Event;PRNTRPT - Print Report;RUNCMD - Run Moca Command', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_action', @level2type = N'COLUMN', @level2name = N'serv_action_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_action', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EMS Event Name - if the serv_action_cod = EMSEVT, this is the EMS event to trigger.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_action', @level2type = N'COLUMN', @level2name = N'ems_evt_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Report ID - if the serv_action_cod = PRNTRPT, this is the report to print.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_action', @level2type = N'COLUMN', @level2name = N'rpt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Moca command - if the serv_action_cod = RUNCMD, this is the moca command to run.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_action', @level2type = N'COLUMN', @level2name = N'cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inserted Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_action', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_action', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inserted User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_action', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_action', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

