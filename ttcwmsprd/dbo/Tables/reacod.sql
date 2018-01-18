CREATE TABLE [dbo].[reacod] (
    [reacod]           NVARCHAR (20) NOT NULL,
    [cstms_ordtyp]     NVARCHAR (2)  NULL,
    [cstms_rcpt_typ]   NVARCHAR (2)  NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [reacod_pk] PRIMARY KEY CLUSTERED ([reacod] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The reacod table is used to represent Reasons in the system.  Reasons are used to answer ''why'' types of questions during various activities in the system such as inventory adjustment, holds, approvals, rejections, etc', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reacod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reason Code - uniquely identifies a reason.  A corresponding description of the reason is stored in dscmst', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reacod', @level2type = N'COLUMN', @level2name = N'reacod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Order Type. The customs order type defines the order type sent to Duty Management when a negative adjustment of bonded inventory is completed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reacod', @level2type = N'COLUMN', @level2name = N'cstms_ordtyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customs Receipt Type. The customs receipt type defines the receipt type sent to Duty Management when a positive adjustment of bonded inventory is completed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reacod', @level2type = N'COLUMN', @level2name = N'cstms_rcpt_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reacod', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reacod', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reacod', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'reacod', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

