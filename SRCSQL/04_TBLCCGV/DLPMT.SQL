--======================================================================
-- Nombre de la Tabla : DLPMT - PLAN_DE_PAGOS
--
-- DESCRIPCIÓN:
-- Plan de pagos asociados a préstamos, certificados, giros y
-- valores al cobro. Registra cronograma de desembolsos, vencimientos,
-- saldos e información de tasas de interés.
--
-- Objetivo:
-- Mantener el plan de pagos y seguimiento de operaciones de crédito.
--
-- Tipo de Tabla:
-- Transaccional
--
-- Origen de los Datos:
-- Sistema de Gestión de Crédito y Contratos
--
-- Permanencia de Datos:
-- Permanente
--
-- Uso de los Datos:
-- Reportes de planes de pago, control de vencimientos,
-- cálculo de intereses y seguimiento de mora.
--
-- Restricciones:
-- Clave compuesta por Banco, Sucursal, Moneda, Préstamo, Fecha
-- y Tipo de Registro. FK a DEALS por numero_prestamo.
-- Auditoría en español. Estado registro: A (Activo) o I (Inactivo).
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-07
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE DLPMT (
    CODIGO_BANCO FOR COLUMN CODBCO SMALLINT
                        NOT NULL,
    CODIGO_SUCURSAL FOR COLUMN CODSUC VARCHAR(20)
                        NOT NULL,
    CODIGO_MONEDA FOR COLUMN CODMON CHAR(3)
                        NOT NULL,
    NUMERO_PRESTAMO FOR COLUMN NUMPRE VARCHAR(30)
                        NOT NULL,
    FECHA_PLAN FOR COLUMN FECPLN DATE
                        NOT NULL,
    TIPO_REGISTRO FOR COLUMN TIPREG VARCHAR(20)
                        NOT NULL,
    FECHA_DESEMBOLSO FOR COLUMN FECDES DATE
                        NOT NULL DEFAULT CURRENT_DATE,
    FECHA_VENCIMIENTO FOR COLUMN FECVEN DATE
                        NOT NULL DEFAULT CURRENT_DATE,
    MONTO_ORIGINAL FOR COLUMN MONORI DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,
    SALDO_ACTUAL FOR COLUMN SALACT DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,
    TASA_INTERES FOR COLUMN TASINT DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,
    PLAZO_MESES FOR COLUMN PLZMES INTEGER
                        NOT NULL DEFAULT 0,
    DIAS_MORA FOR COLUMN DIAMOR INTEGER
                        NOT NULL DEFAULT 0,
    ESTADO_OPERACION FOR COLUMN ESTOPE VARCHAR(20)
                        NOT NULL DEFAULT ' ',
    VERSION_REGISTRO FOR COLUMN VEREG INTEGER
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

    CONSTRAINT DLPMT_PK PRIMARY KEY (
        CODBCO, CODSUC,
        CODMON, NUMPRE,
        FECPLN, TIPREG),

    CONSTRAINT DLPMT_DEALS_FK FOREIGN KEY (NUMPRE)
        REFERENCES DEALS (NUMPRE),

    CONSTRAINT DLPMT_ESTREG_CST CHECK (ESTREG IN ('A','I'))

) RCDFMT RDLPMT;

RENAME TABLE DLPMT
TO PLAN_DE_PAGOS
FOR SYSTEM NAME DLPMT;

COMMENT ON TABLE DLPMT IS
'PLAN_DE_PAGOS';

--======================================================================
-- Comentarios
--======================================================================
COMMENT ON COLUMN DLPMT.CODBCO IS
'Código del banco.';
COMMENT ON COLUMN DLPMT.CODSUC IS
'Código de sucursal.';
COMMENT ON COLUMN DLPMT.CODMON IS
'Código de moneda.';
COMMENT ON COLUMN DLPMT.NUMPRE IS
'Número de préstamo o contrato.';
COMMENT ON COLUMN DLPMT.FECPLN IS
'Fecha del plan de pago.';
COMMENT ON COLUMN DLPMT.TIPREG IS
'Tipo de registro del plan.';
COMMENT ON COLUMN DLPMT.FECDES IS
'Fecha de desembolso.';
COMMENT ON COLUMN DLPMT.FECVEN IS
'Fecha de vencimiento del pago.';
COMMENT ON COLUMN DLPMT.MONORI IS
'Monto original del préstamo.';
COMMENT ON COLUMN DLPMT.SALACT IS
'Saldo actual del préstamo.';
COMMENT ON COLUMN DLPMT.TASINT IS
'Tasa de interés aplicada.';
COMMENT ON COLUMN DLPMT.PLZMES IS
'Plazo en meses.';
COMMENT ON COLUMN DLPMT.DIAMOR IS
'Días de mora acumulados.';
COMMENT ON COLUMN DLPMT.ESTOPE IS
'Estado de la operación.';
COMMENT ON COLUMN DLPMT.VEREG IS
'Versión de registro.';
COMMENT ON COLUMN DLPMT.OBSREG IS
'Observaciones.';
COMMENT ON COLUMN DLPMT.ESTREG IS
'Estado del registro: A (Activo), I (Inactivo).';
COMMENT ON COLUMN DLPMT.USRING IS
'Usuario de ingreso.';
COMMENT ON COLUMN DLPMT.FECING IS
'Fecha de ingreso.';
COMMENT ON COLUMN DLPMT.USRACT IS
'Usuario de actualización.';
COMMENT ON COLUMN DLPMT.FECACT IS
'Fecha de actualización.';

