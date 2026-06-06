--======================================================================
-- Nombre de la Tabla : RTRNS - HISTORIA_TASA_CAMBIO
--
-- DESCRIPCIÓN:
-- Archivo histórico de tasas de cambio por banco, moneda y fecha.
-- Registra el histórico de cambios en las tasas de compra, venta y
-- posición para auditoría, análisis y conciliación de operaciones.
--
-- Objetivo:
-- Mantener un registro histórico de todas las tasas de cambio
-- aplicadas en el sistema para auditoría y análisis de variaciones.
--
-- Tipo de Tabla:
-- Histórico.
--
-- Origen de los Datos:
-- Generado automáticamente al actualizar tasas en tabla RATES.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte a procesos de auditoría, análisis de variación de tasas y
-- conciliación de operaciones de cambio.
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

CREATE OR REPLACE TABLE RTRNS (
    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)                        NOT NULL,

    CODIGO_MONEDA FOR COLUMN CODMON CHAR(3)
                        NOT NULL,

    FECHA_CAMBIO_TASA FOR COLUMN FECCAMTAS DATE
                        NOT NULL,

    DESCRIPCION FOR COLUMN DESTAS VARCHAR(120)
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

    CONSTRAINT RTRNS_PK PRIMARY KEY (CODBCO, CODMON, FECCAMTAS),

    CONSTRAINT RTRNS_ESTREG_CST CHECK (ESTREG IN ('A','I'))

) RCDFMT RRTRNS;

RENAME TABLE RTRNS
TO HISTORIA_TASA_CAMBIO
FOR SYSTEM NAME RTRNS;

--======================================================================
-- Comentarios
--======================================================================

COMMENT ON TABLE RTRNS IS
'HISTORIA_TASA_CAMBIO';

COMMENT ON COLUMN RTRNS.CODBCO IS
'Código identificador del banco titular del histórico de tasas.';

COMMENT ON COLUMN RTRNS.CODMON IS
'Código identificador de la moneda en el histórico de tasas.';

COMMENT ON COLUMN RTRNS.FECCAMTAS IS
'Fecha del registro histórico de tasas de cambio.';

COMMENT ON COLUMN RTRNS.DESTAS IS
'Descripción funcional del registro histórico de tasas.';

COMMENT ON COLUMN RTRNS.VALTXT IS
'Valor textual adicional asociado al histórico.';

COMMENT ON COLUMN RTRNS.VALNUM IS
'Valor numérico adicional asociado al histórico.';

COMMENT ON COLUMN RTRNS.VIGDED IS
'Fecha desde la cual el registro histórico es vigente.';

COMMENT ON COLUMN RTRNS.VIGHAS IS
'Fecha hasta la cual el registro histórico es vigente.';

COMMENT ON COLUMN RTRNS.ORDVIZ IS
'Orden de visualización o prioridad en listados.';

COMMENT ON COLUMN RTRNS.USRING IS
'Usuario que creó el registro histórico.';

COMMENT ON COLUMN RTRNS.USRACT IS
'Usuario que actualizó por última vez el registro.';

COMMENT ON COLUMN RTRNS.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN RTRNS.OBSREG IS
'Observaciones adicionales sobre el histórico.';

COMMENT ON COLUMN RTRNS.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';

COMMENT ON COLUMN RTRNS.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN RTRNS.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================

LABEL ON TABLE RTRNS IS 'HISTORIA_TASA_CAMBIO';

LABEL ON COLUMN RTRNS.CODBCO IS 'Código Banco';

LABEL ON COLUMN RTRNS.CODMON IS 'Código Moneda';

LABEL ON COLUMN RTRNS.FECCAMTAS IS 'Fecha Histórico';

LABEL ON COLUMN RTRNS.DESTAS IS 'Descripción';

LABEL ON COLUMN RTRNS.VALTXT IS 'Valor Texto';

LABEL ON COLUMN RTRNS.VALNUM IS 'Valor Numérico';

LABEL ON COLUMN RTRNS.VIGDED IS 'Vigencia Desde';

LABEL ON COLUMN RTRNS.VIGHAS IS 'Vigencia Hasta';

LABEL ON COLUMN RTRNS.ORDVIZ IS 'Orden Visualización';

LABEL ON COLUMN RTRNS.USRING IS 'Usuario creación';

LABEL ON COLUMN RTRNS.USRACT IS 'Usuario actualización';

LABEL ON COLUMN RTRNS.VERREG IS 'Versión del registro';

LABEL ON COLUMN RTRNS.OBSREG IS 'Observaciones';

LABEL ON COLUMN RTRNS.ESTREG IS 'Estado del registro';

LABEL ON COLUMN RTRNS.FECING IS 'Fecha creación';

LABEL ON COLUMN RTRNS.FECACT IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================

LABEL ON COLUMN RTRNS.CODBCO TEXT IS 'Código Banco';

LABEL ON COLUMN RTRNS.CODMON TEXT IS 'Código Moneda';

LABEL ON COLUMN RTRNS.FECCAMTAS TEXT IS 'Fecha Histórico';

LABEL ON COLUMN RTRNS.DESTAS TEXT IS 'Descripción';

LABEL ON COLUMN RTRNS.VALTXT TEXT IS 'Valor Texto';

LABEL ON COLUMN RTRNS.VALNUM TEXT IS 'Valor Numérico';

LABEL ON COLUMN RTRNS.VIGDED TEXT IS 'Vigencia Desde';

LABEL ON COLUMN RTRNS.VIGHAS TEXT IS 'Vigencia Hasta';

LABEL ON COLUMN RTRNS.ORDVIZ TEXT IS 'Orden Visualización';

LABEL ON COLUMN RTRNS.USRING TEXT IS 'Usuario creación';

LABEL ON COLUMN RTRNS.USRACT TEXT IS 'Usuario actualización';

LABEL ON COLUMN RTRNS.VERREG TEXT IS 'Versión del registro';

LABEL ON COLUMN RTRNS.OBSREG TEXT IS 'Observaciones';

LABEL ON COLUMN RTRNS.ESTREG TEXT IS 'Estado del registro';

LABEL ON COLUMN RTRNS.FECING TEXT IS 'Fecha creación';

LABEL ON COLUMN RTRNS.FECACT TEXT IS 'Fecha actualización';