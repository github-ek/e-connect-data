CREATE PROCEDURE [dbo].[CrearSolicitudesEstandarDeTransporte]
AS
BEGIN TRY
    --CREACION DE LAS SOLICITUDES
    BEGIN
        INSERT INTO [$(eConnect)].dbo.solicitudes_transporte
            (id_solicitud
            ,id_tipo_ruta
            ,id_tipo_vehiculo

            ,id_ciudad_remitente
            ,ciudad_remitente_codigo_alterno
            ,direccion_remitente
            ,id_direccion_remitente
            ,id_punto_remitente
            ,punto_remitente_codigo_alterno
            ,punto_remitente_nombre
            ,requiere_cita_remitente
            ,fecha_cita_remitente
            ,hora_cita_minima_remitente
            ,hora_cita_maxima_remitente

            ,id_ciudad_destinatario
            ,ciudad_destinatario_codigo_alterno
            ,direccion_destinatario
            ,id_direccion_destinatario
            ,id_punto_destinatario
            ,punto_destinatario_codigo_alterno
            ,punto_destinatario_nombre
            ,requiere_cita_destinatario
            ,fecha_cita_destinatario
            ,hora_cita_minima_destinatario
            ,hora_cita_maxima_destinatario

            ,usuario_creacion
            ,fecha_creacion
            ,usuario_modificacion
            ,fecha_modificacion)
        SELECT
             a.id_solicitud
            ,b.id_tipo_ruta
            ,b.id_tipo_vehiculo

            ,b.id_ciudad_remitente
            ,b.ciudad_remitente_codigo_alterno
            ,b.direccion_remitente
            ,b.id_direccion_remitente
            ,b.id_punto_remitente
            ,b.punto_remitente_codigo_alterno
            ,b.punto_remitente_nombre
            ,b.requiere_cita_remitente
            ,b.fecha_cita_remitente
            ,b.hora_cita_minima_remitente
            ,b.hora_cita_maxima_remitente

            ,b.id_ciudad_destinatario
            ,b.ciudad_destinatario_codigo_alterno
            ,b.direccion_destinatario
            ,b.id_direccion_destinatario
            ,b.id_punto_destinatario
            ,b.punto_destinatario_codigo_alterno
            ,b.punto_destinatario_nombre
            ,b.requiere_cita_destinatario
            ,b.fecha_cita_destinatario
            ,b.hora_cita_minima_destinatario
            ,b.hora_cita_maxima_destinatario

            ,a.usuario_creacion
            ,a.fecha_creacion
            ,a.usuario_modificacion
            ,a.fecha_modificacion
        FROM #source a
        INNER JOIN #solicitudes_transporte b ON
            b.id_cliente = a.id_cliente
        AND b.numero_solicitud = a.numero_solicitud
        WHERE
            a.id_solicitud IS NOT NULL
        AND a.numero_linea = 1
    END
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE()
    ;THROW;
END CATCH