--======================================================================
-- Labels
--======================================================================
LABEL ON TABLE DLPMT IS 'PLAN_DE_PAGOS';

LABEL ON COLUMN DLPMT.CODBCO IS 'Código Banco';
LABEL ON COLUMN DLPMT.CODSUC IS 'Código Sucursal';
LABEL ON COLUMN DLPMT.CODMON IS 'Código Moneda';
LABEL ON COLUMN DLPMT.NUMPRE IS 'Número Préstamo';
LABEL ON COLUMN DLPMT.FECPLN IS 'Fecha Plan';
LABEL ON COLUMN DLPMT.TIPREG IS 'Tipo Registro';
LABEL ON COLUMN DLPMT.FECDES IS 'Fecha Desembolso';
LABEL ON COLUMN DLPMT.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN DLPMT.MONORI IS 'Monto Original';
LABEL ON COLUMN DLPMT.SALACT IS 'Saldo Actual';
LABEL ON COLUMN DLPMT.TASINT IS 'Tasa Interés';
LABEL ON COLUMN DLPMT.PLZMES IS 'Plazo Meses';
LABEL ON COLUMN DLPMT.DIAMOR IS 'Días Mora';
LABEL ON COLUMN DLPMT.ESTOPE IS 'Estado Operación';
LABEL ON COLUMN DLPMT.VEREG IS 'Versión Registro';
LABEL ON COLUMN DLPMT.OBSREG IS 'Observaciones';
LABEL ON COLUMN DLPMT.ESTREG IS 'Estado Registro';
LABEL ON COLUMN DLPMT.USRING IS 'Usuario Ingreso';
LABEL ON COLUMN DLPMT.FECING IS 'Fecha Ingreso';
LABEL ON COLUMN DLPMT.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN DLPMT.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS
--======================================================================
LABEL ON COLUMN DLPMT.CODBCO TEXT IS 'Código del Banco';
LABEL ON COLUMN DLPMT.CODSUC TEXT IS 'Código de Sucursal';
LABEL ON COLUMN DLPMT.CODMON TEXT IS 'Código de Moneda';
LABEL ON COLUMN DLPMT.NUMPRE TEXT IS 'Número de Préstamo';
LABEL ON COLUMN DLPMT.FECPLN TEXT IS 'Fecha del Plan';
LABEL ON COLUMN DLPMT.TIPREG TEXT IS 'Tipo de Registro';
LABEL ON COLUMN DLPMT.FECDES TEXT IS 'Fecha de Desembolso';
LABEL ON COLUMN DLPMT.FECVEN TEXT IS 'Fecha de Vencimiento';
LABEL ON COLUMN DLPMT.MONORI TEXT IS 'Monto Original';
LABEL ON COLUMN DLPMT.SALACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN DLPMT.TASINT TEXT IS 'Tasa de Interés';
LABEL ON COLUMN DLPMT.PLZMES TEXT IS 'Plazo en Meses';
LABEL ON COLUMN DLPMT.DIAMOR TEXT IS 'Días de Mora';
LABEL ON COLUMN DLPMT.ESTOPE TEXT IS 'Estado de Operación';
LABEL ON COLUMN DLPMT.VEREG TEXT IS 'Versión de Registro';
LABEL ON COLUMN DLPMT.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN DLPMT.ESTREG TEXT IS 'Estado del Registro';
LABEL ON COLUMN DLPMT.USRING TEXT IS 'Usuario de Ingreso';
LABEL ON COLUMN DLPMT.FECING TEXT IS 'Fecha de Ingreso';
LABEL ON COLUMN DLPMT.USRACT TEXT IS 'Usuario de Actualización';
LABEL ON COLUMN DLPMT.FECACT TEXT IS 'Fecha de Actualización';