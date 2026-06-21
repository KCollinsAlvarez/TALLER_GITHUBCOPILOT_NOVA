--======================================================================
-- Nombre de la Tabla : FIWRT - TRANS_HISTOR_PAGO
--
-- DESCRIPCIÓN:
-- Transacciones Históricas de Pagos y Recibos. Registra el histórico
-- de todas las transacciones de pago.
--
-- Objetivo:
-- Mantener el histórico de pagos y recibos.
--
-- Tipo de Tabla:
-- Histórico.
--
-- Origen de los Datos:
-- Operaciones de pago y transferencias.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Reportes y auditoría de pagos.
--
-- Restricciones:
-- PK sobre banco y número de transferencia.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-21
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE FIWRT (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    NUMERO_TRANSFERENCIA FOR COLUMN NUMTRN VARCHAR(30)
                                 NOT NULL,

    FECHA_OPERACION FOR COLUMN FECOPE DATE
                        NOT NULL DEFAULT '0001-01-01',

    MONTO_TRANSACCION FOR COLUMN MNTTRN DECIMAL(18, 2)
                    NOT NULL DEFAULT 0,

    BENEFICIARIO_PAGO FOR COLUMN BNFOAG VARCHAR(80)
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

    CONSTRAINT FIWRT_PK PRIMARY KEY (CODBCO, NUMTRN),

    CONSTRAINT FIWRT_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RFIWRT;

RENAME TABLE FIWRT
TO TRANS_HISTOR_PAGO
FOR SYSTEM NAME FIWRT;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE FIWRT IS
'TRANS_HISTOR_PAGO';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN FIWRT.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN FIWRT.NUMTRN IS
'Número de transferencia.';

COMMENT ON COLUMN FIWRT.FECOPE IS
'Fecha de la operación.';

COMMENT ON COLUMN FIWRT.MNTTRN IS
'Monto de la transacción.';

COMMENT ON COLUMN FIWRT.BNFOAG IS
'Beneficiario del pago.';

COMMENT ON COLUMN FIWRT.BCODST IS
'Banco de destino.';

COMMENT ON COLUMN FIWRT.CNLPAG IS
'Canal de pago utilizado.';

COMMENT ON COLUMN FIWRT.ESTPAG IS
'Estado del pago.';

COMMENT ON COLUMN FIWRT.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN FIWRT.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN FIWRT.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN FIWRT.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN FIWRT.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN FIWRT.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN FIWRT.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE FIWRT IS 'TRANS_HISTOR_PAGO';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN FIWRT.CODBCO IS 'Código Banco';
LABEL ON COLUMN FIWRT.NUMTRN IS 'Número Transferencia';
LABEL ON COLUMN FIWRT.FECOPE IS 'Fecha Operación';
LABEL ON COLUMN FIWRT.MNTTRN IS 'Monto';
LABEL ON COLUMN FIWRT.BNFOAG IS 'Beneficiario';
LABEL ON COLUMN FIWRT.BCODST IS 'Banco Destino';
LABEL ON COLUMN FIWRT.CNLPAG IS 'Canal Pago';
LABEL ON COLUMN FIWRT.ESTPAG IS 'Estado Pago';
LABEL ON COLUMN FIWRT.VERREG IS 'Versión Registro';
LABEL ON COLUMN FIWRT.OBSREG IS 'Observaciones';
LABEL ON COLUMN FIWRT.ESTREG IS 'Estado Registro';
LABEL ON COLUMN FIWRT.USRING IS 'Usuario Creación';
LABEL ON COLUMN FIWRT.FECING IS 'Fecha Creación';
LABEL ON COLUMN FIWRT.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN FIWRT.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN FIWRT.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN FIWRT.NUMTRN TEXT IS 'Número Transferencia';
LABEL ON COLUMN FIWRT.FECOPE TEXT IS 'Fecha Operación';
LABEL ON COLUMN FIWRT.MNTTRN TEXT IS 'Monto';
LABEL ON COLUMN FIWRT.BNFOAG TEXT IS 'Beneficiario';
LABEL ON COLUMN FIWRT.BCODST TEXT IS 'Banco Destino';
LABEL ON COLUMN FIWRT.CNLPAG TEXT IS 'Canal Pago';
LABEL ON COLUMN FIWRT.ESTPAG TEXT IS 'Estado Pago';
LABEL ON COLUMN FIWRT.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN FIWRT.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN FIWRT.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN FIWRT.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN FIWRT.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN FIWRT.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN FIWRT.FECACT TEXT IS 'Fecha Actualiza';
