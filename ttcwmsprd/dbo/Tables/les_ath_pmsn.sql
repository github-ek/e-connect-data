CREATE TABLE [dbo].[les_ath_pmsn] (
    [pmsn_id]      NVARCHAR (20) NOT NULL,
    [bit_pos]      INT           NOT NULL,
    [pmsn_typ_cod] NVARCHAR (1)  NOT NULL,
    [grp_nam]      NVARCHAR (40) NULL,
    CONSTRAINT [les_ath_prm_pk] PRIMARY KEY CLUSTERED ([pmsn_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table lists the specific permissions and their spot in the permission bitmap.  A full permission mask consists of individual bits that map to types of permissions.  This table lists the bits.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_ath_pmsn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier that identifies a permission bit.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_ath_pmsn', @level2type = N'COLUMN', @level2name = N'pmsn_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates which bit in the long value (32 bit) maps to this permission.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_ath_pmsn', @level2type = N'COLUMN', @level2name = N'bit_pos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates which framework this standard permission applies to: (B)oth, (F)ramework or (W)affle.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_ath_pmsn', @level2type = N'COLUMN', @level2name = N'pmsn_typ_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_ath_pmsn', @level2type = N'COLUMN', @level2name = N'grp_nam';

