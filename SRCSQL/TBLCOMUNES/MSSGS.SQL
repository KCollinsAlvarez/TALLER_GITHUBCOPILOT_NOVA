--======================================================================
-- Nombre de la Tabla : MSSGS - MENSAJES_ERRORES
--
-- DESCRIPCIÓN:
-- Archivo maestro de mensajes de errores del sistema. Registra los
-- mensajes de error, advertencia y notificación utilizados en los
-- procesos operativos de la aplicación.
--
-- Objetivo:
-- Centralizar la definición de mensajes de error y permitir la
-- gestión estandarizada de comunicaciones del sistema.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Mantenimiento manual por administradores del sistema.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte a procesos que requieren mensajes de error estandarizados.
--
-- Restricciones:
-- ESTADO_REGISTRO solo A o I; auditoría con valores por defecto.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-04
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE MSSGS (
    ID_MENSAJE FOR COLUMN IDMSG BIGINT
                    NOT NULL GENERATED ALWAYS AS IDENTITY,

    CODIGO_MENSAJE FOR COLUMN CODMSG VARCHAR(20)
                        NOT NULL,

    DESCRIP_MENSAJE FOR COLUMN DESMSG VARCHAR(120)
                        NOT NULL DEFAULT '',

    VALOR_TEXTO FOR COLUMN VALTXT VARCHAR(50)
                        NOT NULL DEFAULT '',

    VALOR_NUMERICO FOR COLUMN VALNUM DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,

    VIGENCIA_DESDE FOR COLUMN VIGDED DATE
                        NOT NULL DEFAULT '0001-01-01',

    VIGENCIA_HASTA FOR COLUMN VIGHAS DATE
                        NOT NULL DEFAULT '0001-01-01',

    ORDEN_VISUALIZACION FOR COLUMN ORDVIZ INTEGER
                        NOT NULL DEFAULT 0,

    USUARIO_INGRESO FOR COLUMN USRING VARCHAR(18)
                        NOT NULL DEFAULT USER,

    USUARIO_ACTUALIZA FOR COLUMN USRACT VARCHAR(18)
                        NOT NULL DEFAULT USER,

    VERSION_REGISTRO FOR COLUMN VERREG INTEGER
                        NOT NULL DEFAULT 1,

    OBSERVACIONES FOR COLUMN OBSREG VARCHAR(120)
                        NOT NULL DEFAULT '',

    ESTADO_REGISTRO FOR COLUMN ESTREG CHAR(1)
                        NOT NULL DEFAULT 'A',

    FECHA_INGRESO FOR COLUMN FECING TIMESTAMP
                        NOT NULL WITH DEFAULT,

    FECHA_ACTUALIZA FOR COLUMN FECACT TIMESTAMP
                        NOT NULL WITH DEFAULT,

    CONSTRAINT MSSGS_PK PRIMARY KEY (IDMSG),

    CONSTRAINT MSSGS_ESTREG_CST CHECK (ESTREG IN ('A','I'))

) RCDFMT RMSGGS;

RENAME TABLE MSSGS
TO MENSAJES_ERRORES
FOR SYSTEM NAME MSSGS;

--======================================================================
-- Comentarios
--======================================================================

COMMENT ON TABLE MSSGS IS
'MENSAJES_ERRORES';

COMMENT ON COLUMN MSSGS.IDMSG IS
'Identificador único técnico generado automáticamente para el registro.';

COMMENT ON COLUMN MSSGS.CODMSG IS
'Código identificador del mensaje de error en el sistema.';

COMMENT ON COLUMN MSSGS.DESMSG IS
'Descripción funcional del mensaje de error a mostrar al usuario.';

COMMENT ON COLUMN MSSGS.VALTXT IS
'Valor textual adicional asociado al mensaje.';

COMMENT ON COLUMN MSSGS.VALNUM IS
'Valor numérico adicional asociado al mensaje.';

COMMENT ON COLUMN MSSGS.VIGDED IS
'Fecha desde la cual el mensaje es vigente en el sistema.';

COMMENT ON COLUMN MSSGS.VIGHAS IS
'Fecha hasta la cual el mensaje es vigente en el sistema.';

COMMENT ON COLUMN MSSGS.ORDVIZ IS
'Orden de visualización o prioridad en listados y reportes.';

COMMENT ON COLUMN MSSGS.USRING IS
'Usuario que creó el registro de mensaje.';

COMMENT ON COLUMN MSSGS.USRACT IS
'Usuario que actualizó por última vez el registro.';

COMMENT ON COLUMN MSSGS.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN MSSGS.OBSREG IS
'Observaciones adicionales sobre el mensaje de error.';

COMMENT ON COLUMN MSSGS.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';

COMMENT ON COLUMN MSSGS.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN MSSGS.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================

LABEL ON TABLE MSSGS IS 'MENSAJES_ERRORES';

LABEL ON COLUMN MSSGS.IDMSG IS 'ID Mensaje';

LABEL ON COLUMN MSSGS.CODMSG IS 'Código Mensaje';

LABEL ON COLUMN MSSGS.DESMSG IS 'Descripción';

LABEL ON COLUMN MSSGS.VALTXT IS 'Valor Texto';

LABEL ON COLUMN MSSGS.VALNUM IS 'Valor Numérico';

LABEL ON COLUMN MSSGS.VIGDED IS 'Vigencia Desde';

LABEL ON COLUMN MSSGS.VIGHAS IS 'Vigencia Hasta';

LABEL ON COLUMN MSSGS.ORDVIZ IS 'Orden Visualización';

LABEL ON COLUMN MSSGS.USRING IS 'Usuario creación';

LABEL ON COLUMN MSSGS.USRACT IS 'Usuario actualización';

LABEL ON COLUMN MSSGS.VERREG IS 'Versión del registro';

LABEL ON COLUMN MSSGS.OBSREG IS 'Observaciones';

LABEL ON COLUMN MSSGS.ESTREG IS 'Estado del registro';

LABEL ON COLUMN MSSGS.FECING IS 'Fecha creación';

LABEL ON COLUMN MSSGS.FECACT IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================

LABEL ON COLUMN MSSGS.IDMSG TEXT IS 'ID Mensaje';

LABEL ON COLUMN MSSGS.CODMSG TEXT IS 'Código Mensaje';

LABEL ON COLUMN MSSGS.DESMSG TEXT IS 'Descripción';

LABEL ON COLUMN MSSGS.VALTXT TEXT IS 'Valor Texto';

LABEL ON COLUMN MSSGS.VALNUM TEXT IS 'Valor Numérico';

LABEL ON COLUMN MSSGS.VIGDED TEXT IS 'Vigencia Desde';

LABEL ON COLUMN MSSGS.VIGHAS TEXT IS 'Vigencia Hasta';

LABEL ON COLUMN MSSGS.ORDVIZ TEXT IS 'Orden Visualización';

LABEL ON COLUMN MSSGS.USRING TEXT IS 'Usuario creación';

LABEL ON COLUMN MSSGS.USRACT TEXT IS 'Usuario actualización';

LABEL ON COLUMN MSSGS.VERREG TEXT IS 'Versión del registro';

LABEL ON COLUMN MSSGS.OBSREG TEXT IS 'Observaciones';

LABEL ON COLUMN MSSGS.ESTREG TEXT IS 'Estado del registro';

LABEL ON COLUMN MSSGS.FECING TEXT IS 'Fecha creación';

LABEL ON COLUMN MSSGS.FECACT TEXT IS 'Fecha actualización';