--======================================================================
-- Nombre de la Tabla : CHSTS - CAMB_ESTATUS_CTA_DET
--
-- DESCRIPCIÓN:
-- Maestro de cambio de estatus a cuentas de detalle. Registra los cambios
-- de estado para cuentas de detalle en el sistema.
--
-- Objetivo:
-- Mantener el histórico de estatus aplicable a cuentas de detalle.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Procesos de cambio de estatus de cuenta.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Control de estatus y validaciones de cuentas de detalle.
--
-- Restricciones:
-- PK sobre banco, sucursal, moneda, cuenta contable y cuenta.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-17
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CHSTS (

    CODIGO_BANCO FOR COLUMN CODBCO VARCHAR(20)
                     NOT NULL,

    CODIGO_SUCURSAL FOR COLUMN CODSUC VARCHAR(20)
                        NOT NULL,

    CODIGO_MONEDA FOR COLUMN CODMON VARCHAR(20)
                       NOT NULL,

    CUENTA_CONTABLE FOR COLUMN CTACNT VARCHAR(24)
                          NOT NULL,

    NUMERO_CUENTA FOR COLUMN NUMCTA VARCHAR(24)
                      NOT NULL,

    FECHA_APERTURA FOR COLUMN FECAPR DATE
                        NOT NULL DEFAULT '0001-01-01',

    FECHA_ULTIMA_TRANSACCION FOR COLUMN FECULTTRN DATE
                                      NOT NULL DEFAULT '0001-01-01',

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                     NOT NULL DEFAULT 0,

    SALDO_DISPONIBLE FOR COLUMN SLDDSP DECIMAL(18, 2)
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

    CONSTRAINT CHSTS_PK PRIMARY KEY 
    (CODBCO, CODSUC, CODMON, CTACNT, NUMCTA),

    CONSTRAINT CHSTS_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCHSTS;

RENAME TABLE CHSTS
TO CAMB_ESTATUS_CTA_DET
FOR SYSTEM NAME CHSTS;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CHSTS IS
'CAMB_ESTATUS_CTA_DET';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CHSTS.CODBCO IS 'Código del banco.';

COMMENT ON COLUMN CHSTS.CODSUC IS 'Código de la sucursal.';

COMMENT ON COLUMN CHSTS.CODMON IS 'Código de la moneda.';

COMMENT ON COLUMN CHSTS.CTACNT IS
'Cuenta contable asociada al cambio de estatus.';

COMMENT ON COLUMN CHSTS.NUMCTA IS
'Número de cuenta de detalle asociada.';

COMMENT ON COLUMN CHSTS.FECAPR IS
'Fecha de apertura del registro.';

COMMENT ON COLUMN CHSTS.FECULTTRN IS
'Fecha de la última transacción registrada.';

COMMENT ON COLUMN CHSTS.SLDACT IS
'Saldo actual de la cuenta.';

COMMENT ON COLUMN CHSTS.SLDDSP IS
'Saldo disponible de la cuenta.';

COMMENT ON COLUMN CHSTS.LIMSBR IS
'Límite de sobregiro de la cuenta.';

COMMENT ON COLUMN CHSTS.ESTCTA IS
'Estado actual de la cuenta.';

COMMENT ON COLUMN CHSTS.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN CHSTS.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN CHSTS.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN CHSTS.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN CHSTS.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN CHSTS.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN CHSTS.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CHSTS IS 'CAMB_ESTATUS_CTA_DET';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CHSTS.CODBCO IS 'Código Banco';
LABEL ON COLUMN CHSTS.CODSUC IS 'Código Sucursal';
LABEL ON COLUMN CHSTS.CODMON IS 'Código Moneda';
LABEL ON COLUMN CHSTS.CTACNT IS 'Cuenta Contable';
LABEL ON COLUMN CHSTS.NUMCTA IS 'Número Cuenta';
LABEL ON COLUMN CHSTS.FECAPR IS 'Fecha Apertura';
LABEL ON COLUMN CHSTS.FECULTTRN IS 'Fecha Última Transacción';
LABEL ON COLUMN CHSTS.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN CHSTS.SLDDSP IS 'Saldo Disponible';
LABEL ON COLUMN CHSTS.LIMSBR IS 'Límite Sobregiro';
LABEL ON COLUMN CHSTS.ESTCTA IS 'Estado Cuenta';
LABEL ON COLUMN CHSTS.VERREG IS 'Versión Registro';
LABEL ON COLUMN CHSTS.OBSREG IS 'Observaciones';
LABEL ON COLUMN CHSTS.ESTREG IS 'Estado Registro';
LABEL ON COLUMN CHSTS.USRING IS 'Usuario Creación';
LABEL ON COLUMN CHSTS.FECING IS 'Fecha Creación';
LABEL ON COLUMN CHSTS.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN CHSTS.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CHSTS.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN CHSTS.CODSUC TEXT IS 'Código Sucursal';
LABEL ON COLUMN CHSTS.CODMON TEXT IS 'Código Moneda';
LABEL ON COLUMN CHSTS.CTACNT TEXT IS 'Cuenta Contable';
LABEL ON COLUMN CHSTS.NUMCTA TEXT IS 'Número Cuenta';
LABEL ON COLUMN CHSTS.FECAPR TEXT IS 'Fecha Apertura';
LABEL ON COLUMN CHSTS.FECULTTRN TEXT IS 'Fecha Última Transacción';
LABEL ON COLUMN CHSTS.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN CHSTS.SLDDSP TEXT IS 'Saldo Disponible';
LABEL ON COLUMN CHSTS.LIMSBR TEXT IS 'Límite Sobregiro';
LABEL ON COLUMN CHSTS.ESTCTA TEXT IS 'Estado Cuenta';
LABEL ON COLUMN CHSTS.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN CHSTS.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN CHSTS.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN CHSTS.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN CHSTS.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN CHSTS.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN CHSTS.FECACT TEXT IS 'Fecha Actualiza';