--======================================================================
-- Nombre de la Tabla : PBTRN - TRANSAC_AHORROS
--
-- DESCRIPCIÓN:
-- Transacciones de Libretas de Ahorro. Registra todas las
-- transacciones realizadas en cuentas de ahorro, incluyendo
-- depósitos, retiros, intereses, saldos y disponibilidades
-- actuales por cuenta y fecha.
--
-- Objetivo:
-- Centralizar el registro detallado de movimientos en cuentas
-- de ahorro para auditoría, conciliación y consultas históricas.
--
-- Tipo de Tabla:
-- Transaccional (Detalle).
--
-- Origen de los Datos:
-- Operaciones de depósito, retiro y actualización de saldos en
-- cuentas de ahorro.
--
-- Permanencia de Datos:
-- Permanente (histórico).
--
-- Uso de los Datos:
-- Base de auditoría y consultas de historial de transacciones.
-- Referenciada por procesos de conciliación y reportes.
--
-- Restricciones:
-- PK compuesta: numero_cuenta, fecha, hora.
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

CREATE OR REPLACE TABLE PBTRN (

    NUMERO_CUENTA FOR COLUMN NUMCTA VARCHAR(24)
                      NOT NULL,

    FECHA_TRANSACCION FOR COLUMN FECTRN DATE
              NOT NULL,

    HORA_TRANSACCION FOR COLUMN HORTRN TIME
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

    CONSTRAINT PBTRN_PK PRIMARY KEY (NUMCTA, FECTRN, HORTRN),

    CONSTRAINT FK_PBTRN_ACMST FOREIGN KEY (NUMCTA)
        REFERENCES ACMST (NUMCTA),

    CONSTRAINT PBTRN_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RPBTRN;

RENAME TABLE PBTRN
TO TRANSAC_AHORROS
FOR SYSTEM NAME PBTRN;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE PBTRN IS
'TRANSAC_AHORROS';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN PBTRN.NUMCTA IS
'Número de cuenta de ahorro.';

COMMENT ON COLUMN PBTRN.FECTRN IS
'Fecha de la transacción.';

COMMENT ON COLUMN PBTRN.HORTRN IS
'Hora de la transacción.';

COMMENT ON COLUMN PBTRN.FECAPR IS
'Fecha de apertura de la cuenta.';

COMMENT ON COLUMN PBTRN.FECUTLTRN IS
'Fecha de la última transacción registrada.';

COMMENT ON COLUMN PBTRN.SLDACT IS
'Saldo actual de la cuenta después de la transacción.';

COMMENT ON COLUMN PBTRN.SLDDSP IS
'Saldo disponible para operaciones.';

COMMENT ON COLUMN PBTRN.LIMSBR IS
'Límite de sobregiro autorizado para la cuenta.';

COMMENT ON COLUMN PBTRN.ESTCTA IS
'Estado operativo de la cuenta en el momento.';

COMMENT ON COLUMN PBTRN.OBSREG IS
'Observaciones adicionales de la transacción.';

COMMENT ON COLUMN PBTRN.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN PBTRN.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN PBTRN.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN PBTRN.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN PBTRN.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN PBTRN.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE PBTRN IS 'TRANSAC_AHORROS';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN PBTRN.NUMCTA  IS 'Número Cuenta';
LABEL ON COLUMN PBTRN.FECTRN   IS 'Fecha';
LABEL ON COLUMN PBTRN.HORTRN    IS 'HORTRN';
LABEL ON COLUMN PBTRN.FECAPR  IS 'Fecha Apertura';
LABEL ON COLUMN PBTRN.FECUTLTRN  IS 'Fecha Ult. Trans.';
LABEL ON COLUMN PBTRN.SLDACT  IS 'Saldo Actual';
LABEL ON COLUMN PBTRN.SLDDSP  IS 'Saldo Disponible';
LABEL ON COLUMN PBTRN.LIMSBR  IS 'Límite Sobregiro';
LABEL ON COLUMN PBTRN.ESTCTA  IS 'Estado Cuenta';
LABEL ON COLUMN PBTRN.OBSREG  IS 'Observaciones';
LABEL ON COLUMN PBTRN.VERREG  IS 'Versión Registro';
LABEL ON COLUMN PBTRN.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN PBTRN.USRING  IS 'Usuario Creación';
LABEL ON COLUMN PBTRN.FECING  IS 'Fecha Creación';
LABEL ON COLUMN PBTRN.USRACT  IS 'Usuario Actualiza';
LABEL ON COLUMN PBTRN.FECACT  IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN PBTRN.NUMCTA  TEXT IS 'Número Cuenta';
LABEL ON COLUMN PBTRN.FECTRN   TEXT IS 'Fecha';
LABEL ON COLUMN PBTRN.HORTRN    TEXT IS 'Hora';
LABEL ON COLUMN PBTRN.FECAPR  TEXT IS 'Fecha Apertura';
LABEL ON COLUMN PBTRN.FECUTLTRN  TEXT IS 'Fecha Ult. Trans.';
LABEL ON COLUMN PBTRN.SLDACT  TEXT IS 'Saldo Actual';
LABEL ON COLUMN PBTRN.SLDDSP  TEXT IS 'Saldo Disponible';
LABEL ON COLUMN PBTRN.LIMSBR  TEXT IS 'Límite Sobregiro';
LABEL ON COLUMN PBTRN.ESTCTA  TEXT IS 'Estado Cuenta';
LABEL ON COLUMN PBTRN.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN PBTRN.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN PBTRN.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN PBTRN.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN PBTRN.FECING  TEXT IS 'Fecha Creación';
LABEL ON COLUMN PBTRN.USRACT  TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN PBTRN.FECACT  TEXT IS 'Fecha Actualiza';

--======================================================================
-- Índices
--======================================================================
-- Índice sobre fecha.
-- Justificación: búsquedas por período de fecha frecuentes en
-- consultas de historial y reportes transaccionales (RI-004).
CREATE INDEX IX_PBTRN_FECTRN ON PBTRN (FECTRN);