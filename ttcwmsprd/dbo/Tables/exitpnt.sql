CREATE TABLE [dbo].[exitpnt] (
    [exitpnt_typ]      NVARCHAR (30) NOT NULL,
    [exitpnt]          NVARCHAR (15) NOT NULL,
    [tblnme]           NVARCHAR (30) NULL,
    [moddte]           DATETIME      NULL,
    [mod_usr_id]       NVARCHAR (40) NULL,
    [u_version]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [exitpnt_pk] PRIMARY KEY CLUSTERED ([exitpnt_typ] ASC, [exitpnt] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The exit point table is the table that defines the point of the exit.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'exitpnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exit Point Type - determines the general process during which the exit point should be evaluated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'exitpnt', @level2type = N'COLUMN', @level2name = N'exitpnt_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exit Point - determines the exact point in the warehouse process when this exit point should be evaluated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'exitpnt', @level2type = N'COLUMN', @level2name = N'exitpnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The table name used by Capture and Store Media functionality in generation of media key which links the captured media to the right table entry - ex., during dispatch trailer workflow, captured media can be attached to trailer table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'exitpnt', @level2type = N'COLUMN', @level2name = N'tblnme';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'exitpnt', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'exitpnt', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'exitpnt', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'exitpnt', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'exitpnt', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

