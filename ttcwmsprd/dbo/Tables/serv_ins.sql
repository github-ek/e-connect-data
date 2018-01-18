CREATE TABLE [dbo].[serv_ins] (
    [serv_id]       NVARCHAR (20) NOT NULL,
    [serv_ins_id]   NVARCHAR (20) NOT NULL,
    [seqnum]        INT           NOT NULL,
    [serv_ins_typ]  NVARCHAR (8)  NOT NULL,
    [stop_serv_flg] INT           NULL,
    [moddte]        DATETIME      NULL,
    [mod_usr_id]    NVARCHAR (40) NULL,
    CONSTRAINT [serv_ins_pk] PRIMARY KEY CLUSTERED ([serv_id] ASC, [serv_ins_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [srvins_stpsrvflgck] CHECK ([stop_serv_flg]=(0) OR [stop_serv_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents Service Instructions', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins', @level2type = N'COLUMN', @level2name = N'serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Instruction ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins', @level2type = N'COLUMN', @level2name = N'serv_ins_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Instruction Type - code/description master entry identifying this instruction as one of the following service instruction types: YESNO - YES/NO;ACKNOWL - Acknowledge;NOCONFRM - No confirmation', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins', @level2type = N'COLUMN', @level2name = N'serv_ins_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stop Service Flag - If this flag is checked and this service fails, then the user will not be required to complete any more services for this object.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins', @level2type = N'COLUMN', @level2name = N'stop_serv_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

