CREATE TABLE [dbo].[prtlot] (
    [lotnum]           NVARCHAR (25) NOT NULL,
    [sup_lotnum]       NVARCHAR (25) NULL,
    [prtnum]           NVARCHAR (50) NOT NULL,
    [prt_client_id]    NVARCHAR (32) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [mandte]           DATETIME      NULL,
    [expdte]           DATETIME      NULL,
    [def_invsts]       NVARCHAR (4)  NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [prtlot_pk] PRIMARY KEY CLUSTERED ([prtnum] ASC, [lotnum] ASC, [wh_id] ASC, [prt_client_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The itmlot is the table that holds the information used to track lots.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtlot';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtlot', @level2type = N'COLUMN', @level2name = N'lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lot number supplied by the supplier for tracking purposes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtlot', @level2type = N'COLUMN', @level2name = N'sup_lotnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtlot', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client Id. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtlot', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Id ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtlot', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents the Manufacturing date of the lot on inventory. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtlot', @level2type = N'COLUMN', @level2name = N'mandte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents the Expiration date of the lot on inventory. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtlot', @level2type = N'COLUMN', @level2name = N'expdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default inventory status. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtlot', @level2type = N'COLUMN', @level2name = N'def_invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Insertion of a Date. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtlot', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtlot', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtlot', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prtlot', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

