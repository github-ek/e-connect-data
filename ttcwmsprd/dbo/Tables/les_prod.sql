CREATE TABLE [dbo].[les_prod] (
    [prod_id] NVARCHAR (40) NOT NULL,
    [grp_nam] NVARCHAR (40) NULL,
    CONSTRAINT [les_prod_pk] PRIMARY KEY CLUSTERED ([prod_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table lists the available products and their identifiers.  THIS TABLE WILL BE REMOVED IN THE FUTURE.   The concept of product ID''''s in the LES suite is going away.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_prod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_prod', @level2type = N'COLUMN', @level2name = N'prod_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_prod', @level2type = N'COLUMN', @level2name = N'grp_nam';

