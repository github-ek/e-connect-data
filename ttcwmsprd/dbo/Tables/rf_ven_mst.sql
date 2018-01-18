CREATE TABLE [dbo].[rf_ven_mst] (
    [rf_ven_nam]       NVARCHAR (10) NOT NULL,
    [rf_ven_inq]       NVARCHAR (50) NOT NULL,
    [rf_ven_resp]      NVARCHAR (50) NOT NULL,
    [rf_ven_resp_time] INT           NOT NULL,
    [ins_dt]           DATETIME      NULL,
    [last_upd_dt]      DATETIME      NULL,
    [ins_user_id]      NVARCHAR (40) NULL,
    [last_upd_user_id] NVARCHAR (40) NULL,
    CONSTRAINT [rf_ven_mst_pk] PRIMARY KEY CLUSTERED ([rf_ven_nam] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table contains vendor terminal query information for the MTF enviornment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_ven_mst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the vendor who manufactures the RF devices.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_ven_mst', @level2type = N'COLUMN', @level2name = N'rf_ven_nam';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inquiry string to send to terminal (i.e. ''\005'' can be a control sequence).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_ven_mst', @level2type = N'COLUMN', @level2name = N'rf_ven_inq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Regular expression defining the format the terminal''s response is in. This is used to parse the response to obtain only the terminal number.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_ven_mst', @level2type = N'COLUMN', @level2name = N'rf_ven_resp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time to wait in milliseconds for terminal to answerback with the terminal ID value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_ven_mst', @level2type = N'COLUMN', @level2name = N'rf_ven_resp_time';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_ven_mst', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_ven_mst', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_ven_mst', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'rf_ven_mst', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';

