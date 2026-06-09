--======================================================================
-- Nombre de la Tabla : DLDRF - DETALL_GIROS_VALORES
--
-- DESCRIPCIÓN:
-- Detalle de giros, valores al cobro y documentos relacionados.
-- Registra información de identificación, documentos, montos,
-- vencimientos y saldos de operaciones de giro y cobro.
--
-- Objetivo:
-- Mantener detalle operacional de giros y valores al cobro.
--
-- Tipo de Tabla:
-- Transaccional
--
-- Origen de los Datos:
-- Sistema de Gestión de Giros y Valores al Cobro
--
-- Permanencia de Datos:
-- Permanente
--
-- Uso de los Datos:
-- Reportes de giros, seguimiento de valores, control de vencimientos
-- y cálculo de comisiones.
--
-- Restricciones:
-- Clave compuesta por Banco, Sucursal, Moneda, Préstamo,
-- Identificación y Número de Documento. FK a DEALS por
-- numero_prestamo. Auditoría en español. Estado registro: A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-07
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE DLDRF (
    CODIGO_BANCO FOR COLUMN CODBCO SMALLINT
                        NOT NULL,
    CODIGO_SUCURSAL FOR COLUMN CODSUC VARCHAR(20)
                        NOT NULL,
    CODIGO_MONEDA FOR COLUMN CODMON CHAR(3)
                        NOT NULL,
    NUMERO_PRESTAMO FOR COLUMN NUMPRE VARCHAR(30)
                        NOT NULL,
    IDENTIFICACION FOR COLUMN IDECLI VARCHAR(50)
                        NOT NULL,
    NUMERO_DOCUMENTO FOR COLUMN NUMDOC VARCHAR(30)
                        NOT NULL,
    FECHA_DESEMBOLSO FOR COLUMN FECDES DATE
                        NOT NULL DEFAULT '0001-01-01',
    FECHA_VENCIMIENTO FOR COLUMN FECVEN DATE
                        NOT NULL DEFAULT '0001-01-01',
    MONTO_ORIGINAL FOR COLUMN MONTOG DECIMAL(18, 2)
                        NOT NULL DEFAULT 0.00,
    SALDO_ACTUAL FOR COLUMN SALACT DECIMAL(18, 2)
                        NOT NULL DEFAULT 0.00,
    TASA_INTERES FOR COLUMN TASINT DECIMAL(18, 2)
                        NOT NULL DEFAULT 0.00,
    PLAZO_MESES FOR COLUMN PLZMES INTEGER
                        NOT NULL DEFAULT 0,
    DIAS_MORA FOR COLUMN DIAMOR INTEGER
                        NOT NULL DEFAULT 0,
    ESTADO_OPERACION FOR COLUMN ESTOPE VARCHAR(20)
                        NOT NULL DEFAULT 'NORMAL',
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

    CONSTRAINT DLDRF_PK PRIMARY KEY
    (CODBCO, CODSUC, CODMON, NUMPRE, IDECLI, NUMDOC),

    CONSTRAINT DLDRF_DEALS_FK FOREIGN KEY (NUMPRE)
        REFERENCES DEALS (NUMPRE),

    CONSTRAINT DLDRF_ESTREG_CST CHECK (ESTREG IN ('A','I'))

) RCDFMT RDLDRF;

RENAME TABLE DLDRF
TO DETALL_GIROS_VALORES
FOR SYSTEM NAME DLDRF;

COMMENT ON TABLE DLDRF IS
'DETALL_GIROS_VALORES';

--======================================================================
-- Comentarios
--======================================================================
COMMENT ON COLUMN DLDRF.CODBCO IS
'Código del banco.';
COMMENT ON COLUMN DLDRF.CODSUC IS
'Código de sucursal.';
COMMENT ON COLUMN DLDRF.CODMON IS
'Código de moneda.';
COMMENT ON COLUMN DLDRF.NUMPRE IS
'Número de préstamo o contrato.';
COMMENT ON COLUMN DLDRF.IDECLI IS
'Identificación del cliente o tercero.';
COMMENT ON COLUMN DLDRF.NUMDOC IS
'Número de documento del giro o valor.';
COMMENT ON COLUMN DLDRF.FECDES IS
'Fecha de desembolso.';
COMMENT ON COLUMN DLDRF.FECVEN IS
'Fecha de vencimiento.';
COMMENT ON COLUMN DLDRF.MONTOG IS
'Monto original del giro o valor.';
COMMENT ON COLUMN DLDRF.SALACT IS
'Saldo actual del giro o valor.';
COMMENT ON COLUMN DLDRF.TASINT IS
'Tasa de interés aplicada.';
COMMENT ON COLUMN DLDRF.PLZMES IS
'Plazo en meses.';
COMMENT ON COLUMN DLDRF.DIAMOR IS
'Días de mora acumulados.';
COMMENT ON COLUMN DLDRF.ESTOPE IS
'Estado de la operación.';
COMMENT ON COLUMN DLDRF.VEREG IS
'Versión de registro.';
COMMENT ON COLUMN DLDRF.OBSREG IS
'Observaciones.';
COMMENT ON COLUMN DLDRF.ESTREG IS
'Estado del registro: A (Activo), I (Inactivo).';
COMMENT ON COLUMN DLDRF.USRING IS
'Usuario de ingreso.';
COMMENT ON COLUMN DLDRF.FECING IS
'Fecha de ingreso.';
COMMENT ON COLUMN DLDRF.USRACT IS
'Usuario de actualización.';
COMMENT ON COLUMN DLDRF.FECACT IS
'Fecha de actualización.';

