CREATE TABLE [dbo].[cnfrm_serv_val] (
    [cnfrm_serv_id]     NVARCHAR (20) NOT NULL,
    [serv_ins_id]       NVARCHAR (20) NOT NULL,
    [seqnum]            INT           NOT NULL,
    [cnfrm_val_var_nam] NVARCHAR (40) NULL,
    [cnfrm_serv_val]    NVARCHAR (30) NOT NULL,
    [cnfrm_usr_id]      NVARCHAR (40) NULL,
    [cnfrm_dte]         DATETIME      NULL,
    [moddte]            DATETIME      NULL,
    [mod_usr_id]        NVARCHAR (40) NULL,
    CONSTRAINT [cnfrm_serv_val_pk] PRIMARY KEY CLUSTERED ([cnfrm_serv_id] ASC, [serv_ins_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The cnfrm_serv_val table is the table that records the confirmation service values.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Service ID-identifier for the service confirmation record', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_val', @level2type = N'COLUMN', @level2name = N'cnfrm_serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Instruction ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_val', @level2type = N'COLUMN', @level2name = N'serv_ins_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Instruction Sequence Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_val', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Value Variable Name-this is the var_nam of the input field through which the user will input a value into the confirmation service form.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_val', @level2type = N'COLUMN', @level2name = N'cnfrm_val_var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Service Value', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_val', @level2type = N'COLUMN', @level2name = N'cnfrm_serv_val';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Service User ID-the user that entered the confirmation value for this service', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_val', @level2type = N'COLUMN', @level2name = N'cnfrm_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Service Date-when was this service instruction value confirmed?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_val', @level2type = N'COLUMN', @level2name = N'cnfrm_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modification Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_val', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_serv_val', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

