CREATE TABLE [dbo].[rpl_slotprof_link] (
    [rplref]           NVARCHAR (10) NOT NULL,
    [slot_uom]         NVARCHAR (2)  NOT NULL,
    [pckqty]           INT           NOT NULL,
    [prof_name]        NVARCHAR (30) NULL,
    [par_prof]         NVARCHAR (30) NULL,
    [rule_nam]         NVARCHAR (20) NULL,
    [orgqty]           INT           NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [rpl_slotprf_lnk_pk] PRIMARY KEY CLUSTERED ([rplref] ASC, [slot_uom] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This contains the replenishments which are used for dynamic slotting', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_slotprof_link';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Replenishment Reference - This contains the replenishment reference for the work being processed for slotting ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_slotprof_link', @level2type = N'COLUMN', @level2name = N'rplref';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Slot UOM -The field will have the calculated UOM for each rplwrk based on the pckqty. This field will be used to group by while creating the profile. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_slotprof_link', @level2type = N'COLUMN', @level2name = N'slot_uom';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pick Quantity - This is the short quantity that needs to be moved to PickFaces ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_slotprof_link', @level2type = N'COLUMN', @level2name = N'pckqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Profile Name - The profile name that is getting created for the rplref ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_slotprof_link', @level2type = N'COLUMN', @level2name = N'prof_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Link between multiple profiles created from the relation of different rplref with shared and particular rules.  The most generic will be the parent profile.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_slotprof_link', @level2type = N'COLUMN', @level2name = N'par_prof';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This rule name will be passed to allocate inventory logic as this rule is created by comparing the rules between rplwrk records.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_slotprof_link', @level2type = N'COLUMN', @level2name = N'rule_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Original Quantity - This is the short quantity that needs to be moved to PickFaces, The difference between pckqty and orgqty is  after allocation pckqty gets reduced by the allocated quantity, orgqty remains the same.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_slotprof_link', @level2type = N'COLUMN', @level2name = N'orgqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_slotprof_link', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_slotprof_link', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_slotprof_link', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rpl_slotprof_link', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

