CREATE TABLE [dbo].[rplcfg] (
    [rplnum]        NVARCHAR (10) NOT NULL,
    [wh_id]         NVARCHAR (32) NOT NULL,
    [prtnum]        NVARCHAR (50) NULL,
    [prt_client_id] NVARCHAR (32) NULL,
    [stoloc]        NVARCHAR (20) NULL,
    [arecod]        NVARCHAR (10) NULL,
    [invsts]        NVARCHAR (4)  NULL,
    [pctflg]        INT           NULL,
    [maxunt]        INT           NOT NULL,
    [minunt]        INT           NOT NULL,
    [maxloc]        INT           NULL,
    [cmpflg]        INT           NULL,
    [rpldte]        DATETIME      NULL,
    [inc_pct_flg]   INT           DEFAULT ((1)) NOT NULL,
    [inc_unt]       INT           DEFAULT ((100)) NOT NULL,
    [rls_pct]       INT           DEFAULT ((100)) NOT NULL,
    [mod_usr_id]    NVARCHAR (40) NULL,
    CONSTRAINT [rplcfg_pk] PRIMARY KEY CLUSTERED ([rplnum] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [rplcfg_cmpflg_ck] CHECK ([cmpflg]=(0) OR [cmpflg]=(1)),
    CONSTRAINT [rplcfg_ipctflg_ck] CHECK ([inc_pct_flg]=(0) OR [inc_pct_flg]=(1)),
    CONSTRAINT [rplcfg_pctflg_ck] CHECK ([pctflg]=(0) OR [pctflg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [rplcfg_acod_prtnum]
    ON [dbo].[rplcfg]([wh_id] ASC, [arecod] ASC, [prtnum] ASC, [prt_client_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [rplcfg_idx1]
    ON [dbo].[rplcfg]([wh_id] ASC, [prtnum] ASC, [prt_client_id] ASC, [stoloc] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [rplcfg_idx2]
    ON [dbo].[rplcfg]([wh_id] ASC, [cmpflg] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Replenishment Configuration table is used to represent replenishment activities in the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplcfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier for the replenishment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplcfg', @level2type = N'COLUMN', @level2name = N'rplnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse id.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplcfg', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item number of an Item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplcfg', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client Identifier of an Item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplcfg', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage Location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplcfg', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Area Code of a storage.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplcfg', @level2type = N'COLUMN', @level2name = N'arecod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inventory Status of the Items.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplcfg', @level2type = N'COLUMN', @level2name = N'invsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pecentage flag to check the number of availble items whether by number or by percentage.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplcfg', @level2type = N'COLUMN', @level2name = N'pctflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum unit for a particular item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplcfg', @level2type = N'COLUMN', @level2name = N'maxunt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Minimum unit for a particular item. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplcfg', @level2type = N'COLUMN', @level2name = N'minunt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum locations for replenishment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplcfg', @level2type = N'COLUMN', @level2name = N'maxloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag for Completion of replenishmnt.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplcfg', @level2type = N'COLUMN', @level2name = N'cmpflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of the replenishment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplcfg', @level2type = N'COLUMN', @level2name = N'rpldte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Increment Percentage flag to check the number of increment items whether by number or by percentage. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplcfg', @level2type = N'COLUMN', @level2name = N'inc_pct_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Increment Unit when a location can be over allocated. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplcfg', @level2type = N'COLUMN', @level2name = N'inc_unt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The perecent will be used to get the max capacity of the location by multipy the maxqvl of the location. System will use this max capacity to check if the emergency/demand replenishment should be released to pending.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplcfg', @level2type = N'COLUMN', @level2name = N'rls_pct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier of Last user who modified the replenishment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rplcfg', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

