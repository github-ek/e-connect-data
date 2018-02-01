CREATE TABLE [dbo].[productos_codigos] (
    [id]                 BIGINT IDENTITY (1, 1) NOT NULL,
    [operacion]          NVARCHAR (1) NOT NULL,
    [cambio_notificado]  BIT NOT NULL DEFAULT 0,
    [fecha_creacion]     DATETIME       NOT NULL,
    [fecha_modificacion] DATETIME       NOT NULL,

    [prt_client_id]     NVARCHAR (32) NOT NULL,
    [prtnum]            NVARCHAR (50) NOT NULL,
    [alt_prtnum]        NVARCHAR (50) NOT NULL,
    [alt_prt_typ]       NVARCHAR (20)    NOT NULL,
    [last_upd_dt]       DATETIME        NOT NULL,
    [last_upd_user_id]  NVARCHAR (40)   NOT NULL,
    CONSTRAINT [PK_productos_codigos] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_productos_codigos_01] UNIQUE NONCLUSTERED ([prt_client_id],[prtnum],[alt_prtnum],[alt_prt_typ])
);

