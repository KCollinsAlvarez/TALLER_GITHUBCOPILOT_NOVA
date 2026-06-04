--======================================================================
-- Nombre de la Tabla : HLHIS - HIST_CAMBIOS_RETENC
--
-- DESCRIPCIÓN:
-- Archivo histórico de cambios en retenciones. Registra el histórico
-- de todas las modificaciones realizadas a las tasas, montos y
-- configuración de retenciones en cuentas del banco.
--
-- Objetivo:
-- Mantener un registro histórico completo de cambios en retenciones
-- para auditoría, análisis y reconciliación de operaciones.
--
-- Tipo de Tabla:
-- Histórico.
--
-- Origen de los Datos:
-- Generado automáticamente al actualizar retenciones en operaciones.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte a procesos de auditoría, análisis de cambios en
-- retenciones y validación de cálculos aplicados.
--
-- Restricciones:
-- PK técnica; ESTADO_REGISTRO solo A o I; auditoría con valores
-- por defecto.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-04
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE HLHIS (
    ID FOR COLUMN IDHIS BIGINT
            NOT NULL GENERATED ALWAYS AS IDENTITY,

    DESCRIPCION FOR COLUMN DESREG VARCHAR(120)
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

    CONSTRAINT HLHIS_PK PRIMARY KEY (IDHIS),

    CONSTRAINT HLHIS_ESTREG_CST CHECK (ESTREG IN ('A','I'))

) RCDFMT RHLHIS;

RENAME TABLE HLHIS
TO HIST_CAMBIOS_RETENC
FOR SYSTEM NAME HLHIS;

--======================================================================
-- Comentarios
--======================================================================

COMMENT ON TABLE HLHIS IS
'HIST_CAMBIOS_RETENC';

COMMENT ON COLUMN HLHIS.IDHIS IS
'Identificador único técnico generado automáticamente para el registro.';

COMMENT ON COLUMN HLHIS.DESREG IS
'Descripción funcional del cambio realizado.';

COMMENT ON COLUMN HLHIS.VALTXT IS
'Valor textual adicional asociado al cambio.';

COMMENT ON COLUMN HLHIS.VALNUM IS
'Valor numérico adicional asociado al cambio.';

COMMENT ON COLUMN HLHIS.VIGDED IS
'Fecha desde la cual el registro histórico es vigente.';

COMMENT ON COLUMN HLHIS.VIGHAS IS
'Fecha hasta la cual el registro histórico es vigente.';

COMMENT ON COLUMN HLHIS.ORDVIZ IS
'Orden de visualización o prioridad en listados.';

COMMENT ON COLUMN HLHIS.USRING IS
'Usuario que creó el registro histórico.';

COMMENT ON COLUMN HLHIS.USRACT IS
'Usuario que actualizó por última vez el registro.';

COMMENT ON COLUMN HLHIS.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN HLHIS.OBSREG IS
'Observaciones adicionales sobre el cambio.';

COMMENT ON COLUMN HLHIS.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';

COMMENT ON COLUMN HLHIS.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN HLHIS.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================

LABEL ON TABLE HLHIS IS 'HIST_CAMBIOS_RETENC';

LABEL ON COLUMN HLHIS.IDHIS IS 'ID Histórico';

LABEL ON COLUMN HLHIS.DESREG IS 'Descripción';

LABEL ON COLUMN HLHIS.VALTXT IS 'Valor Texto';

LABEL ON COLUMN HLHIS.VALNUM IS 'Valor Numérico';

LABEL ON COLUMN HLHIS.VIGDED IS 'Vigencia Desde';

LABEL ON COLUMN HLHIS.VIGHAS IS 'Vigencia Hasta';

LABEL ON COLUMN HLHIS.ORDVIZ IS 'Orden Visualización';

LABEL ON COLUMN HLHIS.USRING IS 'Usuario creación';

LABEL ON COLUMN HLHIS.USRACT IS 'Usuario actualización';

LABEL ON COLUMN HLHIS.VERREG IS 'Versión del registro';

LABEL ON COLUMN HLHIS.OBSREG IS 'Observaciones';

LABEL ON COLUMN HLHIS.ESTREG IS 'Estado del registro';

LABEL ON COLUMN HLHIS.FECING IS 'Fecha creación';

LABEL ON COLUMN HLHIS.FECACT IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================

LABEL ON COLUMN HLHIS.IDHIS TEXT IS 'ID Histórico';

LABEL ON COLUMN HLHIS.DESREG TEXT IS 'Descripción';

LABEL ON COLUMN HLHIS.VALTXT TEXT IS 'Valor Texto';

LABEL ON COLUMN HLHIS.VALNUM TEXT IS 'Valor Numérico';

LABEL ON COLUMN HLHIS.VIGDED TEXT IS 'Vigencia Desde';

LABEL ON COLUMN HLHIS.VIGHAS TEXT IS 'Vigencia Hasta';

LABEL ON COLUMN HLHIS.ORDVIZ TEXT IS 'Orden Visualización';

LABEL ON COLUMN HLHIS.USRING TEXT IS 'Usuario creación';

LABEL ON COLUMN HLHIS.USRACT TEXT IS 'Usuario actualización';

LABEL ON COLUMN HLHIS.VERREG TEXT IS 'Versión del registro';

LABEL ON COLUMN HLHIS.OBSREG TEXT IS 'Observaciones';

LABEL ON COLUMN HLHIS.ESTREG TEXT IS 'Estado del registro';

LABEL ON COLUMN HLHIS.FECING TEXT IS 'Fecha creación';

LABEL ON COLUMN HLHIS.FECACT TEXT IS 'Fecha actualización';