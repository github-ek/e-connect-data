CREATE TABLE [dbo].[paytrm] (
    [dstnam]     NVARCHAR (30) NOT NULL,
    [paycod]     NVARCHAR (20) NOT NULL,
    [payval]     NVARCHAR (2)  NOT NULL,
    [codflg]     INT           NULL,
    [moddte]     DATETIME      NULL,
    [mod_usr_id] NVARCHAR (40) NULL,
    CONSTRAINT [paytrm_pk] PRIMARY KEY CLUSTERED ([dstnam] ASC, [paycod] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [paytrm_codflg_ck] CHECK ([codflg]=(0) OR [codflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The paytrm table holds information regarding payment terms used by parcel manifesting and transportation management.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'paytrm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the manifesting system the pay code applies to', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'paytrm', @level2type = N'COLUMN', @level2name = N'dstnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pay Code - this is a unique value used for lookups and acts as the primary key.  Typically this holds a concatenated string of the PM system and the value it passes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'paytrm', @level2type = N'COLUMN', @level2name = N'paycod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pay Value - this holds the value that is used by the parcel manifesting system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'paytrm', @level2type = N'COLUMN', @level2name = N'payval';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'COD Flag - this flag determines if the payment term is for a COD', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'paytrm', @level2type = N'COLUMN', @level2name = N'codflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Datetime Stamp of last change to row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'paytrm', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'paytrm', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

