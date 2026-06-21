--======================================================================
-- Nombre de la Tabla : UNCOL - MAESTRO_RETENCIONES
--
-- DESCRIPCIÓN:
-- Maestro de Retenciones. Registra las retenciones por banco,
-- sucursal y cuenta con información de saldos y estado.
--
-- Objetivo:
-- Centralizar el registro de retenciones para control de fondos
-- retenidos.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Operaciones de retención de fondos en cuentas.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte para reportes de retenciones y conciliación de cuentas.
--
-- Restricciones:
-- PK técnica sobre codigo_banco, codigo_sucursal, numero_cuenta.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-17
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE UNCOL (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    CODIGO_SUCURSAL FOR COLUMN CODSUC VARCHAR(20)
                        NOT NULL,

    NUMERO_CUENTA FOR COLUMN NUMCTA VARCHAR(24)
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

    CONSTRAINT UNCOL_PK PRIMARY KEY (CODBCO, CODSUC, NUMCTA),

    CONSTRAINT UNCOL_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RUNCOL;

RENAME TABLE UNCOL
TO MAESTRO_RETENCIONES
FOR SYSTEM NAME UNCOL;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE UNCOL IS
'MAESTRO_RETENCIONES';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN UNCOL.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN UNCOL.CODSUC IS
'Código de la sucursal.';

COMMENT ON COLUMN UNCOL.NUMCTA IS
'Número de cuenta con retención.';

COMMENT ON COLUMN UNCOL.FECAPR IS
'Fecha de apertura de la retención.';

COMMENT ON COLUMN UNCOL.FECULTTRN IS
'Fecha de la última transacción.';

COMMENT ON COLUMN UNCOL.SLDACT IS
'Saldo actual de retención.';

COMMENT ON COLUMN UNCOL.SLDDIP IS
'Saldo disponible de retención.';

COMMENT ON COLUMN UNCOL.LIMSBR IS
'Límite de sobregiro.';

COMMENT ON COLUMN UNCOL.ESTCTA IS
'Estado de la cuenta de retención.';

COMMENT ON COLUMN UNCOL.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN UNCOL.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN UNCOL.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN UNCOL.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN UNCOL.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN UNCOL.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN UNCOL.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE UNCOL IS 'MAESTRO_RETENCIONES';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN UNCOL.CODBCO IS 'Código Banco';
LABEL ON COLUMN UNCOL.CODSUC IS 'Código Sucursal';
LABEL ON COLUMN UNCOL.NUMCTA IS 'Número Cuenta';
LABEL ON COLUMN UNCOL.FECAPR IS 'Fecha Apertura';
LABEL ON COLUMN UNCOL.FECULTTRN IS 'Fecha Última Transacción';
LABEL ON COLUMN UNCOL.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN UNCOL.SLDDIP IS 'Saldo Disponible';
LABEL ON COLUMN UNCOL.LIMSBR IS 'Límite Sobregiro';
LABEL ON COLUMN UNCOL.ESTCTA IS 'Estado Cuenta';
LABEL ON COLUMN UNCOL.VERREG IS 'Versión Registro';
LABEL ON COLUMN UNCOL.OBSREG IS 'Observaciones';
LABEL ON COLUMN UNCOL.ESTREG IS 'Estado Registro';
LABEL ON COLUMN UNCOL.USRING IS 'Usuario Creación';
LABEL ON COLUMN UNCOL.FECING IS 'Fecha Creación';
LABEL ON COLUMN UNCOL.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN UNCOL.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN UNCOL.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN UNCOL.CODSUC TEXT IS 'Código Sucursal';
LABEL ON COLUMN UNCOL.NUMCTA TEXT IS 'Número Cuenta';
LABEL ON COLUMN UNCOL.FECAPR TEXT IS 'Fecha Apertura';
LABEL ON COLUMN UNCOL.FECULTTRN TEXT IS 'Fecha Última Transacción';
LABEL ON COLUMN UNCOL.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN UNCOL.SLDDIP TEXT IS 'Saldo Disponible';
LABEL ON COLUMN UNCOL.LIMSBR TEXT IS 'Límite Sobregiro';
LABEL ON COLUMN UNCOL.ESTCTA TEXT IS 'Estado Cuenta';
LABEL ON COLUMN UNCOL.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN UNCOL.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN UNCOL.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN UNCOL.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN UNCOL.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN UNCOL.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN UNCOL.FECACT TEXT IS 'Fecha Actualiza';
