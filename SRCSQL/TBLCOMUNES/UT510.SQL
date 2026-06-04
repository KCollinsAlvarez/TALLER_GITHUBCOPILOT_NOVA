--======================================================================
-- Nombre de la Tabla : UT510 - MENSAJES_USUARIOS
--
-- DESCRIPCIÓN:
-- Archivo de mensajes para usuarios. Registra los mensajes del
-- sistema, notificaciones, alertas e información dirigida a usuarios
-- para comunicación y conocimiento de eventos.
--
-- Objetivo:
-- Centralizar la gestión de mensajes del sistema dirigidos a usuarios
-- permitiendo seguimiento y gestión de comunicaciones.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Generado automáticamente por procesos del sistema o ingreso manual
-- por administradores.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte a procesos de comunicación del sistema, alertas y
-- notificaciones dirigidas a usuarios.
--
-- Restricciones:
-- PK compuesta; ESTADO_REGISTRO solo A o I; auditoría con valores
-- por defecto.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-04
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE UT510 (
    CODIGO_USUARIO FOR COLUMN CODUSR VARCHAR(20)
                        NOT NULL,

    FECHA_MENSAJE FOR COLUMN FECMSG DATE
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

    CONSTRAINT UT510_PK PRIMARY KEY (CODUSR, FECMSG),

    CONSTRAINT UT510_ESTREG_CST CHECK (ESTREG IN ('A','I'))

) RCDFMT RUT510;

RENAME TABLE UT510
TO MENSAJES_USUARIOS
FOR SYSTEM NAME UT510;

--======================================================================
-- Comentarios
--======================================================================

COMMENT ON TABLE UT510 IS
'MENSAJES_USUARIOS';

COMMENT ON COLUMN UT510.CODUSR IS
'Código identificador único del usuario destinatario del mensaje.';

COMMENT ON COLUMN UT510.FECMSG IS
'Fecha en que fue creado o dirigido el mensaje al usuario.';

COMMENT ON COLUMN UT510.DESMSG IS
'Descripción adicional funcional del mensaje.';

COMMENT ON COLUMN UT510.VALTXT IS
'Valor textual adicional asociado al mensaje.';

COMMENT ON COLUMN UT510.VALNUM IS
'Valor numérico adicional asociado al mensaje.';

COMMENT ON COLUMN UT510.VIGDED IS
'Fecha desde la cual el mensaje es vigente.';

COMMENT ON COLUMN UT510.VIGHAS IS
'Fecha hasta la cual el mensaje es vigente.';

COMMENT ON COLUMN UT510.ORDVIZ IS
'Orden de visualización o prioridad en listados.';

COMMENT ON COLUMN UT510.USRING IS
'Usuario que creó el registro de mensaje.';

COMMENT ON COLUMN UT510.USRACT IS
'Usuario que actualizó por última vez el registro.';

COMMENT ON COLUMN UT510.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN UT510.OBSREG IS
'Observaciones adicionales sobre el mensaje.';

COMMENT ON COLUMN UT510.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';

COMMENT ON COLUMN UT510.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN UT510.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================

LABEL ON TABLE UT510 IS 'MENSAJES_USUARIOS';

LABEL ON COLUMN UT510.CODUSR IS 'Código Usuario';

LABEL ON COLUMN UT510.FECMSG IS 'Fecha Mensaje';

LABEL ON COLUMN UT510.DESMSG IS 'Descripción';

LABEL ON COLUMN UT510.VALTXT IS 'Valor Texto';

LABEL ON COLUMN UT510.VALNUM IS 'Valor Numérico';

LABEL ON COLUMN UT510.VIGDED IS 'Vigencia Desde';

LABEL ON COLUMN UT510.VIGHAS IS 'Vigencia Hasta';

LABEL ON COLUMN UT510.ORDVIZ IS 'Orden Visualización';

LABEL ON COLUMN UT510.USRING IS 'Usuario creación';

LABEL ON COLUMN UT510.USRACT IS 'Usuario actualización';

LABEL ON COLUMN UT510.VERREG IS 'Versión del registro';

LABEL ON COLUMN UT510.OBSREG IS 'Observaciones';

LABEL ON COLUMN UT510.ESTREG IS 'Estado del registro';

LABEL ON COLUMN UT510.FECING IS 'Fecha creación';

LABEL ON COLUMN UT510.FECACT IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================

LABEL ON COLUMN UT510.CODUSR TEXT IS 'Código Usuario';

LABEL ON COLUMN UT510.FECMSG TEXT IS 'Fecha Mensaje';

LABEL ON COLUMN UT510.DESMSG TEXT IS 'Descripción';

LABEL ON COLUMN UT510.VALTXT TEXT IS 'Valor Texto';

LABEL ON COLUMN UT510.VALNUM TEXT IS 'Valor Numérico';

LABEL ON COLUMN UT510.VIGDED TEXT IS 'Vigencia Desde';

LABEL ON COLUMN UT510.VIGHAS TEXT IS 'Vigencia Hasta';

LABEL ON COLUMN UT510.ORDVIZ TEXT IS 'Orden Visualización';

LABEL ON COLUMN UT510.USRING TEXT IS 'Usuario creación';

LABEL ON COLUMN UT510.USRACT TEXT IS 'Usuario actualización';

LABEL ON COLUMN UT510.VERREG TEXT IS 'Versión del registro';

LABEL ON COLUMN UT510.OBSREG TEXT IS 'Observaciones';

LABEL ON COLUMN UT510.ESTREG TEXT IS 'Estado del registro';

LABEL ON COLUMN UT510.FECING TEXT IS 'Fecha creación';

LABEL ON COLUMN UT510.FECACT TEXT IS 'Fecha actualización';