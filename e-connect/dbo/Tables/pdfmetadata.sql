CREATE TABLE [dbo].[pdfmetadata] (
    [id]                    INT           NOT NULL,
    [id_Solicitud]          INT           NULL,
    [serie_documento]       VARCHAR (100) NULL,
    [numero_documento]      VARCHAR (100) NULL,
    [nombre_archivo]        VARCHAR (100) NULL,
    [ruta_archivo_completa] VARCHAR (100) NULL,
    [arg0]                  VARCHAR (100) NULL,
    [status]                VARCHAR (100) NULL,
    [archivo_creado]        VARCHAR (100) NULL,
    CONSTRAINT [pdf_metadata_PK] PRIMARY KEY CLUSTERED ([id] ASC)
);

