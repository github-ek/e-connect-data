CREATE TABLE [dbo].[inb_dock_cfg] (
    [inb_dock_id]       INT             NOT NULL,
    [wh_id]             NVARCHAR (32)   NOT NULL,
    [bldg_id]           NVARCHAR (10)   NOT NULL,
    [seqnum]            INT             NOT NULL,
    [prtfamgrp_flg]     INT             DEFAULT ((0)) NULL,
    [prtfam_flg]        INT             DEFAULT ((0)) NULL,
    [prtnum_flg]        INT             DEFAULT ((0)) NULL,
    [prt_client_id_flg] INT             DEFAULT ((0)) NULL,
    [prtfamgrp]         NVARCHAR (20)   NULL,
    [prtfam]            NVARCHAR (10)   NULL,
    [prtnum]            NVARCHAR (50)   NULL,
    [prt_client_id]     NVARCHAR (32)   NULL,
    [thresh_pct]        NUMERIC (19, 4) NOT NULL,
    CONSTRAINT [inb_dock_cfg_pk] PRIMARY KEY CLUSTERED ([inb_dock_id] ASC, [wh_id] ASC, [bldg_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [dckcfg_clntflg_ck] CHECK ([prt_client_id_flg]=(0) OR [prt_client_id_flg]=(1)),
    CONSTRAINT [dckcfg_pfmflg_ck] CHECK ([prtfam_flg]=(0) OR [prtfam_flg]=(1)),
    CONSTRAINT [dckcfg_pfmgpflg_ck] CHECK ([prtfamgrp_flg]=(0) OR [prtfamgrp_flg]=(1)),
    CONSTRAINT [dckcfg_prtnmflg_ck] CHECK ([prtnum_flg]=(0) OR [prtnum_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table will maintain the inbound dock door rules. The flags in this table will indicate to include the criteria in the groupby clause. The values will be a part of where clause while selecting inventory from trailer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_dock_cfg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inbound dock id - Identifier used to get the inbound optimal dock door configuration', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_dock_cfg', @level2type = N'COLUMN', @level2name = N'inb_dock_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_dock_cfg', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Building Identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_dock_cfg', @level2type = N'COLUMN', @level2name = N'bldg_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sequence Number - Represents the precedence of processing.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_dock_cfg', @level2type = N'COLUMN', @level2name = N'seqnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Family Group Flag - if set, item family group will be used for grouping inventory on an inbound trailer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_dock_cfg', @level2type = N'COLUMN', @level2name = N'prtfamgrp_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Family Flag - if set, item family will be used for grouping inventory on an inbound trailer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_dock_cfg', @level2type = N'COLUMN', @level2name = N'prtfam_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number Flag - if set, item number will be used for grouping inventory on an inbound trailer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_dock_cfg', @level2type = N'COLUMN', @level2name = N'prtnum_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client Id Flag - if set, item client id will be used for grouping inventory on an inbound trailer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_dock_cfg', @level2type = N'COLUMN', @level2name = N'prt_client_id_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Family Group - Specific value to determine inventory for sampling.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_dock_cfg', @level2type = N'COLUMN', @level2name = N'prtfamgrp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Family - Specific value to determine inventory for sampling.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_dock_cfg', @level2type = N'COLUMN', @level2name = N'prtfam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number - Specific value to determine inventory for sampling.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_dock_cfg', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client ID - Specific value to determine inventory for sampling.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_dock_cfg', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Threshold Percentage - Percentage of Inventory on trailer which has to be considered for sampling based on the inbound dock door configuration set', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'inb_dock_cfg', @level2type = N'COLUMN', @level2name = N'thresh_pct';

