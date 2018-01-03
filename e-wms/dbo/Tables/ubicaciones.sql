CREATE TABLE [dbo].[ubicaciones] (
    [id]                 BIGINT        NOT NULL,
    [operacion]          NVARCHAR (50) NOT NULL,
    [fecha_creacion]     DATETIME      NOT NULL,
    [fecha_modificacion] DATETIME      NOT NULL,
    [id_bodega]          BIGINT        NOT NULL,
    [wh_id]              NVARCHAR (32) NOT NULL,
    [arecod]             NVARCHAR (10) NOT NULL,
    [stoloc]             NVARCHAR (20) NOT NULL,
    [wrkzon]             NVARCHAR (20) NOT NULL,
    [last_upd_dt]        DATETIME      NULL,
    [last_upd_user_id]   NVARCHAR (40) NULL,
    [activo]             AS            (CONVERT([bit],case when [operacion]='D' then (0) else (1) end)),
    CONSTRAINT [PK_ubicaciones] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_ubicaciones_01] UNIQUE NONCLUSTERED ([wh_id] ASC, [arecod] ASC, [stoloc] ASC)
);


GO
CREATE NONCLUSTERED INDEX [UK_ubicaciones_02]
    ON [dbo].[ubicaciones]([wh_id] ASC, [stoloc] ASC);

