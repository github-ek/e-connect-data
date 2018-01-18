CREATE TABLE [dbo].[carhdr] (
    [carcod]           NVARCHAR (10) NOT NULL,
    [accnum]           NVARCHAR (30) NULL,
    [carnam]           NVARCHAR (30) NULL,
    [scacod]           NVARCHAR (10) NULL,
    [crncy_code]       NVARCHAR (4)  NULL,
    [autoclsflg]       INT           NULL,
    [autocls_mansts]   NVARCHAR (1)  NULL,
    [autocls_wait_tim] INT           NULL,
    [adr_id]           NVARCHAR (20) NULL,
    [mod_usr_id]       NVARCHAR (40) NULL,
    [moddte]           DATETIME      NULL,
    [hrs_opr_set_id]   NVARCHAR (16) NULL,
    [excp_hrs_set_id]  NVARCHAR (16) NULL,
    CONSTRAINT [carhdr_pk] PRIMARY KEY CLUSTERED ([carcod] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [carhdr_autclsflgck] CHECK ([autoclsflg]=(0) OR [autoclsflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The carrier header is the table that defines the carriers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr', @level2type = N'COLUMN', @level2name = N'accnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr', @level2type = N'COLUMN', @level2name = N'carnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SCAC Code - 4 digit carrier code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr', @level2type = N'COLUMN', @level2name = N'scacod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Currency Code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr', @level2type = N'COLUMN', @level2name = N'crncy_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Auto Close Flag - This determines if the SAL Daemon process will close the shipment after the amount of time has passed in the autocls_wait_tim column', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr', @level2type = N'COLUMN', @level2name = N'autoclsflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Manifest status for auto close', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr', @level2type = N'COLUMN', @level2name = N'autocls_mansts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time to Wait (in minutes)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr', @level2type = N'COLUMN', @level2name = N'autocls_wait_tim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to associate an address to this carrier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr', @level2type = N'COLUMN', @level2name = N'adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reference to an Operational Hours Set.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr', @level2type = N'COLUMN', @level2name = N'hrs_opr_set_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reference to an Operational Hours Exception Set.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr', @level2type = N'COLUMN', @level2name = N'excp_hrs_set_id';

