CREATE TABLE [dbo].[cnfrm_serv_ins] (
    [cnfrm_serv_id]    NVARCHAR (20) NOT NULL,
    [serv_ins_id]      NVARCHAR (20) NOT NULL,
    [seqnum]           INT           NOT NULL,
    [serv_ins_typ]     NVARCHAR (8)  NOT NULL,
    [cnfrm_serv_ins]   NVARCHAR (20) NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [cnfrm_serv_ins_pk] PRIMARY KEY CLUSTERED ([cnfrm_serv_id] ASC, [serv_ins_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The cnfrm_serv_ins table is the table that store the responses down to workflow instruction level.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_ins';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Service ID-identifier for the service confirmation record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_ins', @level2type = N'COLUMN', @level2name = N'cnfrm_serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Instruction ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_ins', @level2type = N'COLUMN', @level2name = N'serv_ins_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Instruction Sequence Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_ins', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Instruction Type - code/description master entry identifying this instruction as one of the following service instruction types: YESNO - YES/NO;ACKNOWL - Acknowledge;NOCONFRM - No confirmation', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_ins', @level2type = N'COLUMN', @level2name = N'serv_ins_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Service Instruction - The Response for Instruction, like Yes, No, Acknowledged', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_ins', @level2type = N'COLUMN', @level2name = N'cnfrm_serv_ins';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_ins', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_ins', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_ins', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_ins', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

