CREATE TABLE [dbo].[ddso_mst] (
    [ddso_id]     NVARCHAR (40)   NOT NULL,
    [cust_lvl]    INT             NOT NULL,
    [ddso_cmd]    NVARCHAR (2000) NOT NULL,
    [ddso_qual]   NVARCHAR (512)  NULL,
    [ddso_fmt_id] NVARCHAR (40)   NULL,
    [ath_flg]     INT             DEFAULT ((1)) NULL,
    [grp_nam]     NVARCHAR (40)   NULL,
    CONSTRAINT [ddso_mst_pk] PRIMARY KEY CLUSTERED ([ddso_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains all DDSO definition information.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is a unique identifier for a defined DDSO.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_mst', @level2type = N'COLUMN', @level2name = N'ddso_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_mst', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The MOCA command to run.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_mst', @level2type = N'COLUMN', @level2name = N'ddso_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A static qualifier to apply to the command.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_mst', @level2type = N'COLUMN', @level2name = N'ddso_qual';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The output format specification identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_mst', @level2type = N'COLUMN', @level2name = N'ddso_fmt_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This flag determines whether authorization is required to view this DDSO.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_mst', @level2type = N'COLUMN', @level2name = N'ath_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ddso_mst', @level2type = N'COLUMN', @level2name = N'grp_nam';

