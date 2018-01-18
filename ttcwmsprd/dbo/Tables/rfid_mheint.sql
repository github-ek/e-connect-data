CREATE TABLE [dbo].[rfid_mheint] (
    [contnr_id]  NVARCHAR (30)  NOT NULL,
    [tag_id]     NVARCHAR (30)  NOT NULL,
    [client_id]  NVARCHAR (32)  NULL,
    [wms_lpn]    NVARCHAR (30)  NULL,
    [prcsts]     NVARCHAR (1)   NULL,
    [tagsts]     NVARCHAR (1)   NULL,
    [upccod]     NVARCHAR (20)  NULL,
    [gtin]       NVARCHAR (24)  NULL,
    [line_id]    NVARCHAR (20)  NULL,
    [prtnum]     NVARCHAR (50)  NULL,
    [prtdsc]     NVARCHAR (250) NULL,
    [credte]     DATETIME       NULL,
    [aggdte]     NVARCHAR (17)  NULL,
    [badlbl_cnt] INT            NULL,
    [lbl_xcoord] FLOAT (53)     NULL,
    [lbl_ycoord] FLOAT (53)     NULL,
    [lbl_zcoord] FLOAT (53)     NULL,
    [lbl_filnam] NVARCHAR (512) NULL,
    CONSTRAINT [rfid_mheint_pk] PRIMARY KEY CLUSTERED ([contnr_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [rf_mheint_c_g_l]
    ON [dbo].[rfid_mheint]([gtin] ASC, [line_id] ASC, [client_id] ASC) WITH (FILLFACTOR = 90);


GO
CREATE UNIQUE NONCLUSTERED INDEX [rfid_mheint_tag_id]
    ON [dbo].[rfid_mheint]([tag_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The RFID Material Handling Interface table is a shared table between RP systems and the MHE system to exchange tag information.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The container ID - usually the same as the Tag Id.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint', @level2type = N'COLUMN', @level2name = N'contnr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The tag id of this container.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint', @level2type = N'COLUMN', @level2name = N'tag_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Client ID of this container.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The WMS LPN identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint', @level2type = N'COLUMN', @level2name = N'wms_lpn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Processing Status.  NULL means unprocessed, other status(s) TBD.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint', @level2type = N'COLUMN', @level2name = N'prcsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tag Status.  NULL means unprocessed, other status(s) TBD.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint', @level2type = N'COLUMN', @level2name = N'tagsts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UPCCOD identifying the product.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint', @level2type = N'COLUMN', @level2name = N'upccod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Global Trade Item Number (GTIN) for this item.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint', @level2type = N'COLUMN', @level2name = N'gtin';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Line_id indicating the production line or MHE identifier.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint', @level2type = N'COLUMN', @level2name = N'line_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number or Item code of the product.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number Description.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint', @level2type = N'COLUMN', @level2name = N'prtdsc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Creation Date.  Date that record was written to table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint', @level2type = N'COLUMN', @level2name = N'credte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Aggregation Date. Date that cases are aggragated to the load.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint', @level2type = N'COLUMN', @level2name = N'aggdte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bad Label Count. Number of bad labels before a good label was applied.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint', @level2type = N'COLUMN', @level2name = N'badlbl_cnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Label application X coordinate.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint', @level2type = N'COLUMN', @level2name = N'lbl_xcoord';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Label application Y coordinate.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint', @level2type = N'COLUMN', @level2name = N'lbl_ycoord';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Label application Z coordinate.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint', @level2type = N'COLUMN', @level2name = N'lbl_zcoord';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Label filename, when igniter has produced a label for a tag it will put the filename in the interface table that is associated with that tag ID.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rfid_mheint', @level2type = N'COLUMN', @level2name = N'lbl_filnam';

