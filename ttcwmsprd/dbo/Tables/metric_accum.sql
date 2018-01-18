CREATE TABLE [dbo].[metric_accum] (
    [metric_accum_id] NVARCHAR (20) NOT NULL,
    [cube_name]       NVARCHAR (50) NOT NULL,
    [site_id]         NVARCHAR (40) NOT NULL,
    [rqst_dt]         DATETIME      NOT NULL,
    CONSTRAINT [metric_accum_pk] PRIMARY KEY CLUSTERED ([metric_accum_id] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [metr_accum_metr]
    ON [dbo].[metric_accum]([cube_name] ASC, [rqst_dt] ASC, [site_id] ASC) WITH (FILLFACTOR = 90);

