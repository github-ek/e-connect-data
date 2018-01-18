CREATE TABLE [dbo].[codmst] (
    [colnam]  NVARCHAR (100) NOT NULL,
    [codval]  NVARCHAR (40)  NOT NULL,
    [srtseq]  INT            NOT NULL,
    [rqdflg]  INT            DEFAULT ((0)) NULL,
    [img_id]  NVARCHAR (512) NULL,
    [grp_nam] NVARCHAR (40)  NULL,
    CONSTRAINT [codmst_pk] PRIMARY KEY CLUSTERED ([colnam] ASC, [codval] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [codmst_rqdflg_ck] CHECK ([rqdflg]=(0) OR [rqdflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains code values for variables.  This table is typically used in conjunction with the Description Master tables (dscmst, sys_dsc_mst)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'codmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This field ties code values to a column or variable name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'codmst', @level2type = N'COLUMN', @level2name = N'colnam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  This represents one of the code values for this column.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'codmst', @level2type = N'COLUMN', @level2name = N'codval';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Used to sort the code entries', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'codmst', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag indicates that the data is required for the system to function properly.  Only users with special privileges are allowed to remove this entry.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'codmst', @level2type = N'COLUMN', @level2name = N'rqdflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Path to image to display in an image combo box.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'codmst', @level2type = N'COLUMN', @level2name = N'img_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'codmst', @level2type = N'COLUMN', @level2name = N'grp_nam';

