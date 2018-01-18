CREATE TABLE [dbo].[ctnmst] (
    [ctncod]           NVARCHAR (4)    NOT NULL,
    [wh_id]            NVARCHAR (32)   NOT NULL,
    [ctnlen]           NUMERIC (19, 4) NOT NULL,
    [ctnwid]           NUMERIC (19, 4) NOT NULL,
    [ctnhgt]           NUMERIC (19, 4) NOT NULL,
    [ctnwgt]           NUMERIC (19, 4) NOT NULL,
    [ctnwlm]           NUMERIC (19, 4) NOT NULL,
    [ctnfpc]           NUMERIC (19, 4) NOT NULL,
    [last_ctn_fpc]     NUMERIC (19, 4) NOT NULL,
    [moddte]           DATETIME        NULL,
    [mod_usr_id]       NVARCHAR (40)   NULL,
    [cube_rem_flg]     INT             DEFAULT ((0)) NULL,
    [sens_box_flg]     INT             DEFAULT ((0)) NULL,
    [pko_flg]          INT             DEFAULT ((0)) NOT NULL,
    [pre_prnt_lbl_flg] INT             DEFAULT ((0)) NOT NULL,
    [shpflg]           INT             DEFAULT ((0)) NOT NULL,
    [pckflg]           INT             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [ctnmst_pk] PRIMARY KEY CLUSTERED ([ctncod] ASC, [wh_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [ctnmst_cubremflgck] CHECK ([cube_rem_flg]=(0) OR [cube_rem_flg]=(1)),
    CONSTRAINT [ctnmst_pkoflgck] CHECK ([pko_flg]=(0) OR [pko_flg]=(1)),
    CONSTRAINT [ctnmst_snsboxflgck] CHECK ([sens_box_flg]=(0) OR [sens_box_flg]=(1)),
    CONSTRAINT [pckflg_ck] CHECK ([pckflg]=(0) OR [pckflg]=(1)),
    CONSTRAINT [preprntlbl_flg_ck] CHECK ([pre_prnt_lbl_flg]=(0) OR [pre_prnt_lbl_flg]=(1)),
    CONSTRAINT [shpflg_ck] CHECK ([shpflg]=(0) OR [shpflg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The carton master maintenance table is used to create new and modify existing cartons in the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnmst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The code for the carton being used. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnmst', @level2type = N'COLUMN', @level2name = N'ctncod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse Id.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnmst', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The length of the carton being used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnmst', @level2type = N'COLUMN', @level2name = N'ctnlen';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The width of the carton being used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnmst', @level2type = N'COLUMN', @level2name = N'ctnwid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The height of the carton being used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnmst', @level2type = N'COLUMN', @level2name = N'ctnhgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The weight of the carton being used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnmst', @level2type = N'COLUMN', @level2name = N'ctnwgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The maximum weight limit of the carton being used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnmst', @level2type = N'COLUMN', @level2name = N'ctnwlm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The total percent of the carton that is filled.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnmst', @level2type = N'COLUMN', @level2name = N'ctnfpc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The fill percentage of the last carton for picks having a common break value. This should be equal to or greater than ctnfpc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnmst', @level2type = N'COLUMN', @level2name = N'last_ctn_fpc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date/time this record was last modified. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnmst', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of user that performed last modification. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnmst', @level2type = N'COLUMN', @level2name = N'mod_usr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag to use remaining space in a carton when using List Picking Max Cube Functionality', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnmst', @level2type = N'COLUMN', @level2name = N'cube_rem_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is set, the carton will be used for cartonizing picks for sensitive parts.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnmst', @level2type = N'COLUMN', @level2name = N'sens_box_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flag to mark this carton as supported for Packout.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnmst', @level2type = N'COLUMN', @level2name = N'pko_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pre Printed Label. If this is set, it means that the labels on the carton are printed outside of the system or it is pre-printed on the carton and this value should be used to identify the carton.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnmst', @level2type = N'COLUMN', @level2name = N'pre_prnt_lbl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is set, the carton will be used as a shipping carton.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnmst', @level2type = N'COLUMN', @level2name = N'shpflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If this flag is set, the carton will be used for pick to box by cartonization.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ctnmst', @level2type = N'COLUMN', @level2name = N'pckflg';

