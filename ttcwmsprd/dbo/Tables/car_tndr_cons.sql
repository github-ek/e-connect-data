CREATE TABLE [dbo].[car_tndr_cons] (
    [tndr_car_cons_id] NVARCHAR (12) NOT NULL,
    [carcod]           NVARCHAR (10) NOT NULL,
    [from_shpdte]      DATETIME      NOT NULL,
    [to_shpdte]        DATETIME      NOT NULL,
    [adr_id]           NVARCHAR (20) NULL,
    [ins_dt]           DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_dt]      DATETIME      NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    [u_version]        INT           NULL,
    CONSTRAINT [car_tndr_cons_pk] PRIMARY KEY CLUSTERED ([tndr_car_cons_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [cartndrcons_carcod]
    ON [dbo].[car_tndr_cons]([carcod] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains all the tender carrier constraints.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_tndr_cons';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(PK)  System generated constraint identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_tndr_cons', @level2type = N'COLUMN', @level2name = N'tndr_car_cons_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Required) Carrier SCAC code.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_tndr_cons', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Required) The starting ship date from which the constraint will apply.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_tndr_cons', @level2type = N'COLUMN', @level2name = N'from_shpdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(Required) The ending ship date till which the constraint will apply.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_tndr_cons', @level2type = N'COLUMN', @level2name = N'to_shpdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The shipping location to which the constraint applies to.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_tndr_cons', @level2type = N'COLUMN', @level2name = N'adr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the constraint was created.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_tndr_cons', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of the user who created the contraint.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_tndr_cons', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the constraint was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_tndr_cons', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of the user who last updated the constraint', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_tndr_cons', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'System generated user version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'car_tndr_cons', @level2type = N'COLUMN', @level2name = N'u_version';

