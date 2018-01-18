CREATE TABLE [dbo].[les_opt_ath] (
    [opt_nam]   NVARCHAR (50) NOT NULL,
    [ath_typ]   NVARCHAR (1)  NOT NULL,
    [ath_id]    NVARCHAR (40) NOT NULL,
    [pmsn_mask] INT           NOT NULL,
    [grp_nam]   NVARCHAR (40) NULL,
    CONSTRAINT [les_opt_ath_pk] PRIMARY KEY CLUSTERED ([opt_nam] ASC, [ath_typ] ASC, [ath_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [lesoptath_athtypck] CHECK ([ath_typ]=N'R' OR [ath_typ]=N'U')
);


GO
CREATE NONCLUSTERED INDEX [les_opt_ath_idx1]
    ON [dbo].[les_opt_ath]([ath_id] ASC, [ath_typ] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table allows authorization to be set up for an option by giving both users and roles permissions.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_opt_ath';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Points to an option in the les_mnu_opt table', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_opt_ath', @level2type = N'COLUMN', @level2name = N'opt_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines whether this authorization points to a user or a role.  R=Role, U=User', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_opt_ath', @level2type = N'COLUMN', @level2name = N'ath_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Depending on the ath_typ, this value points to a user or a role.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_opt_ath', @level2type = N'COLUMN', @level2name = N'ath_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A bit mapped permission mask.  This determines the level of access the user has to this option.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_opt_ath', @level2type = N'COLUMN', @level2name = N'pmsn_mask';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specifies which product group was responsible for loading this data row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'les_opt_ath', @level2type = N'COLUMN', @level2name = N'grp_nam';

