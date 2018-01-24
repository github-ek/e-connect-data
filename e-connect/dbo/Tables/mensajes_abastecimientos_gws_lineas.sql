CREATE TABLE [dbo].[mensajes_abastecimientos_gws_lineas]
(
    [id_mensaje]   BIGINT        NOT NULL,
    [numero_linea]          INT           NOT NULL,

    [LineNum]               INT           NOT NULL,
	[ItemCode]              [varchar](50) NOT NULL,
	[Quantity]              [int] NOT NULL,
	[U_VuCadena]            [varchar](50) NOT NULL,
	[U_VIcoCadena]          [varchar](50) NOT NULL,
	[WarehouseCode]         [varchar](50) NOT NULL,
	[ProjectCode]           [varchar](50) NOT NULL,
	[U_Comentariosl]        [varchar](150) NOT NULL,

    CONSTRAINT [PK_mensajes_abastecimientos_gws_lineas] PRIMARY KEY ([id_mensaje], [numero_linea]),
    CONSTRAINT [FK_mensajes_abastecimientos_gws_lineas_mensajes_abastecimientos_gws] FOREIGN KEY ([id_mensaje]) REFERENCES [mensajes_abastecimientos_gws]([id_mensaje]), 
)
