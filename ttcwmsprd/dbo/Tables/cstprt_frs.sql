CREATE TABLE [dbo].[cstprt_frs] (
    [client_id] NVARCHAR (32) NOT NULL,
    [cstnum]    NVARCHAR (20) NOT NULL,
    [prtnum]    NVARCHAR (50) NOT NULL,
    [frsdte]    DATETIME      NOT NULL,
    CONSTRAINT [cstprt_frs_pk] PRIMARY KEY CLUSTERED ([cstnum] ASC, [prtnum] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents the freshness date of the most recently shipped inventory for a specific item number and customer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprt_frs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID of the customer which is being tracked.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprt_frs', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer Number we are tracking.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprt_frs', @level2type = N'COLUMN', @level2name = N'cstnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item number we are tracking.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprt_frs', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Freshness Date.  Represents the expiration date of the most recently shipped inventory to this customer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstprt_frs', @level2type = N'COLUMN', @level2name = N'frsdte';

