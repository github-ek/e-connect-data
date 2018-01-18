CREATE TABLE [dbo].[cnthdr] (
    [cntbat]         NVARCHAR (10)  NOT NULL,
    [wh_id]          NVARCHAR (32)  NOT NULL,
    [adddte]         DATETIME       NULL,
    [gencod]         NVARCHAR (3)   NULL,
    [cntmod]         NVARCHAR (1)   NOT NULL,
    [reqtyp]         NVARCHAR (1)   NOT NULL,
    [prtnum]         NVARCHAR (50)  NULL,
    [prt_client_id]  NVARCHAR (32)  NULL,
    [invid1]         NVARCHAR (100) NULL,
    [invid2]         NVARCHAR (100) NULL,
    [invid3]         NVARCHAR (100) NULL,
    [invid4]         NVARCHAR (100) NULL,
    [invid5]         NVARCHAR (100) NULL,
    [invid6]         NVARCHAR (100) NULL,
    [invid7]         NVARCHAR (100) NULL,
    [invid8]         NVARCHAR (100) NULL,
    [invid9]         NVARCHAR (100) NULL,
    [invid10]        NVARCHAR (100) NULL,
    [invid11]        NVARCHAR (100) NULL,
    [invid12]        NVARCHAR (100) NULL,
    [invid13]        NVARCHAR (100) NULL,
    [invid14]        NVARCHAR (100) NULL,
    [invid15]        NVARCHAR (100) NULL,
    [invid16]        NVARCHAR (100) NULL,
    [invid17]        NVARCHAR (100) NULL,
    [invid18]        NVARCHAR (100) NULL,
    [invid19]        NVARCHAR (100) NULL,
    [invid20]        NVARCHAR (100) NULL,
    [invid21]        NVARCHAR (100) NULL,
    [invid22]        NVARCHAR (100) NULL,
    [invid23]        NVARCHAR (100) NULL,
    [invid24]        NVARCHAR (100) NULL,
    [invid25]        NVARCHAR (100) NULL,
    [invid26]        NVARCHAR (100) NULL,
    [invid27]        NVARCHAR (100) NULL,
    [invid28]        NVARCHAR (100) NULL,
    [invid29]        NVARCHAR (100) NULL,
    [invid30]        NVARCHAR (100) NULL,
    [invid31]        NVARCHAR (100) NULL,
    [invid32]        NVARCHAR (100) NULL,
    [invid33]        NVARCHAR (100) NULL,
    [invid34]        NVARCHAR (100) NULL,
    [inval1]         NVARCHAR (100) NULL,
    [inval2]         NVARCHAR (100) NULL,
    [inval3]         NVARCHAR (100) NULL,
    [inval4]         NVARCHAR (100) NULL,
    [inval5]         NVARCHAR (100) NULL,
    [inval6]         NVARCHAR (100) NULL,
    [inval7]         NVARCHAR (100) NULL,
    [inval8]         NVARCHAR (100) NULL,
    [inval9]         NVARCHAR (100) NULL,
    [inval10]        NVARCHAR (100) NULL,
    [inval11]        NVARCHAR (100) NULL,
    [inval12]        NVARCHAR (100) NULL,
    [inval13]        NVARCHAR (100) NULL,
    [inval14]        NVARCHAR (100) NULL,
    [inval15]        NVARCHAR (100) NULL,
    [inval16]        NVARCHAR (100) NULL,
    [inval17]        NVARCHAR (100) NULL,
    [inval18]        NVARCHAR (100) NULL,
    [inval19]        NVARCHAR (100) NULL,
    [inval20]        NVARCHAR (100) NULL,
    [inval21]        NVARCHAR (100) NULL,
    [inval22]        NVARCHAR (100) NULL,
    [inval23]        NVARCHAR (100) NULL,
    [inval24]        NVARCHAR (100) NULL,
    [inval25]        NVARCHAR (100) NULL,
    [inval26]        NVARCHAR (100) NULL,
    [inval27]        NVARCHAR (100) NULL,
    [inval28]        NVARCHAR (100) NULL,
    [inval29]        NVARCHAR (100) NULL,
    [inval30]        NVARCHAR (100) NULL,
    [inval31]        NVARCHAR (100) NULL,
    [inval32]        NVARCHAR (100) NULL,
    [inval33]        NVARCHAR (100) NULL,
    [inval34]        NVARCHAR (100) NULL,
    [locid1]         NVARCHAR (100) NULL,
    [locid2]         NVARCHAR (100) NULL,
    [locid3]         NVARCHAR (100) NULL,
    [locvl1]         NVARCHAR (40)  NULL,
    [locvl2]         NVARCHAR (40)  NULL,
    [locvl3]         NVARCHAR (40)  NULL,
    [cntwav]         NVARCHAR (32)  NULL,
    [usr_cnt_trshld] INT            NULL,
    [cnt_id]         NVARCHAR (32)  NULL,
    CONSTRAINT [cnthdr_pk] PRIMARY KEY CLUSTERED ([cntbat] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [cnthdr_idx1]
    ON [dbo].[cnthdr]([cntwav] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [cnthdr_wh_id]
    ON [dbo].[cnthdr]([wh_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count Batch.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'cntbat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date Added.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'adddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Generation Code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'gencod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count Mode.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'cntmod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Request Type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'reqtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 1.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 2.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 3.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 4.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 5.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 6.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 7.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 8.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 9.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 10.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 11.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 12.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 13.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 14.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 15.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 16.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 17.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 18.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 19.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid19';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 20.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid20';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 21.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid21';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 22.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid22';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 23.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid23';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 24.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid24';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 25.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid25';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 26.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid26';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 27.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid27';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 28.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid28';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 29.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid29';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 30.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid30';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 31.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid31';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 32.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid32';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 33.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid33';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Identifier 34.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'invid34';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 1.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 2.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 3.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 4.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 5.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 6.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 7.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 8.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 9.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 10.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 11.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 12.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 13.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 14.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 15.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 16.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 17.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 18.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 19.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval19';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 20.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval20';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 21.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval21';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 22.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval22';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 23.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval23';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 24.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval24';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 25.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval25';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 26.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval26';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 27.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval27';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 28.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval28';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 29.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval29';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 30.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval30';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 31.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval31';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 32.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval32';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 33.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval33';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Inventory Identifier 34.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'inval34';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Location Identifier 1.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'locid1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Location Identifier 2.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'locid2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Location Identifier 3.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'locid3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Location Identifier 1.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'locvl1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Location Identifier 2.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'locvl2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Location Identifier 3.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'locvl3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Count Wave.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'cntwav';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines how many recounts a user can generate before an EMS event is fired', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'usr_cnt_trshld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID that Identifies the Count.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnthdr', @level2type = N'COLUMN', @level2name = N'cnt_id';

