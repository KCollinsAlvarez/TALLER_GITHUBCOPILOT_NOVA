--======================================================================
-- Nombre de la Tabla : CNTRLPRF - CONTROL_PAGO_RECIBO
--
-- DESCRIPCIÓN:
-- Archivo de control de pagos y recibos. Registra información de
-- control paramétrico de operaciones de pagos y recibidos por banco,
-- parametro y tabla de código, incluyendo montos, beneficiarios,
-- canales y estado de pago para auditoría operacional.
--
-- Objetivo:
-- Mantener control paramétrico de pagos y recibos como base para
-- auditoría de operaciones y validación de integridad de transacciones.
--
-- Tipo de Tabla:
-- Maestro de Control.
--
-- Origen de los Datos:
-- Operaciones de pagos y recibos del banco.
--
-- Permanencia de Datos:
-- Permanente (histórico de control).
--
-- Uso de los Datos:
-- Auditoría de pagos, análisis de recibos, conciliación operacional
-- y validación de parámetros de control.
--
-- Restricciones:
-- PK compuesta: codigo_banco, parametro, codigo_tabla.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-21
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CNTRLPRF (
    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,
    
    PARAMETRO_CONTROL FOR COLUMN PRMCNT VARCHAR(20)
                      NOT NULL,
    
    CODIGO_TABLA FOR COLUMN CODTAB VARCHAR(20)
                        NOT NULL,
    
    FECHA_OPERACION FOR COLUMN FECOPE DATE
                        NOT NULL DEFAULT '0001-01-01',
    
    MONTO FOR COLUMN MNTPAG DECIMAL(18, 2)
                   NOT NULL DEFAULT 0,
    
    BENEFICIARIO FOR COLUMN BNFPAG VARCHAR(80)
                         NOT NULL DEFAULT '',
    
    BANCO_DESTINO FOR COLUMN BCODST VARCHAR(80)
                          NOT NULL DEFAULT '',
    
    CANAL_PAGO FOR COLUMN CNLPAG VARCHAR(20)
                        NOT NULL DEFAULT '',
    
    ESTADO_PAGO FOR COLUMN ESTPAG VARCHAR(20)
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
    
    CONSTRAINT CNTRLPRF_PK PRIMARY KEY
    (CODBCO, PRMCNT, CODTAB),

    CONSTRAINT CNTRLPRF_ESTREG_CHK CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCNTRLPRF;

RENAME TABLE CNTRLPRF
TO CONTROL_PAGO_RECIBO
FOR SYSTEM NAME CNTRLPRF;   

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CNTRLPRF IS 'CONTROL_PAGO_RECIBO';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CNTRLPRF.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN CNTRLPRF.PRMCNT IS
'Parámetro.';

COMMENT ON COLUMN CNTRLPRF.CODTAB IS
'Código de tabla.';

COMMENT ON COLUMN CNTRLPRF.FECOPE IS
'Fecha de la operación.';

COMMENT ON COLUMN CNTRLPRF.MNTPAG IS
'Monto.';

COMMENT ON COLUMN CNTRLPRF.BNFPAG IS
'Beneficiario.';

COMMENT ON COLUMN CNTRLPRF.BCODST IS
'Banco destino.';

COMMENT ON COLUMN CNTRLPRF.CNLPAG IS
'Canal pago.';

COMMENT ON COLUMN CNTRLPRF.ESTPAG IS
'Estado del pago.';

COMMENT ON COLUMN CNTRLPRF.VERREG IS
'Versión del registro.';

COMMENT ON COLUMN CNTRLPRF.OBSREG IS
'Observaciones.';

COMMENT ON COLUMN CNTRLPRF.ESTREG IS
'Estado del registro.';

COMMENT ON COLUMN CNTRLPRF.USRING IS
'Usuario que creó el registro ';

COMMENT ON COLUMN CNTRLPRF.FECING IS
'Fecha y hora de creación ';

COMMENT ON COLUMN CNTRLPRF.USRACT IS
'Usuario que realizó la última actualización ';

COMMENT ON COLUMN CNTRLPRF.FECACT IS
'Fecha y hora de la última actualización ';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CNTRLPRF IS 'CONTROL_PAGO_RECIBO';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CNTRLPRF.CODBCO IS 'Código Banco';
LABEL ON COLUMN CNTRLPRF.PRMCNT IS 'Parámetro';
LABEL ON COLUMN CNTRLPRF.CODTAB IS 'Código Tabla';
LABEL ON COLUMN CNTRLPRF.FECOPE IS 'Fecha Operación';
LABEL ON COLUMN CNTRLPRF.MNTPAG IS 'Monto';
LABEL ON COLUMN CNTRLPRF.BNFPAG IS 'Beneficiario';
LABEL ON COLUMN CNTRLPRF.BCODST IS 'Banco Destino';
LABEL ON COLUMN CNTRLPRF.CNLPAG IS 'Canal Pago';
LABEL ON COLUMN CNTRLPRF.ESTPAG IS 'Estado Pago';
LABEL ON COLUMN CNTRLPRF.VERREG IS 'Versión Registro';
LABEL ON COLUMN CNTRLPRF.OBSREG IS 'Observaciones';
LABEL ON COLUMN CNTRLPRF.ESTREG IS 'Estado Registro';
LABEL ON COLUMN CNTRLPRF.USRING IS 'Usuario Creación';
LABEL ON COLUMN CNTRLPRF.FECING IS 'Fecha Creación';
LABEL ON COLUMN CNTRLPRF.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLPRF.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CNTRLPRF.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN CNTRLPRF.PRMCNT TEXT IS 'Parámetro';
LABEL ON COLUMN CNTRLPRF.CODTAB TEXT IS 'Código Tabla';
LABEL ON COLUMN CNTRLPRF.FECOPE TEXT IS 'Fecha Operación';
LABEL ON COLUMN CNTRLPRF.MNTPAG TEXT IS 'Monto';
LABEL ON COLUMN CNTRLPRF.BNFPAG TEXT IS 'Beneficiario';
LABEL ON COLUMN CNTRLPRF.BCODST TEXT IS 'Banco Destino';
LABEL ON COLUMN CNTRLPRF.CNLPAG TEXT IS 'Canal Pago';
LABEL ON COLUMN CNTRLPRF.ESTPAG TEXT IS 'Estado Pago';
LABEL ON COLUMN CNTRLPRF.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN CNTRLPRF.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN CNTRLPRF.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN CNTRLPRF.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN CNTRLPRF.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN CNTRLPRF.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLPRF.FECACT TEXT IS 'Fecha Actualiza';