CREATE TABLE [app].[Mensajes] (
    [Id_Aplicacion]         VARCHAR (20)    NOT NULL,
    [Id_Mensaje]            INT             NOT NULL,
    [Id_Lenguaje]           VARCHAR (10)    NOT NULL,
    [Mensaje]               NVARCHAR (1000) NOT NULL,
    [Activo]                BIT             NOT NULL,
    [Fecha_Actualizacion]   DATETIME2 (0)   NOT NULL,
    [Usuario_Actualizacion] VARCHAR (50)    NOT NULL,
    CONSTRAINT [PK_Mensajes] PRIMARY KEY CLUSTERED ([Id_Aplicacion] ASC, [Id_Mensaje] ASC, [Id_Lenguaje] ASC)
);

