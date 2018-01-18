CREATE TABLE [dbo].[cnthst] (
    [cnthst_id]     NVARCHAR (10)   NOT NULL,
    [wh_id]         NVARCHAR (32)   NOT NULL,
    [cntbat]        NVARCHAR (10)   NOT NULL,
    [cntdte]        DATETIME        NOT NULL,
    [cnttyp]        NVARCHAR (3)    NULL,
    [gencod]        NVARCHAR (3)    NULL,
    [cntmod]        NVARCHAR (1)    NOT NULL,
    [stoloc]        NVARCHAR (20)   NULL,
    [prtnum]        NVARCHAR (50)   NULL,
    [prt_client_id] NVARCHAR (32)   NULL,
    [invid1]        NVARCHAR (100)  NULL,
    [invid2]        NVARCHAR (100)  NULL,
    [invid3]        NVARCHAR (100)  NULL,
    [invid4]        NVARCHAR (100)  NULL,
    [invid5]        NVARCHAR (100)  NULL,
    [invid6]        NVARCHAR (100)  NULL,
    [invid7]        NVARCHAR (100)  NULL,
    [invid8]        NVARCHAR (100)  NULL,
    [invid9]        NVARCHAR (100)  NULL,
    [invid10]       NVARCHAR (100)  NULL,
    [invid11]       NVARCHAR (100)  NULL,
    [invid12]       NVARCHAR (100)  NULL,
    [invid13]       NVARCHAR (100)  NULL,
    [invid14]       NVARCHAR (100)  NULL,
    [invid15]       NVARCHAR (100)  NULL,
    [invid16]       NVARCHAR (100)  NULL,
    [invid17]       NVARCHAR (100)  NULL,
    [invid18]       NVARCHAR (100)  NULL,
    [invid19]       NVARCHAR (100)  NULL,
    [invid20]       NVARCHAR (100)  NULL,
    [invid21]       NVARCHAR (100)  NULL,
    [invid22]       NVARCHAR (100)  NULL,
    [invid23]       NVARCHAR (100)  NULL,
    [invid24]       NVARCHAR (100)  NULL,
    [invid25]       NVARCHAR (100)  NULL,
    [invid26]       NVARCHAR (100)  NULL,
    [invid27]       NVARCHAR (100)  NULL,
    [invid28]       NVARCHAR (100)  NULL,
    [invid29]       NVARCHAR (100)  NULL,
    [invid30]       NVARCHAR (100)  NULL,
    [invid31]       NVARCHAR (100)  NULL,
    [invid32]       NVARCHAR (100)  NULL,
    [invid33]       NVARCHAR (100)  NULL,
    [invid34]       NVARCHAR (100)  NULL,
    [inval1]        NVARCHAR (100)  NULL,
    [inval2]        NVARCHAR (100)  NULL,
    [inval3]        NVARCHAR (100)  NULL,
    [inval4]        NVARCHAR (100)  NULL,
    [inval5]        NVARCHAR (100)  NULL,
    [inval6]        NVARCHAR (100)  NULL,
    [inval7]        NVARCHAR (100)  NULL,
    [inval8]        NVARCHAR (100)  NULL,
    [inval9]        NVARCHAR (100)  NULL,
    [inval10]       NVARCHAR (100)  NULL,
    [inval11]       NVARCHAR (100)  NULL,
    [inval12]       NVARCHAR (100)  NULL,
    [inval13]       NVARCHAR (100)  NULL,
    [inval14]       NVARCHAR (100)  NULL,
    [inval15]       NVARCHAR (100)  NULL,
    [inval16]       NVARCHAR (100)  NULL,
    [inval17]       NVARCHAR (100)  NULL,
    [inval18]       NVARCHAR (100)  NULL,
    [inval19]       NVARCHAR (100)  NULL,
    [inval20]       NVARCHAR (100)  NULL,
    [inval21]       NVARCHAR (100)  NULL,
    [inval22]       NVARCHAR (100)  NULL,
    [inval23]       NVARCHAR (100)  NULL,
    [inval24]       NVARCHAR (100)  NULL,
    [inval25]       NVARCHAR (100)  NULL,
    [inval26]       NVARCHAR (100)  NULL,
    [inval27]       NVARCHAR (100)  NULL,
    [inval28]       NVARCHAR (100)  NULL,
    [inval29]       NVARCHAR (100)  NULL,
    [inval30]       NVARCHAR (100)  NULL,
    [inval31]       NVARCHAR (100)  NULL,
    [inval32]       NVARCHAR (100)  NULL,
    [inval33]       NVARCHAR (100)  NULL,
    [inval34]       NVARCHAR (100)  NULL,
    [untqty]        INT             NULL,
    [catch_qty]     NUMERIC (19, 4) NULL,
    [cntqty]        INT             NULL,
    [cnt_catch_qty] NUMERIC (19, 4) NULL,
    [counted]       INT             NULL,
    [untcst]        NUMERIC (19, 4) NULL,
    [cnt_usr_id]    NVARCHAR (40)   NULL,
    [crncy_code]    NVARCHAR (4)    NULL,
    [adddte]        DATETIME        NULL,
    [trndte]        DATETIME        DEFAULT (getdate()) NULL,
    [moddte]        DATETIME        NULL,
    [mod_usr_id]    NVARCHAR (40)   NULL
);


GO
CREATE NONCLUSTERED INDEX [cnthst_idx1]
    ON [dbo].[cnthst]([cntdte] ASC, [cnttyp] ASC, [stoloc] ASC, [prtnum] ASC, [prt_client_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count History Identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'cnthst_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count Batch.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'cntbat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count Date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'cntdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count Type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'cnttyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Generation Code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'gencod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count Mode.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'cntmod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage Location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 1', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 2', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 3', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 4', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 5', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 6', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 7', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 8', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 9', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 10', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 11', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 12', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 13', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 14', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 15', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 16', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 17', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 18', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 19', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid19';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 20', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid20';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 21', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid21';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 22', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid22';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 23', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid23';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 24', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid24';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 25', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid25';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 26', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid26';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 27', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid27';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 28', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid28';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 29', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid29';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 30', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid30';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 31', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid31';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 32', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid32';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 33', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid33';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Attribute 34', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'invid34';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 1', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 2', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Vaule for Inventory Attribute 3', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 4', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 5', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 6', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 7', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Vaule for Inventory Attribute 8', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 9', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 10', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 11', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 12', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Vaule for Inventory Attribute 13', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 14', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 15', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 16', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 17', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Vaule for Inventory Attribute 18', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 19', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval19';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 20', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval20';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 21', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval21';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 22', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval22';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Vaule for Inventory Attribute 23', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval23';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 24', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval24';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 25', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval25';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 26', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval26';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 27', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval27';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 28', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval28';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 29', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval29';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 30', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval30';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 31', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval31';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 32', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval32';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 33', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval33';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Attribute 34', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'inval34';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'untqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Catch Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'cntqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count Catch Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'cnt_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates that the LPN is counted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'counted';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit Cost', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'untcst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count User Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'cnt_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Currency Code for the Currency fields in the table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'crncy_code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date Count was Created.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Transaction (Count Batch Complete) Date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'trndte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time this record was last modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthst', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

