--======================================================================
-- Nombre de la Tabla : SWITF - HISTORICO_PAGO_SWIFT
--
-- DESCRIPCIÓN:
-- Histórico de pagos y recibidos vía Swift. Registra el archivo maestro
-- de operaciones internacionales procesadas a través del sistema Swift,
-- incluyendo información de operación, montos, beneficiarios, bancos
-- destino, canales de pago y estado de procesamiento para auditoría e
-- integridad de operaciones internacionales.
--
-- Objetivo:
-- Centralizar el registro histórico completo de transacciones Swift
-- como base para auditoría de pagos internacionales, conciliación con
-- sistemas de corresponsalía y análisis de flujos internacionales.
--
-- Tipo de Tabla:
-- Maestro (Histórico de alto volumen).
--
-- Origen de los Datos:
-- Operaciones de pagos y recibidos procesadas vía protocolo Swift del
-- banco para transferencias y operaciones internacionales.
--
-- Permanencia de Datos:
-- Permanente (histórico de operaciones Swift).
--
-- Uso de los Datos:
-- Base para auditoría de pagos internacionales, conciliación Swift,
-- reportes de operaciones internacionales, análisis de corresponsalía
-- y validación de integridad de transacciones de comercio exterior.
--
-- Restricciones:
-- PK compuesta: codigo_banco, numero_referencia, formato_swift.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-21
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE SWITF (
    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,
    
    NUMERO_REFERENCIA FOR COLUMN NUMREF VARCHAR(30)
                              NOT NULL,
    
    FORMATO_SWIFT FOR COLUMN FRMSWF VARCHAR(50)
                          NOT NULL,
    
    FECHA_OPERACION FOR COLUMN FECOPE DATE
                        NOT NULL DEFAULT '0001-01-01',
    
    MONTO_PAGO FOR COLUMN MNTPAG DECIMAL(18, 2)
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
    
    CONSTRAINT SWITF_PK PRIMARY KEY (CODBCO, NUMREF, FRMSWF),

    CONSTRAINT SWITF_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RSWITF;

RENAME TABLE SWITF
TO HISTORICO_PAGO_SWIFT
FOR SYSTEM NAME SWITF;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE SWITF IS 'HISTORICO_PAGO_SWIFT';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN SWITF.CODBCO IS 'Código del banco.';

COMMENT ON COLUMN SWITF.NUMREF IS 'Número de referencia.';

COMMENT ON COLUMN SWITF.FRMSWF IS 'Formato SWIFT.';

COMMENT ON COLUMN SWITF.FECOPE IS 'Fecha de la operación.';

COMMENT ON COLUMN SWITF.MNTPAG IS 'Monto.';

COMMENT ON COLUMN SWITF.BNFPAG IS 'Beneficiario.';

COMMENT ON COLUMN SWITF.BCODST IS 'Banco destino.';

COMMENT ON COLUMN SWITF.CNLPAG IS 'Canal pago.';

COMMENT ON COLUMN SWITF.ESTPAG IS 'Estado del pago.';

COMMENT ON COLUMN SWITF.VERREG IS 'Versión del registro.';

COMMENT ON COLUMN SWITF.OBSREG IS 'Observaciones.';

COMMENT ON COLUMN SWITF.ESTREG IS 'Estado del registro.';

COMMENT ON COLUMN SWITF.USRING IS
'Usuario que creó el registro ';

COMMENT ON COLUMN SWITF.FECING IS
'Fecha y hora de creación ';

COMMENT ON COLUMN SWITF.USRACT IS
'Usuario que realizó la actualización ';

COMMENT ON COLUMN SWITF.FECACT IS
'Fecha y hora de la actualización ';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE SWITF IS 'HISTORICO_PAGO_SWIFT';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN SWITF.CODBCO IS 'Código Banco';
LABEL ON COLUMN SWITF.NUMREF IS 'Número Referencia';
LABEL ON COLUMN SWITF.FRMSWF IS 'Formato Swift';
LABEL ON COLUMN SWITF.FECOPE IS 'Fecha Operación';
LABEL ON COLUMN SWITF.MNTPAG IS 'Monto';
LABEL ON COLUMN SWITF.BNFPAG IS 'Beneficiario';
LABEL ON COLUMN SWITF.BCODST IS 'Banco Destino';
LABEL ON COLUMN SWITF.CNLPAG IS 'Canal Pago';
LABEL ON COLUMN SWITF.ESTPAG IS 'Estado Pago';
LABEL ON COLUMN SWITF.VERREG IS 'Versión Registro';
LABEL ON COLUMN SWITF.OBSREG IS 'Observaciones';
LABEL ON COLUMN SWITF.ESTREG IS 'Estado Registro';
LABEL ON COLUMN SWITF.USRING IS 'Usuario Creación';
LABEL ON COLUMN SWITF.FECING IS 'Fecha Creación';
LABEL ON COLUMN SWITF.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN SWITF.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN SWITF.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN SWITF.NUMREF TEXT IS 'Número Referencia';
LABEL ON COLUMN SWITF.FRMSWF TEXT IS 'Formato Swift';
LABEL ON COLUMN SWITF.FECOPE TEXT IS 'Fecha Operación';
LABEL ON COLUMN SWITF.MNTPAG TEXT IS 'Monto';
LABEL ON COLUMN SWITF.BNFPAG TEXT IS 'Beneficiario';
LABEL ON COLUMN SWITF.BCODST TEXT IS 'Banco Destino';
LABEL ON COLUMN SWITF.CNLPAG TEXT IS 'Canal Pago';
LABEL ON COLUMN SWITF.ESTPAG TEXT IS 'Estado Pago';
LABEL ON COLUMN SWITF.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN SWITF.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN SWITF.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN SWITF.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN SWITF.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN SWITF.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN SWITF.FECACT TEXT IS 'Fecha Actualiza';