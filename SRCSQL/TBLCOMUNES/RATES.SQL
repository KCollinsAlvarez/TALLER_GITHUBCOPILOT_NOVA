--======================================================================
-- Nombre de la Tabla : RATES - TASAS_CAMBIO
--
-- DESCRIPCIÓN:
-- Archivo maestro de tasas de cambio por banco y moneda.
--
-- Objetivo:
-- Centralizar la definición de tasas de cambio vigentes por banco y
-- moneda para validación y cálculo en operaciones de cambio.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Mercado de divisas y actualización diaria por operaciones del
-- banco.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte a procesos que requieren tasas de cambio vigentes para
-- cálculos de posición y contra valor en operaciones.
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

CREATE OR REPLACE TABLE RATES (
    CODIGO_BANCO FOR COLUMN CODBCO VARCHAR(20)
                        NOT NULL,

    CODIGO_MONEDA FOR COLUMN CODMON VARCHAR(20)
                        NOT NULL,

    DESCRIP_TASA FOR COLUMN DESTAS VARCHAR(120)
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

    CONSTRAINT RATES_PK PRIMARY KEY (CODBCO, CODMON),

    CONSTRAINT RATES_ESTREG_CST CHECK (ESTREG IN ('A','I'))

) RCDFMT RRATES;

RENAME TABLE RATES
TO TASAS_CAMBIO
FOR SYSTEM NAME RATES;

--======================================================================
-- Comentarios
--======================================================================

COMMENT ON TABLE RATES IS
'TASAS_CAMBIO';

COMMENT ON COLUMN RATES.CODBCO IS
'Código identificador del banco titular de la tasa de cambio.';

COMMENT ON COLUMN RATES.CODMON IS
'Código identificador de la moneda para la que se define la tasa.';

COMMENT ON COLUMN RATES.DESTAS IS
'Descripción funcional de la tasa de cambio.';

COMMENT ON COLUMN RATES.VALTXT IS
'Valor textual adicional asociado a la tasa.';

COMMENT ON COLUMN RATES.VALNUM IS
'Valor numérico adicional asociado a la tasa.';

COMMENT ON COLUMN RATES.VIGDED IS
'Fecha desde la cual la tasa es vigente en el sistema.';

COMMENT ON COLUMN RATES.VIGHAS IS
'Fecha hasta la cual la tasa es vigente en el sistema.';

COMMENT ON COLUMN RATES.ORDVIZ IS
'Orden de visualización o prioridad en listados.';

COMMENT ON COLUMN RATES.USRING IS
'Usuario que creó el registro de tasa.';

COMMENT ON COLUMN RATES.USRACT IS
'Usuario que actualizó por última vez el registro.';

COMMENT ON COLUMN RATES.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN RATES.OBSREG IS
'Observaciones adicionales sobre la tasa de cambio.';

COMMENT ON COLUMN RATES.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';

COMMENT ON COLUMN RATES.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN RATES.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================

LABEL ON TABLE RATES IS 'TASAS_CAMBIO';

LABEL ON COLUMN RATES.CODBCO IS 'Código Banco';

LABEL ON COLUMN RATES.CODMON IS 'Código Moneda';

LABEL ON COLUMN RATES.DESTAS IS 'Descripción';

LABEL ON COLUMN RATES.VALTXT IS 'Valor Texto';

LABEL ON COLUMN RATES.VALNUM IS 'Valor Numérico';

LABEL ON COLUMN RATES.VIGDED IS 'Vigencia Desde';

LABEL ON COLUMN RATES.VIGHAS IS 'Vigencia Hasta';

LABEL ON COLUMN RATES.ORDVIZ IS 'Orden Visualización';

LABEL ON COLUMN RATES.USRING IS 'Usuario creación';

LABEL ON COLUMN RATES.USRACT IS 'Usuario actualización';

LABEL ON COLUMN RATES.VERREG IS 'Versión del registro';

LABEL ON COLUMN RATES.OBSREG IS 'Observaciones';

LABEL ON COLUMN RATES.ESTREG IS 'Estado del registro';

LABEL ON COLUMN RATES.FECING IS 'Fecha creación';

LABEL ON COLUMN RATES.FECACT IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================

LABEL ON COLUMN RATES.CODBCO TEXT IS 'Código Banco';

LABEL ON COLUMN RATES.CODMON TEXT IS 'Código Moneda';

LABEL ON COLUMN RATES.DESTAS TEXT IS 'Descripción';

LABEL ON COLUMN RATES.VALTXT TEXT IS 'Valor Texto';

LABEL ON COLUMN RATES.VALNUM TEXT IS 'Valor Numérico';

LABEL ON COLUMN RATES.VIGDED TEXT IS 'Vigencia Desde';

LABEL ON COLUMN RATES.VIGHAS TEXT IS 'Vigencia Hasta';

LABEL ON COLUMN RATES.ORDVIZ TEXT IS 'Orden Visualización';

LABEL ON COLUMN RATES.USRING TEXT IS 'Usuario creación';

LABEL ON COLUMN RATES.USRACT TEXT IS 'Usuario actualización';

LABEL ON COLUMN RATES.VERREG TEXT IS 'Versión del registro';

LABEL ON COLUMN RATES.OBSREG TEXT IS 'Observaciones';

LABEL ON COLUMN RATES.ESTREG TEXT IS 'Estado del registro';

LABEL ON COLUMN RATES.FECING TEXT IS 'Fecha creación';

LABEL ON COLUMN RATES.FECACT TEXT IS 'Fecha actualización';