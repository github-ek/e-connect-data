﻿CREATE TABLE [dbo].[lpncntwrk] (
    [cntbat]        NVARCHAR (10)   NOT NULL,
    [wh_id]         NVARCHAR (32)   NOT NULL,
    [stoloc]        NVARCHAR (20)   NULL,
    [cnttyp]        NVARCHAR (3)    NOT NULL,
    [cntsts]        NVARCHAR (1)    NOT NULL,
    [prtnum]        NVARCHAR (50)   NULL,
    [prt_client_id] NVARCHAR (32)   NULL,
    [inval1]        NVARCHAR (100)  NULL,
    [inval2]        NVARCHAR (100)  NULL,
    [inval3]        NVARCHAR (100)  NULL,
    [inval4]        NVARCHAR (100)  NULL,
    [inval5]        NVARCHAR (100)  NULL,
    [inval6]        NVARCHAR (100)  NULL,
    [inval7]        NVARCHAR (100)  NULL,
    [inval8]        NVARCHAR (100)  NULL,
    [inval9]        NVARCHAR (100)  NULL,
    [inval10]       NVARCHAR (100)  NULL,
    [inval11]       NVARCHAR (100)  NULL,
    [inval12]       NVARCHAR (100)  NULL,
    [inval13]       NVARCHAR (100)  NULL,
    [inval14]       NVARCHAR (100)  NULL,
    [inval15]       NVARCHAR (100)  NULL,
    [inval16]       NVARCHAR (100)  NULL,
    [inval17]       NVARCHAR (100)  NULL,
    [inval18]       NVARCHAR (100)  NULL,
    [inval19]       NVARCHAR (100)  NULL,
    [inval20]       NVARCHAR (100)  NULL,
    [inval21]       NVARCHAR (100)  NULL,
    [inval22]       NVARCHAR (100)  NULL,
    [inval23]       NVARCHAR (100)  NULL,
    [inval24]       NVARCHAR (100)  NULL,
    [inval25]       NVARCHAR (100)  NULL,
    [inval26]       NVARCHAR (100)  NULL,
    [inval27]       NVARCHAR (100)  NULL,
    [inval28]       NVARCHAR (100)  NULL,
    [inval29]       NVARCHAR (100)  NULL,
    [inval30]       NVARCHAR (100)  NULL,
    [inval31]       NVARCHAR (100)  NULL,
    [inval32]       NVARCHAR (100)  NULL,
    [inval33]       NVARCHAR (100)  NULL,
    [inval34]       NVARCHAR (100)  NULL,
    [untqty]        INT             NULL,
    [cntqty]        INT             NULL,
    [counted]       INT             DEFAULT ((0)) NULL,
    [catch_qty]     NUMERIC (19, 4) NULL,
    [cnt_catch_qty] NUMERIC (19, 4) NULL,
    [cnt_usr_id]    NVARCHAR (40)   NULL,
    [cntdte]        DATETIME        NULL,
    [cntdev]        NVARCHAR (20)   NULL,
    [cntgrp]        NVARCHAR (20)   NULL,
    [printed_flg]   INT             DEFAULT ((0)) NULL,
    [invtid]        NVARCHAR (30)   NULL,
    [moddte]        DATETIME        NULL,
    [mod_usr_id]    NVARCHAR (40)   NULL,
    [ins_dt]        DATETIME        NULL,
    [ins_user_id]   NVARCHAR (40)   NULL,
    CONSTRAINT [lpncntwrk_countedck] CHECK ([counted]=(0) OR [counted]=(1)),
    CONSTRAINT [lpncntwrk_prntdflgck] CHECK ([printed_flg]=(0) OR [printed_flg]=(1))
);


GO
CREATE NONCLUSTERED INDEX [lpncntwrk_idx1]
    ON [dbo].[lpncntwrk]([stoloc] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [lpncntwrk_idx2]
    ON [dbo].[lpncntwrk]([cntgrp] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [lpncntwrk_idx3]
    ON [dbo].[lpncntwrk]([cntbat] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [lpncntwrk_idx4]
    ON [dbo].[lpncntwrk]([cntbat] ASC, [stoloc] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [lpncntwrk_wh_id]
    ON [dbo].[lpncntwrk]([wh_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The lpncntwrk table defines the exploded LPNs in a location that will be counted during a cycle count by LPN.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count Batch.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'cntbat';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Storage Location.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'stoloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count Type.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'cnttyp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count Status.  Valid statuses are G = Generated, R = Released, C = Complete, I = Inprogress, D = Deferred, P = Prepared.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'cntsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client Id.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Load level inventory identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Sub-load level inventory identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Value for Detail level inventory identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval4';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval6';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval7';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval8';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval9';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval10';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval11';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval12';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval13';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval14';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval15';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval16';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval17';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval18';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval19';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval20';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval21';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval22';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval23';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval24';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval25';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval26';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval27';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval28';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval29';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval30';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval31';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval32';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval33';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'inval34';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit Quantity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'untqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count Quantity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'cntqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates that the LPN is counted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'counted';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pre-count Catch Quantity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Counted Catch Quantity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'cnt_catch_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count User Id.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'cnt_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count Date.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'cntdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Device Code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'cntdev';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Count Group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'cntgrp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Printed Flag.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'printed_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'invtid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time this record was last modified.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time this record was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that inserted record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'lpncntwrk', @level2type = N'COLUMN', @level2name = N'ins_user_id';

