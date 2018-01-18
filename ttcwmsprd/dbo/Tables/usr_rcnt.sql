CREATE TABLE [dbo].[usr_rcnt] (
    [wh_id]            NVARCHAR (32) NOT NULL,
    [usr_id]           NVARCHAR (40) NOT NULL,
    [cntwav]           NVARCHAR (20) NOT NULL,
    [usr_rcnts]        INT           NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [usr_rcnt_pk] PRIMARY KEY CLUSTERED ([usr_id] ASC, [cntwav] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The USER RECOUNT table is the table that stores user specific information about counts.  That is how many mistakes the user makes while performing counts so that the system knows when the user has reached the user recount threshold defined on the cnthdr', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'usr_rcnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - To identify the Warehouse', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'usr_rcnt', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User ID - To identify the user', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'usr_rcnt', @level2type = N'COLUMN', @level2name = N'usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count Wave - To identify which count wave these recounts have been generated for', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'usr_rcnt', @level2type = N'COLUMN', @level2name = N'cntwav';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User Re-Counts - Number of re-counts that user has generated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'usr_rcnt', @level2type = N'COLUMN', @level2name = N'usr_rcnts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'usr_rcnt', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'usr_rcnt', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'usr_rcnt', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'usr_rcnt', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

