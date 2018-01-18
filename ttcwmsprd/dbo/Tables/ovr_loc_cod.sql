CREATE TABLE [dbo].[ovr_loc_cod] (
    [ovr_loc_cod]    NVARCHAR (10) NOT NULL,
    [defflg]         INT           NULL,
    [cyc_cnt_cod]    NVARCHAR (1)  NULL,
    [set_locsts]     NVARCHAR (1)  NOT NULL,
    [set_maxqvl_flg] INT           DEFAULT ((0)) NOT NULL,
    [moddte]         DATETIME      NULL,
    [mod_usr_id]     NVARCHAR (40) NULL,
    CONSTRAINT [ovr_loc_cod_pk] PRIMARY KEY CLUSTERED ([ovr_loc_cod] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [ovrloccod_defflgck] CHECK ([defflg]=(0) OR [defflg]=(1)),
    CONSTRAINT [ovrloccod_maxqvlck] CHECK ([set_maxqvl_flg]=(0) OR [set_maxqvl_flg]=(1))
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ovr_loc_cod table is used to maintain the override location code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ovr_loc_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Override Location Code - Used to maintain the override location code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ovr_loc_cod', @level2type = N'COLUMN', @level2name = N'ovr_loc_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default Flag - Specifies what code should be displayed by default.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ovr_loc_cod', @level2type = N'COLUMN', @level2name = N'defflg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cycle Count Code - Indicates which codes get cycle counts generated when any location is overrided, and control whether the work is released right away or could be released at a later time. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ovr_loc_cod', @level2type = N'COLUMN', @level2name = N'cyc_cnt_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies the location status to be changed(Inventory Error(I) or Full(F) or No Change(N)).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ovr_loc_cod', @level2type = N'COLUMN', @level2name = N'set_locsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates location override code can be used when maximum capacity is to be changed during override. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ovr_loc_cod', @level2type = N'COLUMN', @level2name = N'set_maxqvl_flg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ovr_loc_cod', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified by Last User', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ovr_loc_cod', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

