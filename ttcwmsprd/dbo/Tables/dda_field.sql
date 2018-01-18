CREATE TABLE [dbo].[dda_field] (
    [dda_id]        NVARCHAR (40)   NOT NULL,
    [cust_lvl]      INT             NOT NULL,
    [dda_fld_typ]   NVARCHAR (1)    NOT NULL,
    [var_nam]       NVARCHAR (40)   NOT NULL,
    [srtseq]        INT             NULL,
    [link_dda_id]   NVARCHAR (40)   NULL,
    [link_flds]     NVARCHAR (2000) NULL,
    [ena_flg]       INT             NULL,
    [rqdflg]        INT             DEFAULT ((0)) NULL,
    [grp_nam]       NVARCHAR (40)   NULL,
    [dflt_flg]      INT             DEFAULT ((0)) NULL,
    [dspl_only_flg] INT             DEFAULT ((0)) NULL,
    [fltr_grp]      NVARCHAR (60)   DEFAULT (CONVERT([nvarchar],NULL)) NULL,
    [ctxt_flds]     NVARCHAR (100)  NULL,
    [pk_fld_flg]    INT             DEFAULT ((0)) NULL,
    [pk_layout_flg] INT             DEFAULT ((0)) NULL,
    [aggr_func]     INT             DEFAULT ((0)) NULL,
    CONSTRAINT [dda_field_pk] PRIMARY KEY CLUSTERED ([dda_id] ASC, [cust_lvl] ASC, [dda_fld_typ] ASC, [var_nam] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [dda_field_enaflgck] CHECK ([ena_flg]=(0) OR [ena_flg]=(1)),
    CONSTRAINT [dda_field_rqdflgck] CHECK ([rqdflg]=(0) OR [rqdflg]=(1)),
    CONSTRAINT [ddafield_dfltflgck] CHECK ([dflt_flg]=(0) OR [dflt_flg]=(1)),
    CONSTRAINT [ddafld_dspolyflgck] CHECK ([dspl_only_flg]=(0) OR [dspl_only_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains all the field definition data for display and submit fields.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The dda id of the DDA containing these fields.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field', @level2type = N'COLUMN', @level2name = N'dda_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of field A = Available, D = Display and S = Submit.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field', @level2type = N'COLUMN', @level2name = N'dda_fld_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The variable name for the field.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field', @level2type = N'COLUMN', @level2name = N'var_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The sort order for appearance of the fields.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The dda id that is linked to a display field to allow drill down processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field', @level2type = N'COLUMN', @level2name = N'link_dda_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fields whose data is passed to the link DDA.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field', @level2type = N'COLUMN', @level2name = N'link_flds';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if this field is enabled for use.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates a submit field is required at run time and data must be entered for it before any processing is done.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field', @level2type = N'COLUMN', @level2name = N'rqdflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field', @level2type = N'COLUMN', @level2name = N'grp_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates a submit field''s data should be defaulted from the previous page.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field', @level2type = N'COLUMN', @level2name = N'dflt_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates a submit field is display only.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field', @level2type = N'COLUMN', @level2name = N'dspl_only_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates what group this field belongs to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field', @level2type = N'COLUMN', @level2name = N'fltr_grp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Like link fields are passed to a link DDA, but they are available at all levels of drill down.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field', @level2type = N'COLUMN', @level2name = N'ctxt_flds';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates this field is a primary key.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field', @level2type = N'COLUMN', @level2name = N'pk_fld_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates which aggregate function will be used in the grid for this display field. 0 = None', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'dda_field', @level2type = N'COLUMN', @level2name = N'aggr_func';

