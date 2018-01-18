CREATE TABLE [dbo].[btoaud_dtl] (
    [btoaud_dtl_id]     NVARCHAR (12) NOT NULL,
    [btoaud_id]         NVARCHAR (12) NOT NULL,
    [slot]              NVARCHAR (10) NULL,
    [ordnum]            NVARCHAR (35) NULL,
    [exp_btoseqnum]     NVARCHAR (20) NULL,
    [scanned_btoseqnum] NVARCHAR (20) NULL,
    [btoaud_dtl_sts]    NVARCHAR (40) NULL,
    [bto_dlv_seq]       NVARCHAR (30) NULL,
    [exp_prtnum]        NVARCHAR (50) NULL,
    [scanned_prtnum]    NVARCHAR (50) NULL,
    [expqty]            INT           NULL,
    [scanned_qty]       INT           NULL,
    [ins_dt]            DATETIME      NULL,
    [last_upd_dt]       DATETIME      NULL,
    [ins_user_id]       NVARCHAR (40) NULL,
    [last_upd_user_id]  NVARCHAR (40) NULL,
    CONSTRAINT [btoaud_dtl_pk] PRIMARY KEY CLUSTERED ([btoaud_dtl_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [btoaud_dtl_idx1]
    ON [dbo].[btoaud_dtl]([btoaud_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [btoaud_dtl_idx2]
    ON [dbo].[btoaud_dtl]([slot] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'BTO Load Audit Details', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence that uniquely identifies an audit detail record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud_dtl', @level2type = N'COLUMN', @level2name = N'btoaud_dtl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence that uniquely identifies an audit.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud_dtl', @level2type = N'COLUMN', @level2name = N'btoaud_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this is a sequence audit, the slot in the container that was being audited.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud_dtl', @level2type = N'COLUMN', @level2name = N'slot';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The order number that is assigned to this slot.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud_dtl', @level2type = N'COLUMN', @level2name = N'ordnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence number that should be in the slot according to the ord record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud_dtl', @level2type = N'COLUMN', @level2name = N'exp_btoseqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The sequence number that was scanned by the user.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud_dtl', @level2type = N'COLUMN', @level2name = N'scanned_btoseqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether the audit passed or failed because of an unexpected item in the slot or because the slot that was scanned was expected to be empty and had something in it.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud_dtl', @level2type = N'COLUMN', @level2name = N'btoaud_dtl_sts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Delivery Sequence. This is the delivery sequence sent to the WMS from the host. This is the sequence in which the product must be placed onto the tophat so that when it reaches the manufacturing facility the delivery is seamless.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud_dtl', @level2type = N'COLUMN', @level2name = N'bto_dlv_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expected Item Number. Item number that should be in the current load', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud_dtl', @level2type = N'COLUMN', @level2name = N'exp_prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Scanned Item Number. The Item number that was scanned by the user', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud_dtl', @level2type = N'COLUMN', @level2name = N'scanned_prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Expected Quantity. Item untqty that should be in the current load', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud_dtl', @level2type = N'COLUMN', @level2name = N'expqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Scanned Quantity. The untqty of this item that the user has scanned', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud_dtl', @level2type = N'COLUMN', @level2name = N'scanned_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud_dtl', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud_dtl', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'btoaud_dtl', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

