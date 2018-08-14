CREATE TABLE [dbo].[campos] (
    [id_campo]                           BIGINT          IDENTITY (1, 1) NOT NULL,
    [id_tipo_archivo]                    BIGINT          NOT NULL,
    [ordinal]                            INT             NOT NULL,
    [codigo]                             VARCHAR (50)    NOT NULL,
    [nombre]                             VARCHAR (100)   NOT NULL,
    [descripcion]                        VARCHAR (200)   CONSTRAINT [DF_campos_descripcion] DEFAULT ('') NOT NULL,
    [tipo_dato]                          VARCHAR (50)    NOT NULL,
    [numero_caracteres]                  INT             NOT NULL,
    [truncar_caracteres]                 BIT             NOT NULL,
    [ignorar]                            BIT             NOT NULL,
    [incluir]                            BIT             NOT NULL,
    [obligatorio_estructura]             BIT             NOT NULL,
    [ordinal_transformacion]             INT             NULL,
    [obligatorio_validacion]             BIT             NOT NULL,
    [id_mapa]                            BIGINT          NULL,
    [valor_predeterminado]               VARCHAR (200)   CONSTRAINT [DF_campos_valor_predeterminado] DEFAULT ('') NOT NULL,
    [formato]                            VARCHAR (50)    NOT NULL,
    [formato_numerico_separador_decimal] VARCHAR (1)     CONSTRAINT [DF_campos_formato_numerico_separador_decimal] DEFAULT ('') NOT NULL,
    [formato_numerico_separador_grupo]   VARCHAR (1)     CONSTRAINT [DF_campos_formato_numerico_separador_grupo] DEFAULT ('') NOT NULL,
    [expresion_regular]                  VARCHAR (50)    CONSTRAINT [DF_campos_expresion_regular] DEFAULT ('') NOT NULL,
    [valores_permitidos]                 VARCHAR (500)   CONSTRAINT [DF_campos_valores_permitidos] DEFAULT ('') NOT NULL,
    [valor_entero_min]                   BIGINT          NULL,
    [valor_entero_max]                   BIGINT          NULL,
    [valor_decimal_min]                  DECIMAL (12, 4) NULL,
    [valor_decimal_max]                  DECIMAL (12, 4) NULL,
    [valor_fecha_min]                    DATETIME2 (0)   NULL,
    [valor_fecha_max]                    DATETIME2 (0)   NULL,
    [valor_hora_min]                     TIME (0)        NULL,
    [valor_hora_max]                     TIME (0)        NULL,
    [activo]                             BIT             DEFAULT ((1)) NOT NULL,
    [version]                            INT             DEFAULT ((0)) NOT NULL,
    [usuario_creacion]                   VARCHAR (50)    DEFAULT ('') NOT NULL,
    [fecha_creacion]                     DATETIME2 (0)   DEFAULT (sysdatetime()) NOT NULL,
    [usuario_modificacion]               VARCHAR (50)    DEFAULT ('') NOT NULL,
    [fecha_modificacion]                 DATETIME2 (0)   DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_campos] PRIMARY KEY CLUSTERED ([id_campo] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_campos_mapas] FOREIGN KEY ([id_mapa]) REFERENCES [dbo].[mapas] ([id_mapa]),
    CONSTRAINT [FK_campos_tipos_archivo] FOREIGN KEY ([id_tipo_archivo]) REFERENCES [dbo].[tipos_archivo] ([id_tipo_archivo]),
    CONSTRAINT [UK_campos_01] UNIQUE NONCLUSTERED ([id_tipo_archivo] ASC, [codigo] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [UK_campos_02] UNIQUE NONCLUSTERED ([id_tipo_archivo] ASC, [ordinal] ASC) WITH (FILLFACTOR = 80)
);







