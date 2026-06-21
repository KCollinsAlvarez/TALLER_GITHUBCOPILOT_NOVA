--======================================================================
-- Nombre de la Tabla : RCLNB - CUENTAS_RECON
--
-- DESCRIPCIÓN:
-- Transacciones de Cuentas Reconciliables. Registra todas las
-- transacciones de cuentas que requieren reconciliación bancaria,
-- incluyendo información de banco, sucursal, moneda, cuenta contable,
-- saldos y disponibilidades.
--
-- Objetivo:
-- Centralizar el registro detallado de movimientos en cuentas
-- reconciliables para auditoría y conciliación bancaria.
--
-- Tipo de Tabla:
-- Transaccional (Detalle).
--
-- Origen de los Datos:
-- Operaciones de transacciones en cuentas reconciliables de
-- clientes.
--
-- Permanencia de Datos:
-- Permanente (histórico).
--
-- Uso de los Datos:
-- Base para procesos de conciliación bancaria y auditoría de
-- cuentas por banco y sucursal.
--
-- Restricciones:
-- PK compuesta: codigo_banco, codigo_sucursal, codigo_moneda,
--   cuenta_contable, numero_cuenta, fecha.
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

CREATE OR REPLACE TABLE RCLNB (

    CODIGO_BANCO FOR COLUMN CODBCO SMALLINT
                     NOT NULL,

    CODIGO_SUCURSAL FOR COLUMN CODSUC VARCHAR(20)
                        NOT NULL,

    CODIGO_MONEDA FOR COLUMN CODMON CHAR(3)
                      NOT NULL,

    CUENTA_CONTABLE FOR COLUMN CTACNT VARCHAR(24)
                        NOT NULL,

    NUMERO_CUENTA FOR COLUMN NUMCTA VARCHAR(24)
                      NOT NULL,

    FECHA_TRANS FOR COLUMN FECTRN DATE
              NOT NULL,

    FECHA_APERTURA FOR COLUMN FECAPR DATE
                       NOT NULL DEFAULT '0001-01-01',

    FECHA_ULTIMA_TRANSACCION FOR COLUMN FECULT DATE
                                 NOT NULL DEFAULT '0001-01-01',

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                    NOT NULL DEFAULT 0,

    SALDO_DISPONIBLE FOR COLUMN SLDDSP DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,

    LIMITE_SOBREGIRO FOR COLUMN LMSBRG DECIMAL(18, 2)
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

    CONSTRAINT RCLNB_PK PRIMARY KEY (CODBCO, CODSUC, CODMON, CTACNT,
        NUMCTA, FECTRN),

    CONSTRAINT FK_RCLNB_ACMST FOREIGN KEY (NUMCTA)
        REFERENCES ACMST (NUMCTA),

    CONSTRAINT RCLNB_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RRCLNB;

RENAME TABLE RCLNB
TO CUENTAS_RECON
FOR SYSTEM NAME RCLNB;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE RCLNB IS
'CUENTAS_RECON';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN RCLNB.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN RCLNB.CODSUC IS
'Código de la sucursal.';

COMMENT ON COLUMN RCLNB.CODMON IS
'Código de moneda.';

COMMENT ON COLUMN RCLNB.CTACNT IS
'Cuenta contable.';

COMMENT ON COLUMN RCLNB.NUMCTA IS
'Número de cuenta.';

COMMENT ON COLUMN RCLNB.FECTRN IS
'Fecha de la transacción.';

COMMENT ON COLUMN RCLNB.FECAPR IS
'Fecha de apertura de la cuenta.';

COMMENT ON COLUMN RCLNB.FECULT IS
'Fecha de la última transacción registrada.';

COMMENT ON COLUMN RCLNB.SLDACT IS
'Saldo actual de la cuenta después de la transacción.';

COMMENT ON COLUMN RCLNB.SLDDSP IS
'Saldo disponible para operaciones.';

COMMENT ON COLUMN RCLNB.LMSBRG IS
'Límite de sobregiro autorizado para la cuenta.';

COMMENT ON COLUMN RCLNB.ESTCTA IS
'Estado operativo de la cuenta en el momento.';

COMMENT ON COLUMN RCLNB.OBSREG IS
'Observaciones adicionales de la transacción.';

COMMENT ON COLUMN RCLNB.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN RCLNB.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN RCLNB.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN RCLNB.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN RCLNB.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN RCLNB.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE RCLNB IS 'CUENTAS_RECON';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN RCLNB.CODBCO  IS 'Código Banco';
LABEL ON COLUMN RCLNB.CODSUC  IS 'Código Sucursal';
LABEL ON COLUMN RCLNB.CODMON  IS 'Código Moneda';
LABEL ON COLUMN RCLNB.CTACNT  IS 'Cuenta Contable';
LABEL ON COLUMN RCLNB.NUMCTA  IS 'Número Cuenta';
LABEL ON COLUMN RCLNB.FECTRN   IS 'Fecha Transacción';
LABEL ON COLUMN RCLNB.FECAPR  IS 'Fecha Apertura';
LABEL ON COLUMN RCLNB.FECULT  IS 'Fecha Ult. Trans.';
LABEL ON COLUMN RCLNB.SLDACT  IS 'Saldo Actual';
LABEL ON COLUMN RCLNB.SLDDSP  IS 'Saldo Disponible';
LABEL ON COLUMN RCLNB.LMSBRG  IS 'Límite Sobregiro';
LABEL ON COLUMN RCLNB.ESTCTA  IS 'Estado Cuenta';
LABEL ON COLUMN RCLNB.OBSREG  IS 'Observaciones';
LABEL ON COLUMN RCLNB.VERREG  IS 'Versión Registro';
LABEL ON COLUMN RCLNB.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN RCLNB.USRING  IS 'Usuario Creación';
LABEL ON COLUMN RCLNB.FECING  IS 'Fecha Creación';
LABEL ON COLUMN RCLNB.USRACT  IS 'Usuario Actualiza';
LABEL ON COLUMN RCLNB.FECACT  IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN RCLNB.CODBCO  TEXT IS 'Código Banco';
LABEL ON COLUMN RCLNB.CODSUC  TEXT IS 'Código Sucursal';
LABEL ON COLUMN RCLNB.CODMON  TEXT IS 'Código Moneda';
LABEL ON COLUMN RCLNB.CTACNT  TEXT IS 'Cuenta Contable';
LABEL ON COLUMN RCLNB.NUMCTA  TEXT IS 'Número Cuenta';
LABEL ON COLUMN RCLNB.FECTRN   TEXT IS 'Fecha Transacción';
LABEL ON COLUMN RCLNB.FECAPR  TEXT IS 'Fecha Apertura';
LABEL ON COLUMN RCLNB.FECULT  TEXT IS 'Fecha Ult. Trans.';
LABEL ON COLUMN RCLNB.SLDACT  TEXT IS 'Saldo Actual';
LABEL ON COLUMN RCLNB.SLDDSP  TEXT IS 'Saldo Disponible';
LABEL ON COLUMN RCLNB.LMSBRG  TEXT IS 'Límite Sobregiro';
LABEL ON COLUMN RCLNB.ESTCTA  TEXT IS 'Estado Cuenta';
LABEL ON COLUMN RCLNB.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN RCLNB.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN RCLNB.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN RCLNB.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN RCLNB.FECING  TEXT IS 'Fecha Creación';
LABEL ON COLUMN RCLNB.USRACT  TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN RCLNB.FECACT  TEXT IS 'Fecha Actualiza';

--======================================================================
-- Índices
--======================================================================
-- Índice sobre fecha.
-- Justificación: búsquedas por período de fecha frecuentes en
-- procesos de conciliación bancaria (RI-004). Fecha es componente 6
-- de PK (no prefijo), requiere índice separado.
CREATE INDEX IX_RCLNB_FECTRN ON RCLNB (FECTRN);