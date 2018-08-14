CREATE TABLE [dbo].[alistamientos] (
    [id_alistamiento]      BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_externo]           VARCHAR (200) NOT NULL,
    [client_id]            VARCHAR (32)  NOT NULL,
    [ordnum]               VARCHAR (35)  NOT NULL,
    [wh_id]                VARCHAR (32)  NOT NULL,
    [id_cliente]           BIGINT        NULL,
    [id_solicitud]         BIGINT        NULL,
    [id_bodega]            BIGINT        NULL,
    [estado]               VARCHAR (50)  NOT NULL,
    [version]              INT           CONSTRAINT [DF__alistamie__versi__5224328E] DEFAULT ((0)) NOT NULL,
    [usuario_creacion]     VARCHAR (50)  NOT NULL,
    [fecha_creacion]       DATETIME2 (0) NOT NULL,
    [usuario_modificacion] VARCHAR (50)  NOT NULL,
    [fecha_modificacion]   DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_alistamientos] PRIMARY KEY CLUSTERED ([id_alistamiento] ASC),
    CONSTRAINT [UK_alistamientos_01] UNIQUE NONCLUSTERED ([id_externo] ASC)
);


GO
CREATE NONCLUSTERED INDEX [UK_alistamientos_02]
    ON [dbo].[alistamientos]([client_id] ASC, [ordnum] ASC, [wh_id] ASC);

