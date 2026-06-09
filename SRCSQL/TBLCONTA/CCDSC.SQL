--======================================================================
-- Nombre de la Tabla : CCDSC - Centros de Costos
--
-- DESCRIPCIÓN:
-- Maestro de Centros de Costos. Registra información de centros de
-- costos incluyendo descripción, naturaleza, nivel y saldo actual
-- para control contable y presupuestario.
--
-- Objetivo:
-- Mantener catálogo de centros de costos para asignación de gastos
-- y análisis financiero.
--
-- Tipo de Tabla:
-- Maestro
--
-- Origen de los Datos:
-- Sistema de Contabilidad
--
-- Permanencia de Datos:
-- Permanente
--
-- Uso de los Datos:
-- Asignación de costos, reportes financieros, análisis de centros
-- de costo y presupuestos.
--
-- Restricciones:
-- PK técnica con BIGINT GENERATED ALWAYS AS IDENTITY.
-- Auditoría en español. Estado registro: A (Activo) o I (Inactivo).
-- No contiene relaciones externas (FK).
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-08
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CCDSC (
    ID_REGISTRO FOR COLUMN IDEREG BIGINT
                NOT NULL GENERATED ALWAYS AS IDENTITY,
    DESCRIPCION_CUENTA FOR COLUMN DESCTA VARCHAR(120)
                        NOT NULL DEFAULT '',
    NATURALEZA_CUENTA FOR COLUMN NATCTA VARCHAR(20)
                        NOT NULL DEFAULT '',
    NIVEL_CUENTA FOR COLUMN NVLVTA VARCHAR(50)
                        NOT NULL DEFAULT '',
    SALDO_ACTUAL FOR COLUMN SALACT DECIMAL(18, 2)
                        NOT NULL DEFAULT 0.00,
    FECHA_PROCES_SISTEMA FOR COLUMN FECPRCSIS TIMESTAMP
                        NOT NULL WITH DEFAULT,
    OBSERVACIONES FOR COLUMN OBSREG VARCHAR(120)
                        NOT NULL DEFAULT '',
    VERSION_REGISTRO FOR COLUMN VEREG INTEGER
                        NOT NULL DEFAULT 1,
    ESTADO_REGISTRO FOR COLUMN ESTREG CHAR(1)
                        NOT NULL DEFAULT 'A',
    USUARIO_INGRESO FOR COLUMN USRING CHAR(18)
                        NOT NULL DEFAULT USER,
    FECHA_INGRESO FOR COLUMN FECING TIMESTAMP
                        NOT NULL WITH DEFAULT,
    USUARIO_ACTUALIZA FOR COLUMN USRACT CHAR(18)
                        NOT NULL DEFAULT USER,
    FECHA_ACTUALIZA FOR COLUMN FECACT TIMESTAMP
                        NOT NULL WITH DEFAULT,

    CONSTRAINT CCDSC_PK PRIMARY KEY (IDEREG),

    CONSTRAINT CCDSC_ESTREG_CST CHECK (ESTREG IN ('A','I'))

) RCDFMT RCCDSC;

RENAME TABLE CCDSC
TO CENTROS_COSTOS
FOR SYSTEM NAME CCDSC;

COMMENT ON TABLE CCDSC IS
'Centros de Costos. Maestro de centros de costos para control
contable y presupuestario.';

--======================================================================
-- Comentarios
--======================================================================
COMMENT ON COLUMN CCDSC.IDEREG IS
'Identificador único del centro de costos.';
COMMENT ON COLUMN CCDSC.DESCTA IS
'Descripción del centro de costos.';
COMMENT ON COLUMN CCDSC.NATCTA IS
'Naturaleza del centro de costos.';
COMMENT ON COLUMN CCDSC.NVLVTA IS
'Nivel del centro de costos en la estructura jerárquica.';
COMMENT ON COLUMN CCDSC.SALACT IS
'Saldo actual acumulado del centro.';
COMMENT ON COLUMN CCDSC.FECPRCSIS IS
'Fecha de proceso del sistema.';
COMMENT ON COLUMN CCDSC.OBSREG IS
'Observaciones.';
COMMENT ON COLUMN CCDSC.VEREG IS
'Versión de registro.';
COMMENT ON COLUMN CCDSC.ESTREG IS
'Estado del registro: A (Activo), I (Inactivo).';
COMMENT ON COLUMN CCDSC.USRING IS
'Usuario de ingreso.';
COMMENT ON COLUMN CCDSC.FECING IS
'Fecha de ingreso.';
COMMENT ON COLUMN CCDSC.USRACT IS
'Usuario de actualización.';
COMMENT ON COLUMN CCDSC.FECACT IS
'Fecha de actualización.';

--======================================================================
-- Labels
--======================================================================
LABEL ON TABLE CCDSC IS 'Centros de Costos';

LABEL ON COLUMN CCDSC.IDEREG IS 'ID Registro';
LABEL ON COLUMN CCDSC.DESCTA IS 'Descripción';
LABEL ON COLUMN CCDSC.NATCTA IS 'Naturaleza';
LABEL ON COLUMN CCDSC.NVLVTA IS 'Nivel';
LABEL ON COLUMN CCDSC.SALACT IS 'Saldo Actual';
LABEL ON COLUMN CCDSC.FECPRCSIS IS 'Fecha Proceso';
LABEL ON COLUMN CCDSC.OBSREG IS 'Observaciones';
LABEL ON COLUMN CCDSC.VEREG IS 'Versión';
LABEL ON COLUMN CCDSC.ESTREG IS 'Estado';
LABEL ON COLUMN CCDSC.USRING IS 'Usuario Ingreso';
LABEL ON COLUMN CCDSC.FECING IS 'Fecha Ingreso';
LABEL ON COLUMN CCDSC.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN CCDSC.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS
--======================================================================
LABEL ON COLUMN CCDSC.IDEREG TEXT IS 'ID Registro';
LABEL ON COLUMN CCDSC.DESCTA TEXT IS 'Descripción';
LABEL ON COLUMN CCDSC.NATCTA TEXT IS 'Naturaleza';
LABEL ON COLUMN CCDSC.NVLVTA TEXT IS 'Nivel';
LABEL ON COLUMN CCDSC.SALACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN CCDSC.FECPRCSIS TEXT IS 'Fecha de Proceso';
LABEL ON COLUMN CCDSC.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN CCDSC.VEREG TEXT IS 'Versión de Registro';
LABEL ON COLUMN CCDSC.ESTREG TEXT IS 'Estado del Registro';
LABEL ON COLUMN CCDSC.USRING TEXT IS 'Usuario de Ingreso';
LABEL ON COLUMN CCDSC.FECING TEXT IS 'Fecha de Ingreso';
LABEL ON COLUMN CCDSC.USRACT TEXT IS 'Usuario de Actualización';
LABEL ON COLUMN CCDSC.FECACT TEXT IS 'Fecha de Actualización';