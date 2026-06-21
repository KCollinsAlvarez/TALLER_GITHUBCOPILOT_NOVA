--======================================================================
-- Nombre de la Tabla : TDRCR - MAESTRO_TRANS_CAJERO
--
-- DESCRIPCIÓN:
-- Maestro de Transacciones de Cajero. Registra los tipos de transacción
-- soportados por el sistema de cajas.
--
-- Objetivo:
-- Mantener catálogo de códigos de transacción para caja.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Definición de transacciones de cajero.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Validación y parametrización de operaciones de caja.
--
-- Restricciones:
-- PK sobre codigo_de_transaccion.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-17
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE TDRCR (

    CODIGO_TRANSACCION FOR COLUMN CODTRN VARCHAR(20)
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

    CONSTRAINT TDRCR_PK PRIMARY KEY (CODTRN),

    CONSTRAINT TDRCR_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RTDRCR;

RENAME TABLE TDRCR
TO MAESTRO_TRANS_CAJERO
FOR SYSTEM NAME TDRCR;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE TDRCR IS
'MAESTRO_TRANS_CAJERO';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN TDRCR.CODTRN IS
'Código de la transacción de cajero.';

COMMENT ON COLUMN TDRCR.FECAPR IS
'Fecha de apertura del registro.';

COMMENT ON COLUMN TDRCR.FECULTTRN IS
'Fecha de la última transacción registrada.';

COMMENT ON COLUMN TDRCR.SLDACT IS
'Saldo actual asociado al código de transacción.';

COMMENT ON COLUMN TDRCR.SLDDIP IS
'Saldo disponible asociado al código de transacción.';

COMMENT ON COLUMN TDRCR.LIMSBR IS
'Límite de sobregiro asociado al código de transacción.';

COMMENT ON COLUMN TDRCR.ESTCTA IS
'Estado de cuenta para la transacción.';

COMMENT ON COLUMN TDRCR.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN TDRCR.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN TDRCR.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN TDRCR.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN TDRCR.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN TDRCR.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN TDRCR.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE TDRCR IS 'MAESTRO_TRANS_CAJERO';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN TDRCR.CODTRN IS 'Código Transacción';
LABEL ON COLUMN TDRCR.FECAPR IS 'Fecha Apertura';
LABEL ON COLUMN TDRCR.FECULTTRN IS 'Fecha Última Transacción';
LABEL ON COLUMN TDRCR.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN TDRCR.SLDDIP IS 'Saldo Disponible';
LABEL ON COLUMN TDRCR.LIMSBR IS 'Límite Sobregiro';
LABEL ON COLUMN TDRCR.ESTCTA IS 'Estado Cuenta';
LABEL ON COLUMN TDRCR.VERREG IS 'Versión Registro';
LABEL ON COLUMN TDRCR.OBSREG IS 'Observaciones';
LABEL ON COLUMN TDRCR.ESTREG IS 'Estado Registro';
LABEL ON COLUMN TDRCR.USRING IS 'Usuario Creación';
LABEL ON COLUMN TDRCR.FECING IS 'Fecha Creación';
LABEL ON COLUMN TDRCR.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN TDRCR.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN TDRCR.CODTRN TEXT IS 'Código Transacción';
LABEL ON COLUMN TDRCR.FECAPR TEXT IS 'Fecha Apertura';
LABEL ON COLUMN TDRCR.FECULTTRN TEXT IS 'Fecha Última Transacción';
LABEL ON COLUMN TDRCR.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN TDRCR.SLDDIP TEXT IS 'Saldo Disponible';
LABEL ON COLUMN TDRCR.LIMSBR TEXT IS 'Límite Sobregiro';
LABEL ON COLUMN TDRCR.ESTCTA TEXT IS 'Estado Cuenta';
LABEL ON COLUMN TDRCR.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN TDRCR.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN TDRCR.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN TDRCR.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN TDRCR.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN TDRCR.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN TDRCR.FECACT TEXT IS 'Fecha Actualiza';