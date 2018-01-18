CREATE TABLE [dbo].[wrkhst] (
    [wrkhst_id]  NVARCHAR (10) NOT NULL,
    [wh_id]      NVARCHAR (32) NOT NULL,
    [wrksts]     NVARCHAR (4)  NULL,
    [ackdevcod]  NVARCHAR (20) NULL,
    [ack_usr_id] NVARCHAR (40) NULL,
    [oprcod]     NVARCHAR (9)  NULL,
    [srcloc]     NVARCHAR (20) NULL,
    [dstloc]     NVARCHAR (20) NULL,
    [prvloc]     NVARCHAR (20) NULL,
    [issdte]     DATETIME      NULL,
    [ackdte]     DATETIME      NULL,
    [middte]     DATETIME      NULL,
    [cmpdte]     DATETIME      NULL,
    [cmpcod]     NVARCHAR (3)  NULL,
    [arcdte]     DATETIME      NULL,
    [arc_src]    NVARCHAR (30) NULL,
    [lblbat]     NVARCHAR (6)  NULL,
    [moddte]     DATETIME      NULL,
    [mod_usr_id] NVARCHAR (40) NULL,
    CONSTRAINT [wrkhst_pk] PRIMARY KEY CLUSTERED ([wrkhst_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [wrkhst_idx1]
    ON [dbo].[wrkhst]([ackdevcod] ASC, [oprcod] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work History', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work history ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'wrkhst_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The current status of the work. Valid values are P - pending, A - acknowledged, W - waiting for acknowledgement, S - suspended.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'wrksts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Acknowledged Device', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'ackdevcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Acknowledged User', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'ack_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Operation Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'oprcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source Location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'srcloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Location', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'dstloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'prvloc', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'prvloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date Issued', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'issdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date Acknowledged', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'ackdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'middte', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'middte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date Completed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'cmpdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'cmpcod', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'cmpcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Archive Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'arcdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Archive Source', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'arc_src';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The label batch for the piece of work. Multiple pckwrk_hdr records may be grouped and completed under the same wrkque record if they all contain the same lblbat value on their pckwrk records.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'lblbat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkhst', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

