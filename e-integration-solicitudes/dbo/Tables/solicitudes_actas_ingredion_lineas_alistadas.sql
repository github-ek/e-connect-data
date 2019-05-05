CREATE TABLE [dbo].[solicitudes_actas_ingredion_lineas_alistadas] (
    [id]                 BIGINT          IDENTITY (1, 1) NOT NULL,
    [id_solicitud_acta]  BIGINT          NOT NULL,
    [prtnum]             VARCHAR (50)    NOT NULL,
    [prtdsc]             VARCHAR (200)   NOT NULL,
    [orgcod]             VARCHAR (25)    NOT NULL,
    [invsts]             VARCHAR (4)     NOT NULL,
    [lotnum]             VARCHAR (25)    NOT NULL,
    [expire_dte]         DATETIME        NOT NULL,
    [untqty]             INT             NOT NULL,
    [untcas]             INT             NOT NULL,
    [empaques]           DECIMAL (23, 8) NOT NULL,
    [peso_empaques]      DECIMAL (23, 8) NULL,
    [volumen_empaques]   DECIMAL (23, 8) NULL,
    [id_producto]        BIGINT          NULL,
    [id_unidad_medida]   BIGINT          NULL,
    [id_bodega_virtual]  BIGINT          NULL,
    [version]            INT             CONSTRAINT [DF_solicitudes_actas_ingredion_lineas_alistadas_version] DEFAULT ((0)) NOT NULL,
    [fecha_creacion]     DATETIME2 (0)   CONSTRAINT [DF_solicitudes_actas_ingredion_lineas_alistadas_fecha_creacion] DEFAULT (sysdatetime()) NOT NULL,
    [fecha_modificacion] DATETIME2 (0)   CONSTRAINT [DF_solicitudes_actas_ingredion_lineas_alistadas_fecha_modificacion] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_solicitudes_actas_ingredion_lineas_alistadas] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_solicitudes_actas_ingredion_lineas_alistadas_solicitudes_actas_ingredion] FOREIGN KEY ([id_solicitud_acta]) REFERENCES [dbo].[solicitudes_actas_ingredion] ([id_solicitud_acta])
);

