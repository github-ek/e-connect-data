CREATE TABLE [dbo].[popup_mnu] (
    [mnu_id]      NVARCHAR (20)  NOT NULL,
    [item_id]     NVARCHAR (20)  NOT NULL,
    [par_item_id] NVARCHAR (20)  NOT NULL,
    [mls_id]      NVARCHAR (40)  NOT NULL,
    [type]        NUMERIC (1)    NOT NULL,
    [posn]        NUMERIC (2)    NOT NULL,
    [func]        NVARCHAR (3)   NOT NULL,
    [parms]       NVARCHAR (120) NULL,
    [event]       NVARCHAR (40)  NOT NULL,
    [pmsns]       NUMERIC (3)    NOT NULL,
    [grp_nam]     NVARCHAR (40)  NULL,
    CONSTRAINT [popup_mnu_pk] PRIMARY KEY CLUSTERED ([mnu_id] ASC, [item_id] ASC, [par_item_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is not currently in use.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'popup_mnu';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'popup_mnu', @level2type = N'COLUMN', @level2name = N'grp_nam';

