--======================================================================
-- Nombre de la Tabla : POTLX - ORDENES_PAGO_TELEX
--
-- DESCRIPCIÓN:
-- Órdenes de Pago vía Télex. Registra las órdenes de pago procesadas
-- mediante el protocolo Télex.
--
-- Objetivo:
-- Mantener el catálogo de órdenes de pago Télex.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Procesamiento de pagos vía Télex.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Control de pagos por Télex.
--
-- Restricciones:
-- PK sobre banco, moneda, cliente, tipo, cuenta y referencia.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-21
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE POTLX (

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

    FECHA_OPERACION FOR COLUMN FECOPE DATE
                        NOT NULL DEFAULT '0001-01-01',

    MONTO_ORDEN FOR COLUMN MNTORD DECIMAL(18, 2)
                    NOT NULL DEFAULT 0,

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

    CONSTRAINT POTLX_PK PRIMARY KEY 
    (CODBCO, CODMON, NUMCLI, TIPREG, NUMCTA, NUMREF),

    CONSTRAINT POTLX_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RPOTLX;

RENAME TABLE POTLX
TO ORDENES_PAGO_TELEX
FOR SYSTEM NAME POTLX;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE POTLX IS
'ORDENES_PAGO_TELEX';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN POTLX.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN POTLX.CODMON IS
'Código de la moneda.';

COMMENT ON COLUMN POTLX.NUMCLI IS
'Número del cliente.';

COMMENT ON COLUMN POTLX.TIPREG IS
'Tipo de registro.';

COMMENT ON COLUMN POTLX.NUMCTA IS
'Número de cuenta.';

COMMENT ON COLUMN POTLX.NUMREF IS
'Número de referencia.';

COMMENT ON COLUMN POTLX.FECOPE IS
'Fecha de la operación.';

COMMENT ON COLUMN POTLX.MNTORD IS
'Monto de la orden.';

COMMENT ON COLUMN POTLX.BNFPAG IS
'Beneficiario del pago.';

COMMENT ON COLUMN POTLX.BCODST IS
'Banco de destino.';

COMMENT ON COLUMN POTLX.CNLPAG IS
'Canal de pago utilizado.';

COMMENT ON COLUMN POTLX.ESTPAG IS
'Estado del pago.';

COMMENT ON COLUMN POTLX.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN POTLX.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN POTLX.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN POTLX.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN POTLX.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN POTLX.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN POTLX.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE POTLX IS 'ORDENES_PAGO_TELEX';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN POTLX.CODBCO IS 'Código Banco';
LABEL ON COLUMN POTLX.CODMON IS 'Código Moneda';
LABEL ON COLUMN POTLX.NUMCLI IS 'Número Cliente';
LABEL ON COLUMN POTLX.TIPREG IS 'Tipo Registro';
LABEL ON COLUMN POTLX.NUMCTA IS 'Número Cuenta';
LABEL ON COLUMN POTLX.NUMREF IS 'Número Referencia';
LABEL ON COLUMN POTLX.FECOPE IS 'Fecha Operación';
LABEL ON COLUMN POTLX.MNTORD IS 'Monto';
LABEL ON COLUMN POTLX.BNFPAG IS 'Beneficiario';
LABEL ON COLUMN POTLX.BCODST IS 'Banco Destino';
LABEL ON COLUMN POTLX.CNLPAG IS 'Canal Pago';
LABEL ON COLUMN POTLX.ESTPAG IS 'Estado Pago';
LABEL ON COLUMN POTLX.VERREG IS 'Versión Registro';
LABEL ON COLUMN POTLX.OBSREG IS 'Observaciones';
LABEL ON COLUMN POTLX.ESTREG IS 'Estado Registro';
LABEL ON COLUMN POTLX.USRING IS 'Usuario Creación';
LABEL ON COLUMN POTLX.FECING IS 'Fecha Creación';
LABEL ON COLUMN POTLX.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN POTLX.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN POTLX.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN POTLX.CODMON TEXT IS 'Código Moneda';
LABEL ON COLUMN POTLX.NUMCLI TEXT IS 'Número Cliente';
LABEL ON COLUMN POTLX.TIPREG TEXT IS 'Tipo Registro';
LABEL ON COLUMN POTLX.NUMCTA TEXT IS 'Número Cuenta';
LABEL ON COLUMN POTLX.NUMREF TEXT IS 'Número Referencia';
LABEL ON COLUMN POTLX.FECOPE TEXT IS 'Fecha Operación';
LABEL ON COLUMN POTLX.MNTORD TEXT IS 'Monto';
LABEL ON COLUMN POTLX.BNFPAG TEXT IS 'Beneficiario';
LABEL ON COLUMN POTLX.BCODST TEXT IS 'Banco Destino';
LABEL ON COLUMN POTLX.CNLPAG TEXT IS 'Canal Pago';
LABEL ON COLUMN POTLX.ESTPAG TEXT IS 'Estado Pago';
LABEL ON COLUMN POTLX.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN POTLX.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN POTLX.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN POTLX.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN POTLX.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN POTLX.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN POTLX.FECACT TEXT IS 'Fecha Actualiza';
