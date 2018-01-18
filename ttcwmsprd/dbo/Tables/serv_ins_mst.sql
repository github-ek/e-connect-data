CREATE TABLE [dbo].[serv_ins_mst] (
    [serv_ins_id] NVARCHAR (20) NOT NULL,
    [moddte]      DATETIME      NULL,
    [mod_usr_id]  NVARCHAR (40) NULL,
    CONSTRAINT [serv_ins_mst_pk] PRIMARY KEY CLUSTERED ([serv_ins_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents Service Instruction Master', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Instruction ID - may be system generated sequence.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_mst', @level2type = N'COLUMN', @level2name = N'serv_ins_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_mst', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_ins_mst', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

