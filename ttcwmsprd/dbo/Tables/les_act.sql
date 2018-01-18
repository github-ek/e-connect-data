CREATE TABLE [dbo].[les_act] (
    [act_key]   NVARCHAR (40)   NOT NULL,
    [cust_lvl]  INT             NOT NULL,
    [act_pmsns] NUMERIC (3)     NOT NULL,
    [act_typ]   NVARCHAR (20)   NOT NULL,
    [comp]      NVARCHAR (40)   NULL,
    [func]      NVARCHAR (2000) NULL,
    [parm1]     NVARCHAR (200)  NULL,
    [parm2]     NVARCHAR (200)  NULL,
    [parm3]     NVARCHAR (200)  NULL,
    [parm4]     NVARCHAR (200)  NULL,
    [parm5]     NVARCHAR (200)  NULL,
    [nxt_act]   NVARCHAR (40)   NULL,
    [ret_fld]   NVARCHAR (256)  NULL,
    [grp_nam]   NVARCHAR (40)   NULL,
    CONSTRAINT [les_act_pk] PRIMARY KEY CLUSTERED ([act_key] ASC, [cust_lvl] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table configures actions that can be executed by the client application.   Currently these actions are tied only to the key configuration table for use with key presses. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_act';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Part of the unique identifier.  Key value that identifies a single action', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_act', @level2type = N'COLUMN', @level2name = N'act_key';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allows different customization levels for customer and project teams.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_act', @level2type = N'COLUMN', @level2name = N'cust_lvl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This field determines what type of action this record represents.  Currently only ''''MCS'''' is accepted.  As other products make use of this table, more entries will be added.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_act', @level2type = N'COLUMN', @level2name = N'act_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates which client component will handle the action', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_act', @level2type = N'COLUMN', @level2name = N'comp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates which the specific function of the client component to execucute', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_act', @level2type = N'COLUMN', @level2name = N'func';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Parameters passed to the function if appropriate', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_act', @level2type = N'COLUMN', @level2name = N'parm1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates that the listed action should be executed after this action.  This functionality is not currently available.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_act', @level2type = N'COLUMN', @level2name = N'nxt_act';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Command delimited list of fields to return from a server command type action.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_act', @level2type = N'COLUMN', @level2name = N'ret_fld';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_act', @level2type = N'COLUMN', @level2name = N'grp_nam';

