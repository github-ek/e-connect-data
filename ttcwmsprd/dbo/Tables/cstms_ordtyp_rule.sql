CREATE TABLE [dbo].[cstms_ordtyp_rule] (
    [cstms_ordtyp_id]  NVARCHAR (9)  NOT NULL,
    [cstms_ordtyp]     NVARCHAR (2)  NOT NULL,
    [cstms_site_typ]   NVARCHAR (8)  NOT NULL,
    [dest_site_typ]    NVARCHAR (8)  NULL,
    [dty_ctry_typ]     NVARCHAR (10) NULL,
    [def_flg]          INT           DEFAULT ((0)) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [cstms_ordtyp_rule_pk] PRIMARY KEY CLUSTERED ([cstms_ordtyp_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [cstms_defflg] CHECK ([def_flg]=(0) OR [def_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents the determination rules for each customs order type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_ordtyp_rule';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Order Type Id  - Unique ID to identify the customs order type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_ordtyp_rule', @level2type = N'COLUMN', @level2name = N'cstms_ordtyp_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Order Type - used to specify the type of order. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_ordtyp_rule', @level2type = N'COLUMN', @level2name = N'cstms_ordtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Site Type - Indicates whether or not the warehouse is bonded and if bonded the type of bonded warehouse. Values are ''customs'', ''customs and excise'' and blank.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_ordtyp_rule', @level2type = N'COLUMN', @level2name = N'cstms_site_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Site Type - Indicates whether or not the warehouse is bonded and if bonded the type of bonded warehouse. Values are ''customs'', ''customs and excise'' and blank.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_ordtyp_rule', @level2type = N'COLUMN', @level2name = N'dest_site_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Country Type - Indicates whether the country is part of the EU, UK or other. Values are EU, UK, or blank (does not belong to EU or UK).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_ordtyp_rule', @level2type = N'COLUMN', @level2name = N'dty_ctry_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default Flag. Indicates the Default Customs Order Type for the this rule.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_ordtyp_rule', @level2type = N'COLUMN', @level2name = N'def_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_ordtyp_rule', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_ordtyp_rule', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_ordtyp_rule', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cstms_ordtyp_rule', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

