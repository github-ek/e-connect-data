CREATE TABLE [dbo].[carhdr_log] (
    [aud_log_id]       NVARCHAR (12) NOT NULL,
    [carcod]           NVARCHAR (10) NULL,
    [accnum]           NVARCHAR (30) NULL,
    [carnam]           NVARCHAR (30) NULL,
    [scacod]           NVARCHAR (10) NULL,
    [autoclsflg]       INT           NULL,
    [autocls_mansts]   NVARCHAR (1)  NULL,
    [autocls_wait_tim] INT           NULL,
    [adr_id]           NVARCHAR (20) NULL,
    [mod_usr_id]       NVARCHAR (40) NULL,
    [moddte]           DATETIME      NULL,
    [hrs_opr_set_id]   NVARCHAR (16) NULL,
    [excp_hrs_set_id]  NVARCHAR (16) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [carhdr_log_pk] PRIMARY KEY CLUSTERED ([aud_log_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains audit log information for the carhdr table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr_log';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key.  System generated audit log identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr_log', @level2type = N'COLUMN', @level2name = N'aud_log_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr_log', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr_log', @level2type = N'COLUMN', @level2name = N'accnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier Name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr_log', @level2type = N'COLUMN', @level2name = N'carnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'SCAC Code - 4 digit carrier code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr_log', @level2type = N'COLUMN', @level2name = N'scacod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Auto Close Flag - This determines if the SAL Daemon process will close the shipment after the amount of time has passed in the autocls_wait_tim column', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr_log', @level2type = N'COLUMN', @level2name = N'autoclsflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Manifest status for auto close', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr_log', @level2type = N'COLUMN', @level2name = N'autocls_mansts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time to Wait (in minutes)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr_log', @level2type = N'COLUMN', @level2name = N'autocls_wait_tim';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to associate an address to this carrier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr_log', @level2type = N'COLUMN', @level2name = N'adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reference to an Operational Hours Set.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr_log', @level2type = N'COLUMN', @level2name = N'hrs_opr_set_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reference to an Operational Hours Exception Set.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr_log', @level2type = N'COLUMN', @level2name = N'excp_hrs_set_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System generated update version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr_log', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the session was created.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr_log', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the session was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr_log', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of the user who created the session.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr_log', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of the user who last updated the session.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'carhdr_log', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

