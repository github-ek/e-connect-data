CREATE TABLE [dbo].[pckbat] (
    [schbat]       NVARCHAR (32)   NOT NULL,
    [wh_id]        NVARCHAR (32)   NOT NULL,
    [batsts]       NVARCHAR (4)    NULL,
    [pricod]       NVARCHAR (2)    NULL,
    [batcod]       NVARCHAR (20)   NULL,
    [lblsst]       NVARCHAR (150)  NULL,
    [adddte]       DATETIME        NULL,
    [rpldte]       DATETIME        NULL,
    [reldte]       DATETIME        NULL,
    [cmpdte]       DATETIME        NULL,
    [numsls]       INT             NULL,
    [totpcs]       INT             NULL,
    [numstc]       INT             NULL,
    [numppk]       INT             NULL,
    [numcpk]       INT             NULL,
    [numpck]       INT             NULL,
    [palvol]       NUMERIC (19, 4) NULL,
    [estpal]       INT             NULL,
    [estwgt]       NUMERIC (19, 4) NULL,
    [wave_prc_flg] INT             DEFAULT ((0)) NULL,
    [rule_nam]     NVARCHAR (20)   NULL,
    [moddte]       DATETIME        NULL,
    [mod_usr_id]   NVARCHAR (40)   NULL,
    CONSTRAINT [pckbat_pk] PRIMARY KEY CLUSTERED ([schbat] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [pckbat_wvprcflgck] CHECK ([wave_prc_flg]=(0) OR [wave_prc_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The pick batch table is used to track picks that were created/allocated through wave processing. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Schedule batch. This uniquely identifies the record and represents a group of picks.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'schbat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Status of the batch.  Possible values are Planned, Allocated, Released, Scheduled, Complete and Allocation In Process.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'batsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Priority code of the batch.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'pricod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Batch Code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'batcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If associated to an order, this is the order line which requires this pick.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'lblsst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date batch was added.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date batch was replenished.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'rpldte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date batch was released.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'reldte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date batch was completed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'cmpdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of order lines.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'numsls';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Total pieces', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'totpcs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of ship-to customers', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'numstc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of pallet picks', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'numppk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of case picks', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'numcpk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of piece picks', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'numpck';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Estimated pallet volume', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'palvol';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of estimated pallets', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'estpal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Estimated weight', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'estwgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This value determines whether pick batch was processed via wave', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'wave_prc_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of wave rule if batch was processed via wave', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pckbat', @level2type = N'COLUMN', @level2name = N'rule_nam';

