CREATE TABLE [dbo].[blng_invc] (
    [blng_invc_num]      NVARCHAR (20)   NOT NULL,
    [wh_id]              NVARCHAR (32)   NOT NULL,
    [client_id]          NVARCHAR (32)   NULL,
    [blng_prd_id]        NVARCHAR (20)   NULL,
    [blng_chrg_typ]      NVARCHAR (1)    NULL,
    [processed_date]     DATETIME        NULL,
    [avail_flg]          INT             NULL,
    [printed_flg]        INT             NULL,
    [uploaded_flg]       INT             NULL,
    [mstr_blng_invc_num] NVARCHAR (20)   NULL,
    [usr_blng_invc_num]  NVARCHAR (20)   NULL,
    [min_chrg]           NUMERIC (19, 4) NULL,
    [max_chrg]           NUMERIC (19, 4) NULL,
    [blng_prd_start]     DATETIME        NULL,
    [blng_prd_end]       DATETIME        NULL,
    [blng_prd_days]      INT             NULL,
    [blng_invc_grp_cod]  NVARCHAR (10)   NULL,
    [crncy_code]         NVARCHAR (4)    NULL,
    CONSTRAINT [blng_invc_pk] PRIMARY KEY CLUSTERED ([blng_invc_num] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [blng_invc_availflg] CHECK ([avail_flg]=(0) OR [avail_flg]=(1)),
    CONSTRAINT [blng_invc_prntdflg] CHECK ([printed_flg]=(0) OR [printed_flg]=(1)),
    CONSTRAINT [blng_invc_upldflg] CHECK ([uploaded_flg]=(0) OR [uploaded_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [blng_invc_idx1]
    ON [dbo].[blng_invc]([blng_prd_id] ASC, [blng_chrg_typ] ASC, [client_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [blng_invc_idx2]
    ON [dbo].[blng_invc]([mstr_blng_invc_num] ASC, [blng_invc_num] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The billing invoice defines the main fields of an invoice', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Invoice Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc', @level2type = N'COLUMN', @level2name = N'blng_invc_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which the building exists', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Period Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc', @level2type = N'COLUMN', @level2name = N'blng_prd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Charge Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc', @level2type = N'COLUMN', @level2name = N'blng_chrg_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Processed Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc', @level2type = N'COLUMN', @level2name = N'processed_date';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Available Flag.  Signifies whether the invoice can still be modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc', @level2type = N'COLUMN', @level2name = N'avail_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Printed Flag.  Signifies whether the invoice has been printed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc', @level2type = N'COLUMN', @level2name = N'printed_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Uploaded Flag.  Signifies whether the system has sent a transaction for the invoice.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc', @level2type = N'COLUMN', @level2name = N'uploaded_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Master Billing Invoice Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc', @level2type = N'COLUMN', @level2name = N'mstr_blng_invc_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User Billing Invoice Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc', @level2type = N'COLUMN', @level2name = N'usr_blng_invc_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Minimum Charge', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc', @level2type = N'COLUMN', @level2name = N'min_chrg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum Charge', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc', @level2type = N'COLUMN', @level2name = N'max_chrg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Start of Billing Period', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc', @level2type = N'COLUMN', @level2name = N'blng_prd_start';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'End of Billing Period', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc', @level2type = N'COLUMN', @level2name = N'blng_prd_end';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Total days of a Billing Period', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc', @level2type = N'COLUMN', @level2name = N'blng_prd_days';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Invoice Group Code.  Identifies the parent group to which the billing invoices will be created into.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc', @level2type = N'COLUMN', @level2name = N'blng_invc_grp_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Currency Code for the Currency fields in the table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_invc', @level2type = N'COLUMN', @level2name = N'crncy_code';

