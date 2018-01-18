CREATE TABLE [dbo].[ord_line_ins] (
    [client_id] NVARCHAR (32) NOT NULL,
    [ordnum]    NVARCHAR (35) NOT NULL,
    [ordlin]    NVARCHAR (10) NOT NULL,
    [ordsln]    NVARCHAR (10) NOT NULL,
    [inskey]    NVARCHAR (30) NOT NULL,
    CONSTRAINT [ord_line_ins_pk] PRIMARY KEY CLUSTERED ([ordnum] ASC, [ordlin] ASC, [ordsln] ASC, [inskey] ASC, [client_id] ASC) WITH (FILLFACTOR = 90)
);

