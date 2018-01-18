CREATE TABLE [dbo].[rcvtrk] (
    [trknum]          NVARCHAR (20)   NOT NULL,
    [wh_id]           NVARCHAR (32)   NOT NULL,
    [trkref]          NVARCHAR (20)   NULL,
    [trnspt]          NVARCHAR (1)    NULL,
    [numpal]          INT             NULL,
    [numcas]          INT             NULL,
    [grswgt]          NUMERIC (19, 4) NULL,
    [frtcst]          NUMERIC (19, 4) NULL,
    [shpdte]          DATETIME        NULL,
    [expdte]          DATETIME        NULL,
    [clsdte]          DATETIME        NULL,
    [devcod]          NVARCHAR (20)   NULL,
    [lblflg]          INT             NULL,
    [arcdte]          DATETIME        NULL,
    [arc_src]         NVARCHAR (30)   NULL,
    [trlr_id]         NVARCHAR (20)   NULL,
    [crncy_code]      NVARCHAR (4)    NULL,
    [lms_plan_dte]    DATETIME        NULL,
    [lm_goal_seconds] INT             NULL,
    [moddte]          DATETIME        NULL,
    [mod_usr_id]      NVARCHAR (40)   NULL,
    [rec_loc]         NVARCHAR (20)   NULL,
    [rcvtrk_stat]     NVARCHAR (8)    NULL,
    [sys_gen_flg]     INT             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [rcvtrk_pk] PRIMARY KEY CLUSTERED ([trknum] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [rcvtrk_lblflg_ck] CHECK ([lblflg]=(0) OR [lblflg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [rcvtrk_trlr_id]
    ON [dbo].[rcvtrk]([trlr_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [rcvtrk_wh_id]
    ON [dbo].[rcvtrk]([wh_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Receive Truck table is used to represent trucks (receivers) in the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier for the truck.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'trknum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the inventory is to be received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Alternate identification for the receipt.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'trkref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Transportation Method', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'trnspt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of pallets expected.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'numpal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of cases expected.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'numcas';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expected weight of the goods to be received.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'grswgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Freight Cost', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'frtcst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expected Shipment date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'shpdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expected arrival date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'expdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time that receive truck was completed/closed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'clsdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Device code of nearest label device. If the devcod is null when the truck is moved to a receiving dock door, it will be updated with the device that was responsible for moving it there.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'devcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Set if labels should be generated for product identified on this truck. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'lblflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Archive Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'arcdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Archive Source', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'arc_src';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trailer ID of receiving trailer that was created and assigned to the receive truck.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'trlr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Currency Code for the Currency fields in the table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'crncy_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date for which a labor plan for this receiving truck has been created in Labor Management System (LMS). The date usually matches the expected date for the truck and serves to reference a plan in LMS.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'lms_plan_dte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The goal time in seconds estimated by the Labor Management System for this receiving truck.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'lm_goal_seconds';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Datetime Stamp of last change to row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The receiving location for the Master Receipt.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'rec_loc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Master Receipt status is updated by system to indicate the current condition. Status include EX, CI, R, SUSP, C', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'rcvtrk_stat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Set if this is a system generated Master Receipt.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rcvtrk', @level2type = N'COLUMN', @level2name = N'sys_gen_flg';

