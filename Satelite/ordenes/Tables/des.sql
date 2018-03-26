CREATE TABLE [crm].[destinatarios_remitentes](
	[id_destinatario_remitente] [int] IDENTITY(1,1) NOT NULL,
	[activo] [bit] NULL,
	[id_segmento] [int] NULL,
	[id_cliente] [int] NULL,
	[codigo] [varchar](20) NULL,
	[contacto_email] [varchar](100) NULL,
	[contacto_nombres] [varchar](100) NULL,
	[contacto_telefonos] [varchar](50) NULL,
	[digito_verificacion] [varchar](1) NULL,
	[id_ciudad] [int] NULL,
	[direccion] [varchar](150) NULL,
	[direccion_estandarizada] [varchar](150) NULL,
	[indicaciones_direccion] [varchar](150) NULL,
	[latitud] [numeric](18, 15) NULL,
	[longitud] [numeric](18, 15) NULL,
	[fecha_actualizacion] [datetime2](0) NULL,
	[identificacion_type] [varchar](2) NULL,
	[nombre] [varchar](100) NULL,
	[nombre_comercial] [varchar](100) NULL,
	[numero_identificacion] [varchar](20) NULL,
	[usuario_actualizacion] [varchar](50) NULL,
 CONSTRAINT [PK_destinatarios_remitentes] PRIMARY KEY CLUSTERED 
(
	[id_destinatario_remitente] ASC
))