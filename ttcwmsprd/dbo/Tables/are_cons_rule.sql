CREATE TABLE [dbo].[are_cons_rule] (
    [srcare]           NVARCHAR (10)   NOT NULL,
    [dstare]           NVARCHAR (10)   NOT NULL,
    [wh_id]            NVARCHAR (32)   NOT NULL,
    [cons_rule_cod]    NVARCHAR (4)    NOT NULL,
    [casqty]           INT             NOT NULL,
    [pceqty]           INT             NOT NULL,
    [palpct]           INT             NOT NULL,
    [src_cmd]          NVARCHAR (2000) NULL,
    [mod_usr_id]       NVARCHAR (40)   NULL,
    [moddte]           DATETIME        NULL,
    [u_version]        INT             NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    CONSTRAINT [are_cons_rule_pk] PRIMARY KEY CLUSTERED ([srcare] ASC, [dstare] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The area consolidation rule table defines rules for consolidating locations in an area.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_cons_rule';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Uniquely identifies record.  The area for the source of suggested movements.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_cons_rule', @level2type = N'COLUMN', @level2name = N'srcare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination area to attempt to get product to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_cons_rule', @level2type = N'COLUMN', @level2name = N'dstare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_cons_rule', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of rule (piece qty, case qty, pallet pct, or command) used to select candidate source locations', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_cons_rule', @level2type = N'COLUMN', @level2name = N'cons_rule_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If the rule type is case quantity, this represents the case threshold for the area', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_cons_rule', @level2type = N'COLUMN', @level2name = N'casqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If the rule type is piece quantity, this represents the piece threshold for the area', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_cons_rule', @level2type = N'COLUMN', @level2name = N'pceqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If the rule type is pallet percent, this represents the percentage of full candidate pallets must be.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_cons_rule', @level2type = N'COLUMN', @level2name = N'palpct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If the rule type is command, this is the command to execute to return candidate source locations. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_cons_rule', @level2type = N'COLUMN', @level2name = N'src_cmd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last user to modify the rule', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_cons_rule', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time rule last modified', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_cons_rule', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_cons_rule', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_cons_rule', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_cons_rule', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_cons_rule', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'are_cons_rule', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

