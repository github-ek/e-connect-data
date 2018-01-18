CREATE TABLE [dbo].[client_chrg_sched] (
    [chrg_key]          NVARCHAR (20)   NOT NULL,
    [client_id]         NVARCHAR (32)   NOT NULL,
    [blng_prd_id]       NVARCHAR (20)   NOT NULL,
    [blng_chrg_typ]     NVARCHAR (1)    NOT NULL,
    [blng_serv_typ]     NVARCHAR (20)   NOT NULL,
    [prtnum]            NVARCHAR (50)   DEFAULT (N'----') NOT NULL,
    [prt_client_id]     NVARCHAR (32)   DEFAULT (N'----') NOT NULL,
    [prtfam]            NVARCHAR (10)   DEFAULT (N'----') NOT NULL,
    [blng_uom_cod]      NVARCHAR (4)    NOT NULL,
    [wh_id]             NVARCHAR (32)   NOT NULL,
    [blng_rate]         NUMERIC (19, 4) NULL,
    [min_chrg]          NUMERIC (19, 4) NULL,
    [max_chrg]          NUMERIC (19, 4) NULL,
    [effdte]            DATETIME        DEFAULT (getdate()) NOT NULL,
    [cmnt]              NVARCHAR (2000) NULL,
    [blng_invc_grp_cod] NVARCHAR (10)   NULL,
    [leased_pal_pos]    INT             NULL,
    [crncy_code]        NVARCHAR (4)    NULL,
    CONSTRAINT [clnt_chrg_sch_pk] PRIMARY KEY CLUSTERED ([chrg_key] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [clnt_chrg_sch_uk1]
    ON [dbo].[client_chrg_sched]([blng_prd_id] ASC, [blng_chrg_typ] ASC, [blng_serv_typ] ASC, [prtnum] ASC, [prt_client_id] ASC, [prtfam] ASC, [effdte] ASC, [client_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client charge schedule defines the charge schedule for the various clients', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client charge schedule key', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched', @level2type = N'COLUMN', @level2name = N'chrg_key';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Period Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched', @level2type = N'COLUMN', @level2name = N'blng_prd_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invoice Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched', @level2type = N'COLUMN', @level2name = N'blng_chrg_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched', @level2type = N'COLUMN', @level2name = N'blng_serv_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Family', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched', @level2type = N'COLUMN', @level2name = N'prtfam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched', @level2type = N'COLUMN', @level2name = N'blng_uom_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Rate', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched', @level2type = N'COLUMN', @level2name = N'blng_rate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Minimum Charge', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched', @level2type = N'COLUMN', @level2name = N'min_chrg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum Charge', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched', @level2type = N'COLUMN', @level2name = N'max_chrg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Effective date - allows a change to a charge schedule to be for the future', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched', @level2type = N'COLUMN', @level2name = N'effdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Comment', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched', @level2type = N'COLUMN', @level2name = N'cmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Billing Invoice Group Code.  Identifies the parent group to which the billing invoices will be created into.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched', @level2type = N'COLUMN', @level2name = N'blng_invc_grp_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Leased Pallet Positions.  The number of pallet positions leased by a client.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched', @level2type = N'COLUMN', @level2name = N'leased_pal_pos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Currency Code for the Currency fields in the table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client_chrg_sched', @level2type = N'COLUMN', @level2name = N'crncy_code';

