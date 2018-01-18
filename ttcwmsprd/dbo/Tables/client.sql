CREATE TABLE [dbo].[client] (
    [client_id]     NVARCHAR (32)   NOT NULL,
    [adr_id]        NVARCHAR (20)   NULL,
    [bt_locale_id]  NVARCHAR (20)   NULL,
    [iso_crncy_flg] INT             NULL,
    [sto_blng_typ]  NVARCHAR (4)    NULL,
    [free_days]     INT             NULL,
    [split_stg_cod] NVARCHAR (1)    NULL,
    [lot_anniv_flg] INT             NULL,
    [sts_ovr_flg]   INT             NULL,
    [auto_add_serv] INT             NULL,
    [lot_fmt_id]    NVARCHAR (10)   NULL,
    [grp_nam]       NVARCHAR (40)   NULL,
    [adj_thr_cst]   NUMERIC (19, 4) NULL,
    [adj_thr_unit]  INT             NULL,
    CONSTRAINT [client_pk] PRIMARY KEY CLUSTERED ([client_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [clnt_autoaddservck] CHECK ([auto_add_serv]=(0) OR [auto_add_serv]=(1)),
    CONSTRAINT [clnt_isocrncyflgck] CHECK ([iso_crncy_flg]=(0) OR [iso_crncy_flg]=(1)),
    CONSTRAINT [clnt_lotannivflgck] CHECK ([lot_anniv_flg]=(0) OR [lot_anniv_flg]=(1)),
    CONSTRAINT [clnt_stsovrflgck] CHECK ([sts_ovr_flg]=(0) OR [sts_ovr_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The client table is used to represent the different customers that a 3pl provider represents', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique identifier for the client.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Address identifier for this client.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client', @level2type = N'COLUMN', @level2name = N'adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bill-To Locale Id.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client', @level2type = N'COLUMN', @level2name = N'bt_locale_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag indicating whether to use ISO Currency format.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client', @level2type = N'COLUMN', @level2name = N'iso_crncy_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage billing method for this client.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client', @level2type = N'COLUMN', @level2name = N'sto_blng_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Free storage days for this client.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client', @level2type = N'COLUMN', @level2name = N'free_days';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines if and how a split charge should be applied in client billing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client', @level2type = N'COLUMN', @level2name = N'split_stg_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag indicating whether to bill by lot anniversary.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client', @level2type = N'COLUMN', @level2name = N'lot_anniv_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used in client billing to determine if the status should be set to BILLABLE immediately.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client', @level2type = N'COLUMN', @level2name = N'sts_ovr_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag for automatically adding configurable workflows to invoices.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client', @level2type = N'COLUMN', @level2name = N'auto_add_serv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Lot Format ID, which is to be used for any parts of this client with no defined lot format.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client', @level2type = N'COLUMN', @level2name = N'lot_fmt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The default group name for the application stored in the policy table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client', @level2type = N'COLUMN', @level2name = N'grp_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client adjustment threshold cost value - This is the maximum value of an adjustment that will be allowed without requiring approval by supervisor.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client', @level2type = N'COLUMN', @level2name = N'adj_thr_cst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client adjustment threshold unit value - This is the maximum value of an adjustment that will be allowed without requiring approval by supervisor.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'client', @level2type = N'COLUMN', @level2name = N'adj_thr_unit';

