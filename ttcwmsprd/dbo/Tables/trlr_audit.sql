CREATE TABLE [dbo].[trlr_audit] (
    [trlr_id]  NVARCHAR (20) NOT NULL,
    [trlr_num] NVARCHAR (20) NULL,
    [carcod]   NVARCHAR (10) NULL,
    [yard_loc] NVARCHAR (20) NULL,
    [wh_id]    NVARCHAR (32) NULL,
    CONSTRAINT [trlr_audit_pk] PRIMARY KEY CLUSTERED ([trlr_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Trailer Audit table is used to log trailer audit.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_audit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique identifier for the trailer in the system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_audit', @level2type = N'COLUMN', @level2name = N'trlr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User identification for the trailer.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_audit', @level2type = N'COLUMN', @level2name = N'trlr_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carrier for which this trailer transports inventory. A carrier code is only required for Shipping trailers, but may be applied to Receiving trailers.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_audit', @level2type = N'COLUMN', @level2name = N'carcod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Dock or yard location where the trailer is physically located.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_audit', @level2type = N'COLUMN', @level2name = N'yard_loc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The ID of the warehouse.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'trlr_audit', @level2type = N'COLUMN', @level2name = N'wh_id';

