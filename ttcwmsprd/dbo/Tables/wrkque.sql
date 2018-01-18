CREATE TABLE [dbo].[wrkque] (
    [reqnum]       INT           NOT NULL,
    [wrksts]       NVARCHAR (4)  NOT NULL,
    [baspri]       INT           NOT NULL,
    [effpri]       INT           NOT NULL,
    [wh_id]        NVARCHAR (32) NOT NULL,
    [oprcod]       NVARCHAR (9)  NULL,
    [srcloc]       NVARCHAR (20) NULL,
    [dstloc]       NVARCHAR (20) NULL,
    [ack_usr_id]   NVARCHAR (40) NULL,
    [ackdevcod]    NVARCHAR (20) NULL,
    [client_id]    NVARCHAR (32) NULL,
    [lodnum]       NVARCHAR (30) NULL,
    [lodlvl]       NVARCHAR (1)  NULL,
    [adddte]       DATETIME      NULL,
    [issdte]       DATETIME      NULL,
    [ackdte]       DATETIME      NULL,
    [pckdte]       DATETIME      NULL,
    [depdte]       DATETIME      NULL,
    [wrkref]       NVARCHAR (12) NULL,
    [lblbat]       NVARCHAR (6)  NULL,
    [cntgrp]       NVARCHAR (20) NULL,
    [refloc]       NVARCHAR (20) NULL,
    [batnum]       NVARCHAR (12) NULL,
    [srcwrkzon]    NVARCHAR (10) NULL,
    [srcwrkare]    NVARCHAR (8)  NULL,
    [loctrvseq]    NVARCHAR (20) NULL,
    [zontrvseq]    INT           NULL,
    [asg_usr_id]   NVARCHAR (40) NULL,
    [lstescdte]    DATETIME      NULL,
    [locacc]       NVARCHAR (30) NULL,
    [schbat]       NVARCHAR (32) NULL,
    [list_id]      NVARCHAR (15) NULL,
    [asg_role_id]  NVARCHAR (20) NULL,
    [src_bldg_id]  NVARCHAR (10) NULL,
    [src_aisle_id] NVARCHAR (20) NULL,
    CONSTRAINT [wrkque_pk] PRIMARY KEY CLUSTERED ([reqnum] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [wrkque_lblbat]
    ON [dbo].[wrkque]([lblbat] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [wrkqueopr_lstescdt]
    ON [dbo].[wrkque]([oprcod] ASC, [lstescdte] ASC, [effpri] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [wrkque_wrkzon_pri]
    ON [dbo].[wrkque]([srcwrkzon] ASC, [wrksts] ASC, [effpri] ASC, [oprcod] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [wrkque_wrkare_pri]
    ON [dbo].[wrkque]([srcwrkare] ASC, [wrksts] ASC, [effpri] ASC, [oprcod] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [wrkque_wrksts_pri]
    ON [dbo].[wrkque]([wrksts] ASC, [effpri] ASC, [oprcod] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [wrkque_idx1]
    ON [dbo].[wrkque]([wrkref] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [wrkque_wh_id]
    ON [dbo].[wrkque]([wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [wrkque_idx2]
    ON [dbo].[wrkque]([lodnum] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [wrkque_list_id]
    ON [dbo].[wrkque]([list_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [wrkque_srcloc]
    ON [dbo].[wrkque]([srcloc] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The work queue table is used to maintain and track scheduled RF directed work.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This uniquely identifies the record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'reqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The current status of the work. Possible values are P - pending, A - acknowledged, W - waiting for acknowledgement, S - suspended.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'wrksts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The base piority or beginning priority at which work for this type of operation code was created.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'baspri';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The current priority of the work.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'effpri';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - Specifies the warehouse which owns the work.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The code that defines the type of work to be performed and how it should be handled in the system. This code is used to define the form flow for the RF as well as the priority of the work and other base attributes of this type of work.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'oprcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The source location for beginning the work.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'srcloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The destination location for depositing the inventory, trailer or whatever entity the work is designed to accomplish.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'dstloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The RF operator that has currently acknowledged the work.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'ack_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The device code of the RF unit or device that has currently acknowledged the work.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'ackdevcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The client for which the work was created.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The load number of the load which is to be processed with this piece of work.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The load level - load (pallet), sub (case), or detail (each) - at which this piece of work is to be processed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'lodlvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the record was added to the wrkque table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the record was in issue.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'issdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the work was acknowledged by an RF operator.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'ackdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the record was picked by an RF operator.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'pckdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the record was deposited by an RF operator.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'depdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The work reference for a pick, the carrier code for a trailer operation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'wrkref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The label batch for the piece of work. Multiple pckwrk_hdr records may be grouped and completed under the same wrkque record if they all contain the same lblbat value on their pckwrk records.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'lblbat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The count group value for a cycle count operation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'cntgrp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The source location identifier that will be displayed to the RF operator. This may not be the same as the srcloc value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'refloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The batch number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'batnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The work area for the source location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'srcwrkare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The numeric travel sequence value for the source location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'loctrvseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The numeric travel sequence value for the source location''s work zone.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'zontrvseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The RF operator assigned to perform the work.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'asg_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The last time the effpri was automatically escalated by the background work priority escalation process.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'lstescdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The location access value or the type of vehicle assesibility allowed for the source location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'locacc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The schedule batch number identifying the batch or wave for which the piece of work was generated. If multiple picks are associated with the piece of work and they have multiple schbat values, this schbat number will be blank.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'schbat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'List ID- Identifies the pick list that the work has been created for. If this piece of work is not a pick for a list, this value will be null.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'list_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If set, only users assigned to this role can get this piece of work.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'asg_role_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The source building that the work is located in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'src_bldg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The source aisle that the work is located in.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wrkque', @level2type = N'COLUMN', @level2name = N'src_aisle_id';

