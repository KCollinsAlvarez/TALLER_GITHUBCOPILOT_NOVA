--======================================================================
-- Nombre de la Tabla : CMRIN - CAMARA_ENTRANTE
--
-- DESCRIPCIÓN:
-- Detalle de Cámara Entrante. Registra los movimientos de cámara
-- entrante (cheques recibidos) por banco, sucursal, moneda, cuenta
-- y monto, incluyendo información de saldos y disponibilidades.
--
-- Objetivo:
-- Centralizar el registro detallado de operaciones de cámara
-- entrante para control y conciliación de cheques recibidos.
--
-- Tipo de Tabla:
-- Transaccional (Detalle).
--
-- Origen de los Datos:
-- Operaciones de recepción y procesamiento de cheques en cámara
-- de compensación.
--
-- Permanencia de Datos:
-- Permanente (histórico).
--
-- Uso de los Datos:
-- Base para procesos de compensación, conciliación y reportes
-- de cámara entrante.
--
-- Restricciones:
-- PK compuesta: codigo_banco, sucursal_moneda, numero_cuenta,
--   monto.
-- FK a ACMST.numero_cuenta (referencia a maestro de cuentas).
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-06
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CMRIN (

    CODIGO_BANCO FOR COLUMN CODBCO SMALLINT
                     NOT NULL,

    SUCURSAL_MONEDA FOR COLUMN SUCMON CHAR(3)
                        NOT NULL,

    NUMERO_CUENTA FOR COLUMN NUMCTA VARCHAR(24)
                      NOT NULL,

    MONTO_MOVIMIENTO FOR COLUMN MONMOV DECIMAL(18, 2)
              NOT NULL,

    FECHA_APERTURA FOR COLUMN FECAPR DATE
                       NOT NULL DEFAULT '0001-01-01',

    FECHA_ULTIMA_TRANS FOR COLUMN FECUTLTRN DATE
                        NOT NULL DEFAULT '0001-01-01',

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                    NOT NULL DEFAULT 0,

    SALDO_DISPONIBLE FOR COLUMN SLDDSP DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,

    LIMITE_SOBREGIRO FOR COLUMN LIMSBR DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,

    ESTADO_CUENTA FOR COLUMN ESTCTA VARCHAR(20)
                      NOT NULL DEFAULT '',

    OBSERVACIONES FOR COLUMN OBSREG VARCHAR(120)
                      NOT NULL DEFAULT '',

    VERSION_REGISTRO FOR COLUMN VERREG INTEGER
                         NOT NULL DEFAULT 1,

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

    CONSTRAINT CMRIN_PK PRIMARY KEY (CODBCO, SUCMON, NUMCTA, MONMOV),

    CONSTRAINT FK_CMRIN_ACMST FOREIGN KEY (NUMCTA)
        REFERENCES ACMST (NUMCTA),

    CONSTRAINT CMRIN_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCMRIN;

RENAME TABLE CMRIN
TO CAMARA_ENTRANTE
FOR SYSTEM NAME CMRIN;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CMRIN IS
'CAMARA_ENTRANTE';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CMRIN.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN CMRIN.SUCMON IS
'Sucursal y moneda.';

COMMENT ON COLUMN CMRIN.NUMCTA IS
'Número de cuenta.';

COMMENT ON COLUMN CMRIN.MONMOV IS
'Monto del movimiento.';

COMMENT ON COLUMN CMRIN.FECAPR IS
'Fecha de apertura de la operación de cámara.';

COMMENT ON COLUMN CMRIN.FECUTLTRN IS
'Fecha de la última transacción de cámara.';

COMMENT ON COLUMN CMRIN.SLDACT IS
'Saldo actual de la operación en cámara.';

COMMENT ON COLUMN CMRIN.SLDDSP IS
'Saldo disponible después de la compensación.';

COMMENT ON COLUMN CMRIN.LIMSBR IS
'Límite de sobregiro autorizado.';

COMMENT ON COLUMN CMRIN.ESTCTA IS
'Estado operativo de la operación en cámara.';

COMMENT ON COLUMN CMRIN.OBSREG IS
'Observaciones adicionales de la operación.';

COMMENT ON COLUMN CMRIN.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN CMRIN.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN CMRIN.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN CMRIN.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN CMRIN.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN CMRIN.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CMRIN IS 'CAMARA_ENTRANTE';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CMRIN.CODBCO  IS 'Código Banco';
LABEL ON COLUMN CMRIN.SUCMON  IS 'Sucursal Moneda';
LABEL ON COLUMN CMRIN.NUMCTA  IS 'Número Cuenta';
LABEL ON COLUMN CMRIN.MONMOV   IS 'Monto Movimiento';
LABEL ON COLUMN CMRIN.FECAPR  IS 'Fecha Apertura';
LABEL ON COLUMN CMRIN.FECUTLTRN  IS 'Fecha Ult. Trans.';
LABEL ON COLUMN CMRIN.SLDACT  IS 'Saldo Actual';
LABEL ON COLUMN CMRIN.SLDDSP  IS 'Saldo Disponible';
LABEL ON COLUMN CMRIN.LIMSBR  IS 'Límite Sobregiro';
LABEL ON COLUMN CMRIN.ESTCTA  IS 'Estado Cuenta';
LABEL ON COLUMN CMRIN.OBSREG  IS 'Observaciones';
LABEL ON COLUMN CMRIN.VERREG  IS 'Versión Registro';
LABEL ON COLUMN CMRIN.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN CMRIN.USRING  IS 'Usuario Creación';
LABEL ON COLUMN CMRIN.FECING  IS 'Fecha Creación';
LABEL ON COLUMN CMRIN.USRACT  IS 'Usuario Actualiza';
LABEL ON COLUMN CMRIN.FECACT  IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CMRIN.CODBCO  TEXT IS 'Código Banco';
LABEL ON COLUMN CMRIN.SUCMON  TEXT IS 'Sucursal Moneda';
LABEL ON COLUMN CMRIN.NUMCTA  TEXT IS 'Número Cuenta';
LABEL ON COLUMN CMRIN.MONMOV   TEXT IS 'Monto Movimiento';
LABEL ON COLUMN CMRIN.FECAPR  TEXT IS 'Fecha Apertura';
LABEL ON COLUMN CMRIN.FECUTLTRN  TEXT IS 'Fecha Ult. Trans.';
LABEL ON COLUMN CMRIN.SLDACT  TEXT IS 'Saldo Actual';
LABEL ON COLUMN CMRIN.SLDDSP  TEXT IS 'Saldo Disponible';
LABEL ON COLUMN CMRIN.LIMSBR  TEXT IS 'Límite Sobregiro';
LABEL ON COLUMN CMRIN.ESTCTA  TEXT IS 'Estado Cuenta';
LABEL ON COLUMN CMRIN.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN CMRIN.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN CMRIN.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN CMRIN.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN CMRIN.FECING  TEXT IS 'Fecha Creación';
LABEL ON COLUMN CMRIN.USRACT  TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN CMRIN.FECACT  TEXT IS 'Fecha Actualiza';