CREATE TABLE [dbo].[mensajes_abastecimientos_gws] (
    [id_mensaje]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [id_orden_recibo]   BIGINT        NOT NULL,
    [estado]                    VARCHAR(50)   NOT NULL,
    [fecha_envio]               DATETIME2(0)   NULL,
    [fecha_confirmacion_envio]  DATETIME2(0)   NULL,

    [DocDate]       [varchar](10) NULL,
	[DueDate]       [varchar](10) NOT NULL,
	[CardCode]      [varchar](20) NOT NULL,
	[Series]        [varchar](20) NOT NULL,
	[FromWarehouse] [varchar](50) NOT NULL,
	[TaxDate]       [varchar](10) NULL,
	[Address]       [varchar](150) NOT NULL,
	[Comments]      [varchar](150) NOT NULL,
	[DocObjectCode] [int] NOT NULL,
	[U_BKV_UID]     [varchar](20) NOT NULL, 
	[U_GW_Fecha1]   [varchar](10) NOT NULL,
	[U_GW_Fecha2]   [varchar](10) NOT NULL,
	[U_Ocompra]     [varchar](50) NOT NULL,
	[U_GW_PRE_DOC_ORG] [varchar](20) NOT NULL,
	[U_GW_NU_DOC_ORG] [varchar](50) NOT NULL,
	[U_GW_PRE_DOC_ANT] [varchar](20) NOT NULL,
	[U_GW_NU_DOC_ANT] [varchar](50) NOT NULL,

    [version]                  INT           NOT NULL DEFAULT 0,
    [usuario_creacion]         VARCHAR (50)  NOT NULL,
    [fecha_creacion]           DATETIME2 (0) NOT NULL,
    [usuario_modificacion]     VARCHAR (50)  NOT NULL,
    [fecha_modificacion]       DATETIME2 (0) NOT NULL, 
    
    CONSTRAINT [PK_mensajes_abastecimientos_gws] PRIMARY KEY CLUSTERED ([id_mensaje] ASC) WITH (FILLFACTOR = 80), 
    CONSTRAINT [FK_mensajes_abastecimientos_gws_ordenes_recibo] FOREIGN KEY ([id_orden_recibo]) REFERENCES [ordenes_recibo]([id_orden_recibo])
);

