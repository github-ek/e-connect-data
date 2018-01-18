CREATE TABLE [dbo].[wf_appl] (
    [appl_id]      NVARCHAR (20)  NOT NULL,
    [cust_lvl]     INT            NOT NULL,
    [descr_id]     NVARCHAR (120) NULL,
    [start_frm_id] NVARCHAR (40)  NULL,
    [prod_id]      NVARCHAR (10)  NULL,
    [grp_nam]      NVARCHAR (40)  NULL,
    CONSTRAINT [wf_appl_pk] PRIMARY KEY CLUSTERED ([appl_id] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains the top level data for a work flow application.  These entries represent the entry points for an application.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_appl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_appl', @level2type = N'COLUMN', @level2name = N'appl_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_appl', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the mls_id of an MLS Catalog entry that is the description of the application.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_appl', @level2type = N'COLUMN', @level2name = N'descr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This points to the WF_FRM entry that is the starting form of the application.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_appl', @level2type = N'COLUMN', @level2name = N'start_frm_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'wf_appl', @level2type = N'COLUMN', @level2name = N'grp_nam';

