CREATE TABLE [logs].[productos_codigos]
(
    [id_log]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [id]                 BIGINT         NOT NULL,
    [operacion]          NVARCHAR (1) NOT NULL,
    [cambio_notificado]  BIT NOT NULL,
    [fecha_creacion]     DATETIME       NOT NULL,
    [fecha_modificacion] DATETIME       NOT NULL,

    [prt_client_id]     NVARCHAR (32) NOT NULL,
    [prtnum]            NVARCHAR (50) NOT NULL,
    [alt_prtnum]        NVARCHAR (50) NOT NULL,
    [alt_prt_typ]       NVARCHAR (20)    NOT NULL,
    [last_upd_dt]       DATETIME        NOT NULL,
    [last_upd_user_id]  NVARCHAR (40)   NOT NULL,
    CONSTRAINT [PK_productos_codigos] PRIMARY KEY CLUSTERED ([id_log] ASC)
)
