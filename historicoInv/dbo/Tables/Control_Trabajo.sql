CREATE TABLE [dbo].[control_trabajo] (
    [almacen]          NVARCHAR (32)   NULL,
    [cod_operacion]    NVARCHAR (2000) NULL,
    [estacion_trabajo] NVARCHAR (2000) NULL,
    [id_lista]         NVARCHAR (15)   NULL,
    [nro_ola]          NVARCHAR (32)   NULL,
    [usuario_asig]     NVARCHAR (40)   NULL,
    [usuario_recon]    NVARCHAR (40)   NULL,
    [zona]             NVARCHAR (10)   NULL,
    [ubicacion]        NVARCHAR (20)   NULL,
    [cliente]          NVARCHAR (32)   NULL,
    [fecha_add]        DATETIME        NULL
);

