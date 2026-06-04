--======================================================================
-- Nombre de la Tabla : UT500 - AGENDA_PERSONALIZADA
--
-- DESCRIPCIÓN:
-- Archivo de agenda personalizada por usuario. Registra los eventos,
-- citas, recordatorios y tareas programadas por cada usuario del
-- sistema para gestión personal de actividades.
--
-- Objetivo:
-- Mantener un calendario personal de eventos y recordatorios para
-- cada usuario del sistema de manera personalizada y segura.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Ingreso manual por usuarios del sistema mediante interfaces de
-- gestión de agenda.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte a procesos de gestión personal de tiempo, recordatorios y
-- citas para usuarios del sistema.
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

CREATE OR REPLACE TABLE UT500 (
    CODIGO_USUARIO FOR COLUMN CODUSR VARCHAR(20)
                        NOT NULL,

    FECHA_AGENDA FOR COLUMN FECAGN DATE
                        NOT NULL,

    DESCRIPCION FOR COLUMN DESAGN VARCHAR(120)
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

    CONSTRAINT UT500_PK PRIMARY KEY (CODUSR, FECAGN),

    CONSTRAINT UT500_ESTREG_CST CHECK (ESTREG IN ('A','I'))

) RCDFMT RUT500;

RENAME TABLE UT500
TO AGENDA_PERSONALIZADA
FOR SYSTEM NAME UT500;

--======================================================================
-- Comentarios
--======================================================================

COMMENT ON TABLE UT500 IS
'AGENDA_PERSONALIZADA';

COMMENT ON COLUMN UT500.CODUSR IS
'Código identificador único del usuario propietario del evento.';

COMMENT ON COLUMN UT500.FECAGN IS
'Fecha del evento en la agenda personal del usuario.';

COMMENT ON COLUMN UT500.DESAGN IS
'Descripción adicional funcional del evento.';

COMMENT ON COLUMN UT500.VALTXT IS
'Valor textual adicional asociado al evento.';

COMMENT ON COLUMN UT500.VALNUM IS
'Valor numérico adicional asociado al evento.';

COMMENT ON COLUMN UT500.VIGDED IS
'Fecha desde la cual el evento es vigente.';

COMMENT ON COLUMN UT500.VIGHAS IS
'Fecha hasta la cual el evento es vigente.';

COMMENT ON COLUMN UT500.ORDVIZ IS
'Orden de visualización o prioridad en listados.';

COMMENT ON COLUMN UT500.USRING IS
'Usuario que creó el registro de evento.';

COMMENT ON COLUMN UT500.USRACT IS
'Usuario que actualizó por última vez el registro.';

COMMENT ON COLUMN UT500.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN UT500.OBSREG IS
'Observaciones adicionales sobre el evento.';

COMMENT ON COLUMN UT500.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';

COMMENT ON COLUMN UT500.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN UT500.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================

LABEL ON TABLE UT500 IS 'AGENDA_PERSONALIZADA';

LABEL ON COLUMN UT500.CODUSR IS 'Código Usuario';

LABEL ON COLUMN UT500.FECAGN IS 'Fecha Evento';

LABEL ON COLUMN UT500.DESAGN IS 'Descripción';

LABEL ON COLUMN UT500.VALTXT IS 'Valor Texto';

LABEL ON COLUMN UT500.VALNUM IS 'Valor Numérico';

LABEL ON COLUMN UT500.VIGDED IS 'Vigencia Desde';

LABEL ON COLUMN UT500.VIGHAS IS 'Vigencia Hasta';

LABEL ON COLUMN UT500.ORDVIZ IS 'Orden Visualización';

LABEL ON COLUMN UT500.USRING IS 'Usuario creación';

LABEL ON COLUMN UT500.USRACT IS 'Usuario actualización';

LABEL ON COLUMN UT500.VERREG IS 'Versión del registro';

LABEL ON COLUMN UT500.OBSREG IS 'Observaciones';

LABEL ON COLUMN UT500.ESTREG IS 'Estado del registro';

LABEL ON COLUMN UT500.FECING IS 'Fecha creación';

LABEL ON COLUMN UT500.FECACT IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================

LABEL ON COLUMN UT500.CODUSR TEXT IS 'Código Usuario';

LABEL ON COLUMN UT500.FECAGN TEXT IS 'Fecha Evento';

LABEL ON COLUMN UT500.DESAGN TEXT IS 'Descripción';

LABEL ON COLUMN UT500.VALTXT TEXT IS 'Valor Texto';

LABEL ON COLUMN UT500.VALNUM TEXT IS 'Valor Numérico';

LABEL ON COLUMN UT500.VIGDED TEXT IS 'Vigencia Desde';

LABEL ON COLUMN UT500.VIGHAS TEXT IS 'Vigencia Hasta';

LABEL ON COLUMN UT500.ORDVIZ TEXT IS 'Orden Visualización';

LABEL ON COLUMN UT500.USRING TEXT IS 'Usuario creación';

LABEL ON COLUMN UT500.USRACT TEXT IS 'Usuario actualización';

LABEL ON COLUMN UT500.VERREG TEXT IS 'Versión del registro';

LABEL ON COLUMN UT500.OBSREG TEXT IS 'Observaciones';

LABEL ON COLUMN UT500.ESTREG TEXT IS 'Estado del registro';

LABEL ON COLUMN UT500.FECING TEXT IS 'Fecha creación';

LABEL ON COLUMN UT500.FECACT TEXT IS 'Fecha actualización';