CREATE TABLE [dbo].[rf_seradj] (
    [seradj_id]      NVARCHAR (10) NOT NULL,
    [stoloc]         NVARCHAR (20) NOT NULL,
    [wh_id]          NVARCHAR (32) NOT NULL,
    [devcod]         NVARCHAR (20) NOT NULL,
    [lodnum]         NVARCHAR (30) NOT NULL,
    [subnum]         NVARCHAR (30) NOT NULL,
    [dtlnum]         NVARCHAR (30) NOT NULL,
    [ser_num_typ_id] NVARCHAR (10) NOT NULL,
    [ser_lvl]        NVARCHAR (1)  NOT NULL,
    [ser_num]        NVARCHAR (40) NULL,
    CONSTRAINT [rf_seradj_pk] PRIMARY KEY CLUSTERED ([seradj_id] ASC, [devcod] ASC, [lodnum] ASC, [subnum] ASC, [dtlnum] ASC, [ser_num_typ_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used as a temporary saving point for serial numbers for inventory being adjusted in the RF', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_seradj';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This key field is used to tie inventory serials in this table to the inventory in the rf_invadj table', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_seradj', @level2type = N'COLUMN', @level2name = N'seradj_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage Location - The location the user is adjusting inventory.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_seradj', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Device Code - rf device performing the audit/adjustment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_seradj', @level2type = N'COLUMN', @level2name = N'devcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Number - The load having it''s inventory adjusted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_seradj', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sub Number - The subload having it''s inventory adjusted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_seradj', @level2type = N'COLUMN', @level2name = N'subnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Detail Number - The detail having it''s inventory adjusted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_seradj', @level2type = N'COLUMN', @level2name = N'dtlnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial Number Type ID - This will be the ID created by the user to specify a type of serial number.  There could potentially be more than one associated with a item/item client combination.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_seradj', @level2type = N'COLUMN', @level2name = N'ser_num_typ_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serialization Level - This is the level of inventory (L,S,D) we assign serial numbers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_seradj', @level2type = N'COLUMN', @level2name = N'ser_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Serial Number - This refers to a long piece of text that may contain numbers, letters, check digits and noise characters.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_seradj', @level2type = N'COLUMN', @level2name = N'ser_num';

