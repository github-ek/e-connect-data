CREATE TABLE [dbo].[blng_prd] (
    [client_id]        NVARCHAR (32) NOT NULL,
    [blng_prd_id]      NVARCHAR (20) NOT NULL,
    [blng_cyc_typ]     NVARCHAR (3)  NOT NULL,
    [nxt_blng_dat]     DATETIME      NULL,
    [last_blng_dat]    DATETIME      NULL,
    [last_dat_invc]    DATETIME      NULL,
    [day_of_week]      INT           NULL,
    [recur_cnt]        INT           NULL,
    [first_blng_day]   NVARCHAR (2)  NULL,
    [scnd_blng_day]    NVARCHAR (2)  NULL,
    [opt_prd_num_days] INT           NULL,
    CONSTRAINT [blng_prd_pk] PRIMARY KEY CLUSTERED ([blng_prd_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);




GO
CREATE NONCLUSTERED INDEX [blng_prd_idx1]
    ON [dbo].[blng_prd]([nxt_blng_dat] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The billing period table defines the calendar schedule for a client''s billing needs.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Period ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd', @level2type = N'COLUMN', @level2name = N'blng_prd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Cycle Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd', @level2type = N'COLUMN', @level2name = N'blng_cyc_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Next Billing Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd', @level2type = N'COLUMN', @level2name = N'nxt_blng_dat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Billing Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd', @level2type = N'COLUMN', @level2name = N'last_blng_dat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Date of Invoice', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd', @level2type = N'COLUMN', @level2name = N'last_dat_invc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Day of Week', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd', @level2type = N'COLUMN', @level2name = N'day_of_week';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Recurrence Count', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd', @level2type = N'COLUMN', @level2name = N'recur_cnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'First Billing Day', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd', @level2type = N'COLUMN', @level2name = N'first_blng_day';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Second Billing Day', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd', @level2type = N'COLUMN', @level2name = N'scnd_blng_day';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Refers to the length of the optional period defind for a billing service
   type of anniversary storage.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'blng_prd', @level2type = N'COLUMN', @level2name = N'opt_prd_num_days';



