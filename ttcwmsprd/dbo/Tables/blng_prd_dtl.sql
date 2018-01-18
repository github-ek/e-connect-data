CREATE TABLE [dbo].[blng_prd_dtl] (
    [client_id]   NVARCHAR (32) NOT NULL,
    [blng_prd_id] NVARCHAR (20) NOT NULL,
    [seqnum]      INT           NOT NULL,
    [dtl_typ]     NVARCHAR (1)  NOT NULL,
    [day_of_week] INT           NULL,
    [day_of_mon]  NVARCHAR (2)  NULL,
    [recur_cnt]   INT           NULL,
    CONSTRAINT [blng_prd_dtl_pk] PRIMARY KEY CLUSTERED ([blng_prd_id] ASC, [seqnum] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The billing period detail table defines the details of a client''s billing period.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd_dtl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd_dtl', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Period ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd_dtl', @level2type = N'COLUMN', @level2name = N'blng_prd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd_dtl', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Detail Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd_dtl', @level2type = N'COLUMN', @level2name = N'dtl_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Day of Week', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd_dtl', @level2type = N'COLUMN', @level2name = N'day_of_week';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Day of Month', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd_dtl', @level2type = N'COLUMN', @level2name = N'day_of_mon';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Recurrence Count', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd_dtl', @level2type = N'COLUMN', @level2name = N'recur_cnt';

