CREATE TABLE [dbo].[fedex_tran_data] (
    [srvnam]           NVARCHAR (40) NOT NULL,
    [tran_id]          NVARCHAR (50) NOT NULL,
    [fld_pos]          INT           NOT NULL,
    [parnam]           NVARCHAR (50) NOT NULL,
    [parfmt]           NVARCHAR (20) NULL,
    [fld_len]          INT           NOT NULL,
    [fld_typ]          INT           NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [fedex_tran_data_pk] PRIMARY KEY CLUSTERED ([srvnam] ASC, [tran_id] ASC, [fld_pos] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [fdxtrndat_fldtypck] CHECK ([fld_typ]=(0) OR [fld_typ]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fedex transaction data table stores the data from the FedEx package confirmation', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fedex_tran_data';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Name - this a combination of the carrier and service level of the carrier for the FedEx transaction', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fedex_tran_data', @level2type = N'COLUMN', @level2name = N'srvnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Transaction Id - this is the FedEx name/identifier for the trnasaction', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fedex_tran_data', @level2type = N'COLUMN', @level2name = N'tran_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Field Position - this is the position of the field within the FedEx transaction', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fedex_tran_data', @level2type = N'COLUMN', @level2name = N'fld_pos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Parameter Name - this is the name of the parameter within the FedEx transaction', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fedex_tran_data', @level2type = N'COLUMN', @level2name = N'parnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Parameter Format - this is the format string for the parameter', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fedex_tran_data', @level2type = N'COLUMN', @level2name = N'parfmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Field Length - this is the length of the field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fedex_tran_data', @level2type = N'COLUMN', @level2name = N'fld_len';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Field Type - this is the type of field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fedex_tran_data', @level2type = N'COLUMN', @level2name = N'fld_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fedex_tran_data', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fedex_tran_data', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fedex_tran_data', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fedex_tran_data', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fedex_tran_data', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

