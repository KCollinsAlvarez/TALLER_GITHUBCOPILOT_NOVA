--======================================================================
-- Nombre de la Tabla : POFED - ORDENES_DE_PAGO
--
-- DESCRIPCIÓN:
-- Órdenes de Pago. Registra las órdenes de pago generadas en el
-- sistema.
--
-- Objetivo:
-- Mantener el catálogo de órdenes de pago.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Procesos de generación de órdenes de pago.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Procesamiento y control de pagos.
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

CREATE OR REPLACE TABLE POFED (

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

    CONSTRAINT POFED_PK PRIMARY KEY 
    (CODBCO, CODMON, NUMCLI, TIPREG, NUMCTA, NUMREF),

    CONSTRAINT POFED_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RPOFED;

RENAME TABLE POFED
TO ORDENES_DE_PAGO
FOR SYSTEM NAME POFED;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE POFED IS
'ORDENES_DE_PAGO';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN POFED.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN POFED.CODMON IS
'Código de la moneda.';

COMMENT ON COLUMN POFED.NUMCLI IS
'Número del cliente.';

COMMENT ON COLUMN POFED.TIPREG IS
'Tipo de registro.';

COMMENT ON COLUMN POFED.NUMCTA IS
'Número de cuenta.';

COMMENT ON COLUMN POFED.NUMREF IS
'Número de referencia.';

COMMENT ON COLUMN POFED.FECOPE IS
'Fecha de la operación.';

COMMENT ON COLUMN POFED.MNTORD IS
'Monto de la orden.';

COMMENT ON COLUMN POFED.BNFPAG IS
'Beneficiario del pago.';

COMMENT ON COLUMN POFED.BCODST IS
'Banco de destino.';

COMMENT ON COLUMN POFED.CNLPAG IS
'Canal de pago utilizado.';

COMMENT ON COLUMN POFED.ESTPAG IS
'Estado del pago.';

COMMENT ON COLUMN POFED.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN POFED.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN POFED.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN POFED.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN POFED.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN POFED.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN POFED.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE POFED IS 'ORDENES_DE_PAGO';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN POFED.CODBCO IS 'Código Banco';
LABEL ON COLUMN POFED.CODMON IS 'Código Moneda';
LABEL ON COLUMN POFED.NUMCLI IS 'Número Cliente';
LABEL ON COLUMN POFED.TIPREG IS 'Tipo Registro';
LABEL ON COLUMN POFED.NUMCTA IS 'Número Cuenta';
LABEL ON COLUMN POFED.NUMREF IS 'Número Referencia';
LABEL ON COLUMN POFED.FECOPE IS 'Fecha Operación';
LABEL ON COLUMN POFED.MNTORD IS 'Monto';
LABEL ON COLUMN POFED.BNFPAG IS 'Beneficiario';
LABEL ON COLUMN POFED.BCODST IS 'Banco Destino';
LABEL ON COLUMN POFED.CNLPAG IS 'Canal Pago';
LABEL ON COLUMN POFED.ESTPAG IS 'Estado Pago';
LABEL ON COLUMN POFED.VERREG IS 'Versión Registro';
LABEL ON COLUMN POFED.OBSREG IS 'Observaciones';
LABEL ON COLUMN POFED.ESTREG IS 'Estado Registro';
LABEL ON COLUMN POFED.USRING IS 'Usuario Creación';
LABEL ON COLUMN POFED.FECING IS 'Fecha Creación';
LABEL ON COLUMN POFED.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN POFED.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN POFED.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN POFED.CODMON TEXT IS 'Código Moneda';
LABEL ON COLUMN POFED.NUMCLI TEXT IS 'Número Cliente';
LABEL ON COLUMN POFED.TIPREG TEXT IS 'Tipo Registro';
LABEL ON COLUMN POFED.NUMCTA TEXT IS 'Número Cuenta';
LABEL ON COLUMN POFED.NUMREF TEXT IS 'Número Referencia';
LABEL ON COLUMN POFED.FECOPE TEXT IS 'Fecha Operación';
LABEL ON COLUMN POFED.MNTORD TEXT IS 'Monto';
LABEL ON COLUMN POFED.BNFPAG TEXT IS 'Beneficiario';
LABEL ON COLUMN POFED.BCODST TEXT IS 'Banco Destino';
LABEL ON COLUMN POFED.CNLPAG TEXT IS 'Canal Pago';
LABEL ON COLUMN POFED.ESTPAG TEXT IS 'Estado Pago';
LABEL ON COLUMN POFED.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN POFED.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN POFED.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN POFED.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN POFED.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN POFED.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN POFED.FECACT TEXT IS 'Fecha Actualiza';