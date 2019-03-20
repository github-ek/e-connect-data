CREATE TABLE [dbo].[tipos_archivo] (
    [id_tipo_archivo]       BIGINT        NOT NULL,
    [id_grupo_tipo_archivo] BIGINT        NOT NULL,
    [codigo]                VARCHAR (50)  NOT NULL,
    [nombre]                VARCHAR (100) NOT NULL,
    [descripcion]           VARCHAR (200) NOT NULL,
    [separador_registros]   VARCHAR (4)   NOT NULL,
    [separador_campos]      VARCHAR (4)   NOT NULL,
    [aplicacion]            VARCHAR (200) NULL,
    [ordinal]               INT           NOT NULL,
    [activo]                BIT           CONSTRAINT [DF__tipos_arc__activ__251C81ED] DEFAULT ((1)) NOT NULL,
    [version]               INT           CONSTRAINT [DF__tipos_arc__versi__2610A626] DEFAULT ((0)) NOT NULL,
    [usuario_creacion]      VARCHAR (50)  CONSTRAINT [DF__tipos_arc__usuar__2704CA5F] DEFAULT ('') NOT NULL,
    [fecha_creacion]        DATETIME2 (0) CONSTRAINT [DF__tipos_arc__fecha__27F8EE98] DEFAULT (sysdatetime()) NOT NULL,
    [usuario_modificacion]  VARCHAR (50)  CONSTRAINT [DF__tipos_arc__usuar__28ED12D1] DEFAULT ('') NOT NULL,
    [fecha_modificacion]    DATETIME2 (0) CONSTRAINT [DF__tipos_arc__fecha__29E1370A] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_tipos_archivo] PRIMARY KEY CLUSTERED ([id_tipo_archivo] ASC),
    CONSTRAINT [FK_tipo_archivo_grupos_tipo_archivo] FOREIGN KEY ([id_grupo_tipo_archivo]) REFERENCES [dbo].[grupos_tipo_archivo] ([id_grupo_tipo_archivo]),
    CONSTRAINT [UK_tipos_archivo_01] UNIQUE NONCLUSTERED ([codigo] ASC)
);



