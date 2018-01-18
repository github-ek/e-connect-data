CREATE TABLE [dbo].[les_mls_cat] (
    [mls_id]    NVARCHAR (40)   NOT NULL,
    [locale_id] NVARCHAR (20)   NOT NULL,
    [prod_id]   NVARCHAR (10)   NOT NULL,
    [appl_id]   NVARCHAR (20)   NOT NULL,
    [frm_id]    NVARCHAR (40)   NOT NULL,
    [vartn]     NVARCHAR (512)  NOT NULL,
    [srt_seq]   INT             NOT NULL,
    [cust_lvl]  INT             NOT NULL,
    [mls_text]  NVARCHAR (2000) NOT NULL,
    [grp_nam]   NVARCHAR (40)   NULL,
    CONSTRAINT [les_mls_cat_pk] PRIMARY KEY CLUSTERED ([mls_id] ASC, [locale_id] ASC, [prod_id] ASC, [appl_id] ASC, [frm_id] ASC, [vartn] ASC, [srt_seq] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains descriptions and text for all displayed messages.  This provides the internationalization and customization of all text output.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mls_cat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mls_cat', @level2type = N'COLUMN', @level2name = N'mls_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mls_cat', @level2type = N'COLUMN', @level2name = N'locale_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This will be going away in future versions.  Currently the value ''''LES'''' is used by all products.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mls_cat', @level2type = N'COLUMN', @level2name = N'prod_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Ties this description to a specific application.  The value of ''''LES'''' is the default for all applications.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mls_cat', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Ties this description to a specific form.  The value of ''''LES'''' is the default for all forms.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mls_cat', @level2type = N'COLUMN', @level2name = N'frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Used to tie this text to a specific variation.  An example of a variation may be different size RF screens.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mls_cat', @level2type = N'COLUMN', @level2name = N'vartn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not currently used.  This was intended to be a sort order for finding a message that ''''fits'''' a certain sized area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mls_cat', @level2type = N'COLUMN', @level2name = N'srt_seq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mls_cat', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the text that will be displayed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mls_cat', @level2type = N'COLUMN', @level2name = N'mls_text';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_mls_cat', @level2type = N'COLUMN', @level2name = N'grp_nam';

