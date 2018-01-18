CREATE TABLE [dbo].[equip] (
    [equip_nam]        NVARCHAR (40)   NOT NULL,
    [equip_typ]        NVARCHAR (40)   NULL,
    [equip_edi_cod]    NVARCHAR (40)   NULL,
    [eqpwgt]           NUMERIC (19, 4) NULL,
    [eqpcub]           NUMERIC (19, 4) NULL,
    [eqppcs]           NUMERIC (19, 4) NULL,
    [eqpcas]           NUMERIC (19, 4) NULL,
    [eqppal]           NUMERIC (19, 4) NULL,
    [eqppsc]           NUMERIC (19, 4) NULL,
    [eqpmsc2]          NUMERIC (19, 4) NULL,
    [eqplen]           NUMERIC (19, 4) NULL,
    [eqphgt]           NUMERIC (19, 4) NULL,
    [eqpwid]           NUMERIC (19, 4) NULL,
    [u_version]        INT             NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    CONSTRAINT [equip_pk] PRIMARY KEY CLUSTERED ([equip_nam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The equip is the table that defines the equipment available for equipment restrictions.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Equipment name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip', @level2type = N'COLUMN', @level2name = N'equip_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Equipment type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip', @level2type = N'COLUMN', @level2name = N'equip_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Equipment EDI Code to use to convey the equipment specification to the carrier on EDI transactions(N711 on N7 segment of EDI 204 per EDI 4050 standard) ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip', @level2type = N'COLUMN', @level2name = N'equip_edi_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Equipment capacity in terms of Weight ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip', @level2type = N'COLUMN', @level2name = N'eqpwgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Equipment capacity in terms of Cube', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip', @level2type = N'COLUMN', @level2name = N'eqpcub';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Equipment capacity in terms of Pieces', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip', @level2type = N'COLUMN', @level2name = N'eqppcs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Equipment capacity in terms of Cases', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip', @level2type = N'COLUMN', @level2name = N'eqpcas';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Equipment capacity in terms of Pallets', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip', @level2type = N'COLUMN', @level2name = N'eqppal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Equipment capacity in terms of Miscellaneous', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip', @level2type = N'COLUMN', @level2name = N'eqppsc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Equipment capacity in terms of Miscellaneous Two', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip', @level2type = N'COLUMN', @level2name = N'eqpmsc2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Equipment size - Length', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip', @level2type = N'COLUMN', @level2name = N'eqplen';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Equipment size - Height', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip', @level2type = N'COLUMN', @level2name = N'eqphgt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Equipment size - Width', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip', @level2type = N'COLUMN', @level2name = N'eqpwid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The version number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip', @level2type = N'COLUMN', @level2name = N'u_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'equip', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

