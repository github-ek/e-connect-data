CREATE TABLE [dbo].[cnfrm_bck_serv] (
    [cnfrm_serv_id] NVARCHAR (20) NOT NULL,
    [wh_id]         NVARCHAR (32) NOT NULL,
    [serv_id]       NVARCHAR (20) NOT NULL,
    [exitpnt]       NVARCHAR (15) NOT NULL,
    [srtseq]        INT           NOT NULL,
    [ship_id]       NVARCHAR (30) NULL,
    [lodnum]        NVARCHAR (30) NULL,
    [subnum]        NVARCHAR (30) NULL,
    [dtlnum]        NVARCHAR (30) NULL,
    [prtnum]        NVARCHAR (50) NULL,
    [prt_client_id] NVARCHAR (32) NULL,
    [untqty]        INT           NOT NULL,
    [srcare]        NVARCHAR (10) NULL,
    [dstare]        NVARCHAR (10) NULL,
    [crtnid]        NVARCHAR (30) NULL,
    [trlr_id]       NVARCHAR (20) NULL,
    [track_num]     NVARCHAR (20) NULL,
    [stop_id]       NVARCHAR (10) NULL,
    [moddte]        DATETIME      NULL,
    [mod_usr_id]    NVARCHAR (40) NULL,
    CONSTRAINT [cnfrm_bck_serv_pk] PRIMARY KEY CLUSTERED ([cnfrm_serv_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to log a history of background services as they are completed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Confirm Service ID - unique Base 36 system-generated sequence to identify a service confirmation record.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'cnfrm_serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'serv_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Exit Point - determines when this service is required during the background process.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'exitpnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort Sequence', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'srtseq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ship ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'ship_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Load Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'lodnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Subload/Kit Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'subnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Detail Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'dtlnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'prtnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Item Client ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'prt_client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'untqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source Area Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'srcare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Destination Area Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'dstare';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Carton ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'crtnid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trailer ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'trlr_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tracking Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'track_num';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stop ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'stop_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'cnfrm_bck_serv', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

