CREATE TABLE [dbo].[wkodtl_ins] (
    [wkonum]    NVARCHAR (20) NOT NULL,
    [client_id] NVARCHAR (32) NOT NULL,
    [wkorev]    NVARCHAR (10) NOT NULL,
    [wkolin]    NVARCHAR (10) NOT NULL,
    [inskey]    NVARCHAR (30) NOT NULL,
    [wh_id]     NVARCHAR (32) NOT NULL,
    [cmpl_flg]  INT           NULL,
    CONSTRAINT [wkodtl_ins_pk] PRIMARY KEY CLUSTERED ([wkonum] ASC, [wkorev] ASC, [wkolin] ASC, [inskey] ASC, [wh_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [wkodtl_cmpl_flg_ck] CHECK ([cmpl_flg]=(0) OR [cmpl_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents special instructions associated with a work order line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl_ins';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A number which identifies the work order to the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl_ins', @level2type = N'COLUMN', @level2name = N'wkonum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The client code that owns this work order.  In a non-3PL system, this value defaults to ''----''. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl_ins', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used if multiple copies of a standard work order are desired.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl_ins', @level2type = N'COLUMN', @level2name = N'wkorev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Instruction key of the instruction to be performed for the BOM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl_ins', @level2type = N'COLUMN', @level2name = N'inskey';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the work order is to be processed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl_ins', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Set if the instruction has been completed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wkodtl_ins', @level2type = N'COLUMN', @level2name = N'cmpl_flg';

