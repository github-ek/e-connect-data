CREATE TABLE [dbo].[sercmp] (
    [subnum]        NVARCHAR (30) NOT NULL,
    [dtlnum]        NVARCHAR (30) NOT NULL,
    [wh_id]         NVARCHAR (32) NULL,
    [wkonum]        NVARCHAR (20) NOT NULL,
    [client_id]     NVARCHAR (32) NOT NULL,
    [wkorev]        NVARCHAR (10) NOT NULL,
    [wkolin]        NVARCHAR (10) NOT NULL,
    [prtnum]        NVARCHAR (50) NOT NULL,
    [prt_client_id] NVARCHAR (32) NOT NULL,
    [untqty]        INT           NULL,
    CONSTRAINT [sercmp_pk] PRIMARY KEY CLUSTERED ([subnum] ASC, [dtlnum] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [sercmp_wko_key]
    ON [dbo].[sercmp]([wkonum] ASC, [wkorev] ASC, [wkolin] ASC, [client_id] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Temporarily maintains serial numbers for subload or detail tracked component inventory that has been delivered to a production line and is available for consumption into a finished top level item. Used for validation of available component inventory. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sercmp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Only necessary if component is tracked at the detail level. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sercmp', @level2type = N'COLUMN', @level2name = N'dtlnum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID - the warehouse in which a serialized component is kept.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sercmp', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the item number of the component being used.  ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sercmp', @level2type = N'COLUMN', @level2name = N'wkonum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Client id of item number.  In non-3PL systems, this will be set to a default of ''----''.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sercmp', @level2type = N'COLUMN', @level2name = N'prt_client_id';

