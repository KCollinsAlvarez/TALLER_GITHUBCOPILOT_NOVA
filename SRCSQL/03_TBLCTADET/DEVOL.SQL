--======================================================================
-- Nombre de la Tabla : DEVOL - DET_CHEQUE_DEVUELTO
--
-- DESCRIPCIÓN:
-- Detalle de Cheques devueltos. Registra cheques rechazados por bancos.
--
-- Objetivo:
-- Documentar las devoluciones de cheques y su seguimiento.
--
-- Tipo de Tabla:
-- Detalle.
--
-- Origen de los Datos:
-- Procesos de cobros y conciliación bancaria.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Control de cheques devueltos, informes y conciliación.
--
-- Restricciones:
-- PK sobre número de cuenta y número de cheque.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-17
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE DEVOL (

    NUMERO_CUENTA FOR COLUMN NUMCTA VARCHAR(24)
                      NOT NULL,

    NUMERO_CHEQUE FOR COLUMN NUMCHQ VARCHAR(30)
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

    CONSTRAINT DEVOL_PK PRIMARY KEY (NUMCTA, NUMCHQ),

    CONSTRAINT DEVOL_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RDEVOL;

RENAME TABLE DEVOL
TO DET_CHEQUE_DEVUELTO
FOR SYSTEM NAME DEVOL;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE DEVOL IS
'DET_CHEQUE_DEVUELTO';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN DEVOL.NUMCTA IS
'Número de cuenta asociada al cheque devuelto.';

COMMENT ON COLUMN DEVOL.NUMCHQ IS
'Número del cheque devuelto.';

COMMENT ON COLUMN DEVOL.FECAPR IS
'Fecha de apertura del registro.';

COMMENT ON COLUMN DEVOL.FECULTTRN IS
'Fecha de la última transacción registrada.';

COMMENT ON COLUMN DEVOL.SLDACT IS
'Saldo actual del registro.';

COMMENT ON COLUMN DEVOL.SLDDIP IS
'Saldo disponible del registro.';

COMMENT ON COLUMN DEVOL.LIMSBR IS
'Límite de sobregiro relacionado.';

COMMENT ON COLUMN DEVOL.ESTCTA IS
'Estado de la cuenta relacionada.';

COMMENT ON COLUMN DEVOL.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN DEVOL.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN DEVOL.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN DEVOL.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN DEVOL.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN DEVOL.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN DEVOL.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE DEVOL IS 'DET_CHEQUE_DEVUELTO';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN DEVOL.NUMCTA IS 'Número Cuenta';
LABEL ON COLUMN DEVOL.NUMCHQ IS 'Número Cheque';
LABEL ON COLUMN DEVOL.FECAPR IS 'Fecha Apertura';
LABEL ON COLUMN DEVOL.FECULTTRN IS 'Fecha Última Transacción';
LABEL ON COLUMN DEVOL.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN DEVOL.SLDDIP IS 'Saldo Disponible';
LABEL ON COLUMN DEVOL.LIMSBR IS 'Límite Sobregiro';
LABEL ON COLUMN DEVOL.ESTCTA IS 'Estado Cuenta';
LABEL ON COLUMN DEVOL.VERREG IS 'Versión Registro';
LABEL ON COLUMN DEVOL.OBSREG IS 'Observaciones';
LABEL ON COLUMN DEVOL.ESTREG IS 'Estado Registro';
LABEL ON COLUMN DEVOL.USRING IS 'Usuario Creación';
LABEL ON COLUMN DEVOL.FECING IS 'Fecha Creación';
LABEL ON COLUMN DEVOL.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN DEVOL.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN DEVOL.NUMCTA TEXT IS 'Número Cuenta';
LABEL ON COLUMN DEVOL.NUMCHQ TEXT IS 'Número Cheque';
LABEL ON COLUMN DEVOL.FECAPR TEXT IS 'Fecha Apertura';
LABEL ON COLUMN DEVOL.FECULTTRN TEXT IS 'Fecha Última Transacción';
LABEL ON COLUMN DEVOL.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN DEVOL.SLDDIP TEXT IS 'Saldo Disponible';
LABEL ON COLUMN DEVOL.LIMSBR TEXT IS 'Límite Sobregiro';
LABEL ON COLUMN DEVOL.ESTCTA TEXT IS 'Estado Cuenta';
LABEL ON COLUMN DEVOL.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN DEVOL.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN DEVOL.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN DEVOL.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN DEVOL.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN DEVOL.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN DEVOL.FECACT TEXT IS 'Fecha Actualiza';