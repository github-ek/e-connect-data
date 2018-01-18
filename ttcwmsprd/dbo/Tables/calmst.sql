CREATE TABLE [dbo].[calmst] (
    [wh_id]      NVARCHAR (32) NOT NULL,
    [dcsdte]     DATETIME      NOT NULL,
    [cal_id]     NVARCHAR (7)  NOT NULL,
    [cal_typ]    NVARCHAR (4)  NOT NULL,
    [wrkflg]     INT           NULL,
    [cycflg]     INT           NULL,
    [pckflg]     INT           NULL,
    [endflg]     INT           NULL,
    [mod_usr_id] NVARCHAR (40) NULL,
    [moddte]     DATETIME      NULL,
    CONSTRAINT [calmst_pk] PRIMARY KEY CLUSTERED ([dcsdte] ASC, [wh_id] ASC, [cal_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [calmst_cycflg_ck] CHECK ([cycflg]=(0) OR [cycflg]=(1)),
    CONSTRAINT [calmst_endflg_ck] CHECK ([endflg]=(0) OR [endflg]=(1)),
    CONSTRAINT [calmst_pckflg_ck] CHECK ([pckflg]=(0) OR [pckflg]=(1)),
    CONSTRAINT [calmst_wrkflg_ck] CHECK ([wrkflg]=(0) OR [wrkflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The calendar master table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'calmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - The unique identifier for the warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'calmst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'calmst', @level2type = N'COLUMN', @level2name = N'dcsdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exception Days Name''s ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'calmst', @level2type = N'COLUMN', @level2name = N'cal_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This Date is specific for pick week, count week or work week.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'calmst', @level2type = N'COLUMN', @level2name = N'cal_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work Day Flag.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'calmst', @level2type = N'COLUMN', @level2name = N'wrkflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count Day Flag.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'calmst', @level2type = N'COLUMN', @level2name = N'cycflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Day Flag.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'calmst', @level2type = N'COLUMN', @level2name = N'pckflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'End Period Flag.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'calmst', @level2type = N'COLUMN', @level2name = N'endflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User that last modified this record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'calmst', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time this record was last modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'calmst', @level2type = N'COLUMN', @level2name = N'moddte';

