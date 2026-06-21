--======================================================================
-- Nombre de la Tabla : POSWF - ORDENES_PAGO_SWIFT
--
-- DESCRIPCIÓN:
-- Órdenes de Pago vía Swift. Registra las órdenes de pago procesadas
-- mediante el protocolo Swift.
--
-- Objetivo:
-- Mantener el catálogo de órdenes de pago Swift.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Procesamiento de pagos internacionales vía Swift.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Control de pagos internacionales.
--
-- Restricciones:
-- PK sobre banco, moneda, cliente, tipo, cuenta, referencia y monto.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-21
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE POSWF (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    CODIGO_MONEDA FOR COLUMN CODMON CHAR(3)
                        NOT NULL,

    NUM_CLIENTE FOR COLUMN NUMCLI VARCHAR(30)
                        NOT NULL,

    TIPO_REGISTRO FOR COLUMN TIPREG VARCHAR(20)
                           NOT NULL,

    NUMERO_CUENTA FOR COLUMN NUMCTA VARCHAR(24)
                      NOT NULL,

    NUMERO_REFERENCIA FOR COLUMN NUMREF VARCHAR(30)
                              NOT NULL,

    MONTO_ORDEN FOR COLUMN MNTORD DECIMAL(18, 2)
                    NOT NULL,

    FECHA_OPERACION FOR COLUMN FECOPE DATE
                        NOT NULL DEFAULT '0001-01-01',

    BENEFICIARIO_PAGO FOR COLUMN BNFPAG VARCHAR(80)
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

    CONSTRAINT POSWF_PK PRIMARY KEY 
    (CODBCO, CODMON, NUMCLI, TIPREG, NUMCTA, NUMREF, MNTORD),

    CONSTRAINT POSWF_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RPOSWF;

RENAME TABLE POSWF
TO ORDENES_PAGO_SWIFT
FOR SYSTEM NAME POSWF;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE POSWF IS
'ORDENES_PAGO_SWIFT';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN POSWF.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN POSWF.CODMON IS
'Código de la moneda.';

COMMENT ON COLUMN POSWF.NUMCLI IS
'Número del cliente.';

COMMENT ON COLUMN POSWF.TIPREG IS
'Tipo de registro.';

COMMENT ON COLUMN POSWF.NUMCTA IS
'Número de cuenta.';

COMMENT ON COLUMN POSWF.NUMREF IS
'Número de referencia.';

COMMENT ON COLUMN POSWF.MNTORD IS
'Monto de la orden.';

COMMENT ON COLUMN POSWF.FECOPE IS
'Fecha de la operación.';

COMMENT ON COLUMN POSWF.BNFPAG IS
'Beneficiario del pago.';

COMMENT ON COLUMN POSWF.BCODST IS
'Banco de destino.';

COMMENT ON COLUMN POSWF.CNLPAG IS
'Canal de pago utilizado.';

COMMENT ON COLUMN POSWF.ESTPAG IS
'Estado del pago.';

COMMENT ON COLUMN POSWF.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN POSWF.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN POSWF.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN POSWF.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN POSWF.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN POSWF.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN POSWF.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE POSWF IS 'ORDENES_PAGO_SWIFT';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN POSWF.CODBCO IS 'Código Banco';
LABEL ON COLUMN POSWF.CODMON IS 'Código Moneda';
LABEL ON COLUMN POSWF.NUMCLI IS 'Número Cliente';
LABEL ON COLUMN POSWF.TIPREG IS 'Tipo Registro';
LABEL ON COLUMN POSWF.NUMCTA IS 'Número Cuenta';
LABEL ON COLUMN POSWF.NUMREF IS 'Número Referencia';
LABEL ON COLUMN POSWF.MNTORD IS 'Monto';
LABEL ON COLUMN POSWF.FECOPE IS 'Fecha Operación';
LABEL ON COLUMN POSWF.BNFPAG IS 'Beneficiario';
LABEL ON COLUMN POSWF.BCODST IS 'Banco Destino';
LABEL ON COLUMN POSWF.CNLPAG IS 'Canal Pago';
LABEL ON COLUMN POSWF.ESTPAG IS 'Estado Pago';
LABEL ON COLUMN POSWF.VERREG IS 'Versión Registro';
LABEL ON COLUMN POSWF.OBSREG IS 'Observaciones';
LABEL ON COLUMN POSWF.ESTREG IS 'Estado Registro';
LABEL ON COLUMN POSWF.USRING IS 'Usuario Creación';
LABEL ON COLUMN POSWF.FECING IS 'Fecha Creación';
LABEL ON COLUMN POSWF.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN POSWF.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN POSWF.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN POSWF.CODMON TEXT IS 'Código Moneda';
LABEL ON COLUMN POSWF.NUMCLI TEXT IS 'Número Cliente';
LABEL ON COLUMN POSWF.TIPREG TEXT IS 'Tipo Registro';
LABEL ON COLUMN POSWF.NUMCTA TEXT IS 'Número Cuenta';
LABEL ON COLUMN POSWF.NUMREF TEXT IS 'Número Referencia';
LABEL ON COLUMN POSWF.MNTORD TEXT IS 'Monto';
LABEL ON COLUMN POSWF.FECOPE TEXT IS 'Fecha Operación';
LABEL ON COLUMN POSWF.BNFPAG TEXT IS 'Beneficiario';
LABEL ON COLUMN POSWF.BCODST TEXT IS 'Banco Destino';
LABEL ON COLUMN POSWF.CNLPAG TEXT IS 'Canal Pago';
LABEL ON COLUMN POSWF.ESTPAG TEXT IS 'Estado Pago';
LABEL ON COLUMN POSWF.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN POSWF.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN POSWF.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN POSWF.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN POSWF.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN POSWF.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN POSWF.FECACT TEXT IS 'Fecha Actualiza';
