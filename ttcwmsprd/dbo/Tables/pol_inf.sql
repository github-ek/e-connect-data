CREATE TABLE [dbo].[pol_inf] (
    [pol_id]        NVARCHAR (50) NOT NULL,
    [polcod]        NVARCHAR (50) NULL,
    [polvar]        NVARCHAR (50) NULL,
    [polval]        NVARCHAR (50) NULL,
    [srtseq]        INT           NULL,
    [alw_mult]      INT           NULL,
    [alw_del]       INT           NULL,
    [ena_flg]       INT           NULL,
    [allw_ovrd_flg] INT           DEFAULT ((1)) NULL,
    [grp_nam]       NVARCHAR (40) NULL,
    CONSTRAINT [pol_inf_pk] PRIMARY KEY CLUSTERED ([pol_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [polinf_alwovrflgck] CHECK ([allw_ovrd_flg]=(0) OR [allw_ovrd_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table provides a means of storing information about system policies.  It linkes data from the policy data table to policy information defining possible configurations and help documentation.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_inf';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique key.  Name of the most detailed policy ''configuration''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_inf', @level2type = N'COLUMN', @level2name = N'pol_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Link to the policy data table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_inf', @level2type = N'COLUMN', @level2name = N'polcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Link to the policy data table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_inf', @level2type = N'COLUMN', @level2name = N'polvar';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Link to the policy data table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_inf', @level2type = N'COLUMN', @level2name = N'polval';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Link to the policy data table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_inf', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag that indicates whether multiple records can be configured for the policy.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_inf', @level2type = N'COLUMN', @level2name = N'alw_mult';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag that indicates whether records can be deleted from the policy.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_inf', @level2type = N'COLUMN', @level2name = N'alw_del';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag that indicates whether the policy can be changed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_inf', @level2type = N'COLUMN', @level2name = N'ena_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag that identifies if a policy value can be overridden. 0 - Policy can''t be overridden; 1 - Policy can be overridden. This is the default value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_inf', @level2type = N'COLUMN', @level2name = N'allw_ovrd_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'pol_inf', @level2type = N'COLUMN', @level2name = N'grp_nam';

