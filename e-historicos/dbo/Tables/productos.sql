CREATE TABLE [dbo].[productos] (
    [id]                 BIGINT  NOT NULL,
    [operacion]          NVARCHAR (1) NOT NULL,
    [cambio_notificado]  BIT NOT NULL DEFAULT 0,
    [fecha_creacion]     DATETIME       NOT NULL,
    [fecha_modificacion] DATETIME       NOT NULL,

    [prt_client_id]     NVARCHAR (32) NOT NULL,
    [prtnum]        NVARCHAR (50) NOT NULL,
    [lngdsc]        NVARCHAR (200) NOT NULL,
    [dept_cod]   NVARCHAR (5) NOT NULL,
    [moddte]               DATETIME        NOT NULL,
    [mod_usr_id]           NVARCHAR (40)   NOT NULL,
    CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_productos_01] UNIQUE NONCLUSTERED ([prt_client_id],[prtnum])
);

