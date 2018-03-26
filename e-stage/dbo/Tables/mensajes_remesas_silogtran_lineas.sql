CREATE TABLE [dbo].[mensajes_remesas_silogtran_lineas] (
    [id]              BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_mensaje]      BIGINT        NOT NULL,
    [numero_linea]    INT           NOT NULL,
    [descripcion]     VARCHAR (300) NOT NULL,
    [producto_nombre] VARCHAR (50)  NOT NULL,
    [empaque_codigo]  VARCHAR (50)  NOT NULL,
    [cantidad]        INT           NOT NULL,
    [peso]            VARCHAR (20)  NOT NULL,
    [peso_bruto]      VARCHAR (20)  NOT NULL,
    [volumen]         VARCHAR (20)  NOT NULL,
    [valor_declarado] BIGINT        NOT NULL,
    CONSTRAINT [PK_mensajes_remesas_silogtran_lineas] PRIMARY KEY CLUSTERED ([id] ASC)
);