--======================================================================
-- Labels
--======================================================================
LABEL ON TABLE DLDRF IS 'DETALL_GIROS_VALORES';

LABEL ON COLUMN DLDRF.CODBCO IS 'Código Banco';
LABEL ON COLUMN DLDRF.CODSUC IS 'Código Sucursal';
LABEL ON COLUMN DLDRF.CODMON IS 'Código Moneda';
LABEL ON COLUMN DLDRF.NUMPRE IS 'Número Préstamo';
LABEL ON COLUMN DLDRF.IDECLI IS 'Identificación';
LABEL ON COLUMN DLDRF.NUMDOC IS 'Número Documento';
LABEL ON COLUMN DLDRF.FECDES IS 'Fecha Desembolso';
LABEL ON COLUMN DLDRF.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN DLDRF.MONTOG IS 'Monto Original';
LABEL ON COLUMN DLDRF.SALACT IS 'Saldo Actual';
LABEL ON COLUMN DLDRF.TASINT IS 'Tasa Interés';
LABEL ON COLUMN DLDRF.PLZMES IS 'Plazo Meses';
LABEL ON COLUMN DLDRF.DIAMOR IS 'Días Mora';
LABEL ON COLUMN DLDRF.ESTOPE IS 'Estado Operación';
LABEL ON COLUMN DLDRF.VEREG IS 'Versión Registro';
LABEL ON COLUMN DLDRF.OBSREG IS 'Observaciones';
LABEL ON COLUMN DLDRF.ESTREG IS 'Estado Registro';
LABEL ON COLUMN DLDRF.USRING IS 'Usuario Ingreso';
LABEL ON COLUMN DLDRF.FECING IS 'Fecha Ingreso';
LABEL ON COLUMN DLDRF.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN DLDRF.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS
--======================================================================
LABEL ON COLUMN DLDRF.CODBCO TEXT IS 'Código del Banco';
LABEL ON COLUMN DLDRF.CODSUC TEXT IS 'Código de Sucursal';
LABEL ON COLUMN DLDRF.CODMON TEXT IS 'Código de Moneda';
LABEL ON COLUMN DLDRF.NUMPRE TEXT IS 'Número de Préstamo';
LABEL ON COLUMN DLDRF.IDECLI TEXT IS 'Identificación';
LABEL ON COLUMN DLDRF.NUMDOC TEXT IS 'Número de Documento';
LABEL ON COLUMN DLDRF.FECDES TEXT IS 'Fecha de Desembolso';
LABEL ON COLUMN DLDRF.FECVEN TEXT IS 'Fecha de Vencimiento';
LABEL ON COLUMN DLDRF.MONTOG TEXT IS 'Monto Original';
LABEL ON COLUMN DLDRF.SALACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN DLDRF.TASINT TEXT IS 'Tasa de Interés';
LABEL ON COLUMN DLDRF.PLZMES TEXT IS 'Plazo en Meses';
LABEL ON COLUMN DLDRF.DIAMOR TEXT IS 'Días de Mora';
LABEL ON COLUMN DLDRF.ESTOPE TEXT IS 'Estado de Operación';
LABEL ON COLUMN DLDRF.VEREG TEXT IS 'Versión de Registro';
LABEL ON COLUMN DLDRF.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN DLDRF.ESTREG TEXT IS 'Estado del Registro';
LABEL ON COLUMN DLDRF.USRING TEXT IS 'Usuario de Ingreso';
LABEL ON COLUMN DLDRF.FECING TEXT IS 'Fecha de Ingreso';
LABEL ON COLUMN DLDRF.USRACT TEXT IS 'Usuario de Actualización';
LABEL ON COLUMN DLDRF.FECACT TEXT IS 'Fecha de Actualización';