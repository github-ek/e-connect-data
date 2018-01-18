CREATE TABLE [dbo].[bomhdr_prc] (
    [bomnum]           NVARCHAR (30) NOT NULL,
    [client_id]        NVARCHAR (32) NOT NULL,
    [wh_id]            NVARCHAR (32) NOT NULL,
    [wko_typ]          NVARCHAR (10) NOT NULL,
    [prcare]           NVARCHAR (10) NOT NULL,
    [prdlin]           NVARCHAR (20) NULL,
    [disass_prcloc]    NVARCHAR (20) NULL,
    [num_people]       INT           NULL,
    [speed]            INT           NULL,
    [actcod]           NVARCHAR (40) NULL,
    [def_gen_flg]      INT           DEFAULT ((0)) NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [bomhdr_prc_pk] PRIMARY KEY CLUSTERED ([bomnum] ASC, [wh_id] ASC, [client_id] ASC, [wko_typ] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [bomhdr_prc_def_gen_flg_ck] CHECK ([def_gen_flg]=(0) OR [def_gen_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This tables is added to trace the processing area and production line information linked to the BOM header', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr_prc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identify of this BOM.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr_prc', @level2type = N'COLUMN', @level2name = N'bomnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client ID of the BOM line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr_prc', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID of the BOM line.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr_prc', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The work order type will be used to determine the processing area, production line for the work order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr_prc', @level2type = N'COLUMN', @level2name = N'wko_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The default process area for the work order created by this bom.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr_prc', @level2type = N'COLUMN', @level2name = N'prcare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The default production line for the work order created by this bom.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr_prc', @level2type = N'COLUMN', @level2name = N'prdlin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'We will use this field to track the production station that the finished good should be taken to to be disassembled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr_prc', @level2type = N'COLUMN', @level2name = N'disass_prcloc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Number of people working on one work order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr_prc', @level2type = N'COLUMN', @level2name = N'num_people';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Production Speed. This value is the amount of finished good that can be produced per hour.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr_prc', @level2type = N'COLUMN', @level2name = N'speed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Activity Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr_prc', @level2type = N'COLUMN', @level2name = N'actcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'When the auto-generate work order is enabled for the BOM, only the work type with this flag set as true will be taken for the work order.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr_prc', @level2type = N'COLUMN', @level2name = N'def_gen_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr_prc', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr_prc', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr_prc', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'bomhdr_prc', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

