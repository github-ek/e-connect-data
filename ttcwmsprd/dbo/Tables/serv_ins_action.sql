CREATE TABLE [dbo].[serv_ins_action] (
    [serv_ins_id]        NVARCHAR (20)   NOT NULL,
    [serv_action_typ]    NVARCHAR (10)   NOT NULL,
    [serv_action_cod]    NVARCHAR (10)   NOT NULL,
    [seqnum]             INT             NOT NULL,
    [rf_frm_id]          NVARCHAR (60)   NULL,
    [gui_frm_id]         NVARCHAR (60)   NULL,
    [cnfrm_val_var_nam]  NVARCHAR (40)   NULL,
    [post_cnfrm_val_cmd] NVARCHAR (2000) NULL,
    [invsts]             NVARCHAR (4)    NULL,
    [ems_evt_nam]        NVARCHAR (30)   NULL,
    [rpt_id]             NVARCHAR (30)   NULL,
    [cmd]                NVARCHAR (2000) NULL,
    [hldnum]             NVARCHAR (10)   NULL,
    [hldcod]             NVARCHAR (10)   NULL,
    [hldpfx]             NVARCHAR (32)   NULL,
    [reacod]             NVARCHAR (20)   NULL,
    [moddte]             DATETIME        NULL,
    [mod_usr_id]         NVARCHAR (40)   NULL,
    CONSTRAINT [serv_ins_action_pk] PRIMARY KEY CLUSTERED ([serv_ins_id] ASC, [serv_action_typ] ASC, [serv_action_cod] ASC, [seqnum] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents Service Instructions Actions', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Instruction ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action', @level2type = N'COLUMN', @level2name = N'serv_ins_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Instruction Action Type - code/description master entry determining if this is a Pass action or Fail action: PASS;FAIL', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action', @level2type = N'COLUMN', @level2name = N'serv_action_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Action Code - code/description master entry specifying the action to take: STSCHG - Status Change;EXCFORM - Execute Form;EMSEVT - Generate EMS Event;PRNTRPT - Print Report;RUNCMD - Run Moca Command;CREHOLD - Create Hold', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action', @level2type = N'COLUMN', @level2name = N'serv_action_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'RF Form ID - if the serv_action_cod = EXCFORM, this is the RF form to display next to the user as a result of the service action.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action', @level2type = N'COLUMN', @level2name = N'rf_frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'GUI Form ID - If the serv_action_cod = EXCFORM, this is the GUI form to display next to the user as a result of the service action.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action', @level2type = N'COLUMN', @level2name = N'gui_frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirmation Value Variable Name - if rf_frm_id is set to the std cnfrm val form, or the gui_frm_id is set to the std cnfrm val form, this is the var_nam of the input fld thru which the user will input a value into that form.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action', @level2type = N'COLUMN', @level2name = N'cnfrm_val_var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Post Processing Command - this command will run as a trigger off of the create/change/remove confirmation service value commands.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action', @level2type = N'COLUMN', @level2name = N'post_cnfrm_val_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Status -  if the serv_action_cod = STSCHG, this is the inventory status to aplly to the inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action', @level2type = N'COLUMN', @level2name = N'invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EMS Event Name - if the serv_action_cod = EMSEVT, this is the EMS event to trigger.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action', @level2type = N'COLUMN', @level2name = N'ems_evt_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Report ID - if the serv_action_cod = PRNTRPT, this is the report to print.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action', @level2type = N'COLUMN', @level2name = N'rpt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Moca command - if the serv_action_cod = RUNCMD, this is the moca command to run.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action', @level2type = N'COLUMN', @level2name = N'cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Number - if the serv_action_cod = CREHOLD, this is the number to apply to the inventory hold record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action', @level2type = N'COLUMN', @level2name = N'hldnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Code - if the serv_action_cod = CREHOLD, this is the hold action to be taken. Options include creating a hold for: LOADONLY - Current Load Only; RCVLOADS - Current Load/Received Loads; FUTRHOLD - Current Load/Future Hold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action', @level2type = N'COLUMN', @level2name = N'hldcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Prefix - if the serv_action_cod = CREHOLD,this is the hold prefix to be used when creating the hold.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action', @level2type = N'COLUMN', @level2name = N'hldpfx';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hold Reason Code - if the serv_action_cd = CREHOLD, this is the hold reason code to apply to the inventory hold record. Value would be any standard reacods defined in the code master table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action', @level2type = N'COLUMN', @level2name = N'reacod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_action', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

