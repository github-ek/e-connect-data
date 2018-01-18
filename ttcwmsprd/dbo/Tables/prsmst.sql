CREATE TABLE [dbo].[prsmst] (
    [prtadr]     NVARCHAR (10) NOT NULL,
    [wh_id]      NVARCHAR (32) NOT NULL,
    [tcpadr]     NVARCHAR (20) NULL,
    [rerprt]     NVARCHAR (10) NULL,
    [prtsts]     NVARCHAR (1)  NOT NULL,
    [prtnam]     NVARCHAR (10) NULL,
    [prttyp]     NVARCHAR (10) NOT NULL,
    [svqflg]     INT           NULL,
    [prtque]     NVARCHAR (80) NULL,
    [moddte]     DATETIME      NULL,
    [mod_usr_id] NVARCHAR (40) NULL,
    CONSTRAINT [prsmst_pk] PRIMARY KEY CLUSTERED ([prtadr] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [prsmst_svqflg_ck] CHECK ([svqflg]=(0) OR [svqflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table defines the printers assigned to the system', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prsmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Printer Address. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prsmst', @level2type = N'COLUMN', @level2name = N'prtadr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prsmst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'TCP Address. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prsmst', @level2type = N'COLUMN', @level2name = N'tcpadr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Re-Route Printer. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prsmst', @level2type = N'COLUMN', @level2name = N'rerprt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Printer Status. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prsmst', @level2type = N'COLUMN', @level2name = N'prtsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Printer Type. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prsmst', @level2type = N'COLUMN', @level2name = N'prttyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Server Queue Flag. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prsmst', @level2type = N'COLUMN', @level2name = N'svqflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Print Queue. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prsmst', @level2type = N'COLUMN', @level2name = N'prtque';

