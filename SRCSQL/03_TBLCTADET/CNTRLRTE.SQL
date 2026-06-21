--======================================================================
-- Nombre de la Tabla : CNTRLRTE - TASAS_CARGOS_CUENTA
--
-- DESCRIPCIÓN:
-- Tabla de Tasas y Cargos por Servicio en Cuentas de Detalle.
--
-- Objetivo:
-- Centralizar las tasas y cargos aplicables a cuentas de detalle.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Parámetros de servicio bancario y tarifas.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Cálculo de costos y cargos por cuenta de detalle.
--
-- Restricciones:
-- PK sobre banco y tipo de producto.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-19
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CNTRLRTE (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    TIPO_PRODUCTO FOR COLUMN TIPPRD VARCHAR(20)
                       NOT NULL,

    CODIGO_TABLA FOR COLUMN CODTAB VARCHAR(20)
                       NOT NULL,

    FECHA_APERTURA FOR COLUMN FECAPR DATE
                        NOT NULL DEFAULT '0001-01-01',

    FEC_ULTIMA_TRANS FOR COLUMN FECULTTRN DATE
                        NOT NULL DEFAULT '0001-01-01',

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                     NOT NULL DEFAULT 0,

    SALDO_DISPONIBLE FOR COLUMN SLDDIP DECIMAL(18, 2)
                         NOT NULL DEFAULT 0,

    LIMITE_SOBREGIRO FOR COLUMN LIMSBR DECIMAL(18, 2)
                         NOT NULL DEFAULT 0,

    ESTADO_CUENTA FOR COLUMN ESTCTA VARCHAR(20)
                       NOT NULL DEFAULT '',

    VERSION_REGISTRO FOR COLUMN VERREG INTEGER
                         NOT NULL DEFAULT 1,

    OBSERVACIONES FOR COLUMN OBSREG VARCHAR(120)
                      NOT NULL DEFAULT '',

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

    CONSTRAINT CNTRLRTE_PK PRIMARY KEY (CODBCO, TIPPRD, CODTAB),

    CONSTRAINT CNTRLRTE_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCNTRLRTE;

RENAME TABLE CNTRLRTE
TO TASAS_CARGOS_CUENTA
FOR SYSTEM NAME CNTRLRTE;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CNTRLRTE IS
'TASAS_CARGOS_CUENTA';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CNTRLRTE.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN CNTRLRTE.TIPPRD IS
'Tipo de producto.';

COMMENT ON COLUMN CNTRLRTE.CODTAB IS
'Código de tabla de tarifas.';

COMMENT ON COLUMN CNTRLRTE.FECAPR IS
'Fecha de apertura del registro.';

COMMENT ON COLUMN CNTRLRTE.FECULTTRN IS
'Fecha de la última transacción registrada.';

COMMENT ON COLUMN CNTRLRTE.SLDACT IS
'Saldo actual asociado al registro.';

COMMENT ON COLUMN CNTRLRTE.SLDDIP IS
'Saldo disponible asociado al registro.';

COMMENT ON COLUMN CNTRLRTE.LIMSBR IS
'Límite de sobregiro asociado al registro.';

COMMENT ON COLUMN CNTRLRTE.ESTCTA IS
'Estado de cuenta asociado al registro.';

COMMENT ON COLUMN CNTRLRTE.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN CNTRLRTE.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN CNTRLRTE.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN CNTRLRTE.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN CNTRLRTE.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN CNTRLRTE.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN CNTRLRTE.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CNTRLRTE IS 'TASAS_CARGOS_CUENTA';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CNTRLRTE.CODBCO IS 'Código Banco';
LABEL ON COLUMN CNTRLRTE.TIPPRD IS 'Tipo Producto';
LABEL ON COLUMN CNTRLRTE.CODTAB IS 'Código Tabla';
LABEL ON COLUMN CNTRLRTE.FECAPR IS 'Fecha Apertura';
LABEL ON COLUMN CNTRLRTE.FECULTTRN IS 'Fecha Última Transacción';
LABEL ON COLUMN CNTRLRTE.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN CNTRLRTE.SLDDIP IS 'Saldo Disponible';
LABEL ON COLUMN CNTRLRTE.LIMSBR IS 'Límite Sobregiro';
LABEL ON COLUMN CNTRLRTE.ESTCTA IS 'Estado Cuenta';
LABEL ON COLUMN CNTRLRTE.VERREG IS 'Versión Registro';
LABEL ON COLUMN CNTRLRTE.OBSREG IS 'Observaciones';
LABEL ON COLUMN CNTRLRTE.ESTREG IS 'Estado Registro';
LABEL ON COLUMN CNTRLRTE.USRING IS 'Usuario Creación';
LABEL ON COLUMN CNTRLRTE.FECING IS 'Fecha Creación';
LABEL ON COLUMN CNTRLRTE.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLRTE.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CNTRLRTE.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN CNTRLRTE.TIPPRD TEXT IS 'Tipo Producto';
LABEL ON COLUMN CNTRLRTE.CODTAB TEXT IS 'Código Tabla';
LABEL ON COLUMN CNTRLRTE.FECAPR TEXT IS 'Fecha Apertura';
LABEL ON COLUMN CNTRLRTE.FECULTTRN TEXT IS 'Fecha Última Transacción';
LABEL ON COLUMN CNTRLRTE.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN CNTRLRTE.SLDDIP TEXT IS 'Saldo Disponible';
LABEL ON COLUMN CNTRLRTE.LIMSBR TEXT IS 'Límite Sobregiro';
LABEL ON COLUMN CNTRLRTE.ESTCTA TEXT IS 'Estado Cuenta';
LABEL ON COLUMN CNTRLRTE.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN CNTRLRTE.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN CNTRLRTE.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN CNTRLRTE.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN CNTRLRTE.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN CNTRLRTE.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLRTE.FECACT TEXT IS 'Fecha Actualiza';
