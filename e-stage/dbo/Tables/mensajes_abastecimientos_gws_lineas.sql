CREATE TABLE [dbo].[mensajes_abastecimientos_gws_lineas] (
    [id_mensaje]     BIGINT        NOT NULL,
    [numero_linea]   INT           NOT NULL,
    [LineNum]        INT           NOT NULL,
    [ItemCode]       VARCHAR (50)  NOT NULL,
    [Quantity]       INT           NOT NULL,
    [U_VuCadena]     VARCHAR (50)  NOT NULL,
    [U_VIcoCadena]   VARCHAR (50)  NOT NULL,
    [WarehouseCode]  VARCHAR (50)  NOT NULL,
    [ProjectCode]    VARCHAR (50)  NOT NULL,
    [U_Comentariosl] VARCHAR (150) NOT NULL,
    CONSTRAINT [PK_mensajes_abastecimientos_gws_lineas] PRIMARY KEY CLUSTERED ([id_mensaje] ASC, [numero_linea] ASC),
    CONSTRAINT [FK_mensajes_abastecimientos_gws_lineas_mensajes_abastecimientos_gws] FOREIGN KEY ([id_mensaje]) REFERENCES [dbo].[mensajes_abastecimientos_gws] ([id_mensaje])
);

