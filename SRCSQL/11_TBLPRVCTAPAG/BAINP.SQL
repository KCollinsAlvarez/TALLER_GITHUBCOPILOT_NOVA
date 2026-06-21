--======================================================================
-- Nombre de la Tabla : BAINP - TRANS_CONTABLES_CXP
--
-- DESCRIPCIÓN:
-- Transacciones Contables Diarias de Cuentas por Pagar. Registra las
-- transacciones diarias de CXP con datos de contacto, montos, fechas
-- y estado de la obligación.
--
-- Objetivo:
-- Centralizar las transacciones contables diarias de cuentas por pagar
-- para control de pasivos y conciliación.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Generación diaria de movimientos de cuentas por pagar.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte para cierres diarios y seguimiento de amortizaciones.
--
-- Restricciones:
-- PK técnica sobre numero_batch y secuencia.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-17
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE BAINP (

    NUMERO_BATCH FOR COLUMN NUMBTH VARCHAR(30)
                        NOT NULL,

    NUMERO_SECUENCIA FOR COLUMN NUMSEC INT
                   NOT NULL,

    NUMERO_IDENTIFICACION FOR COLUMN NUMID VARCHAR(30)
                             NOT NULL DEFAULT '',

    RAZON_SOCIAL FOR COLUMN RAZSOC VARCHAR(80)
                         NOT NULL DEFAULT '',

    EMAIL_ASOCIADO FOR COLUMN EMLASC VARCHAR(80)
                 NOT NULL DEFAULT '',

    NUM_TELEFONO FOR COLUMN NUMTEL VARCHAR(80)
                     NOT NULL DEFAULT '',

    MONTO_ORIGINAL FOR COLUMN MNTORI DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    SALDO_PENDIENTE FOR COLUMN SLDPEN DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    FECHA_EMISION FOR COLUMN FECEMI DATE
                      NOT NULL DEFAULT '0001-01-01',

    FECHA_VENCIMIENTO FOR COLUMN FECVEN DATE
                    NOT NULL DEFAULT '0001-01-01',

    ESTADO_CXP FOR COLUMN ESTCXP VARCHAR(20)
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

    CONSTRAINT BAINP_PK PRIMARY KEY (NUMBTH, NUMSEC),

    CONSTRAINT BAINP_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RBAINP;

RENAME TABLE BAINP
TO TRANS_CONTABLES_CXP
FOR SYSTEM NAME BAINP;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE BAINP IS
'TRANS_CONTABLES_CXP';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN BAINP.NUMBTH IS
'Número del batch de transacciones contables.';

COMMENT ON COLUMN BAINP.NUMSEC IS
'Secuencia dentro del batch.';

COMMENT ON COLUMN BAINP.NUMID IS
'Número de identificación del proveedor o cliente.';

COMMENT ON COLUMN BAINP.RAZSOC IS
'Razón social del proveedor o cliente.';

COMMENT ON COLUMN BAINP.EMLASC IS
'Correo electrónico del proveedor o cliente.';

COMMENT ON COLUMN BAINP.NUMTEL IS
'Teléfono del proveedor o cliente.';

COMMENT ON COLUMN BAINP.MNTORI IS
'Monto original de la transacción.';

COMMENT ON COLUMN BAINP.SLDPEN IS
'Saldo pendiente de la transacción.';

COMMENT ON COLUMN BAINP.FECEMI IS
'Fecha de emisión de la transacción.';

COMMENT ON COLUMN BAINP.FECVEN IS
'Fecha de vencimiento de la transacción.';

COMMENT ON COLUMN BAINP.ESTCXP IS
'Estado de la cuenta por pagar.';

COMMENT ON COLUMN BAINP.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN BAINP.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN BAINP.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN BAINP.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN BAINP.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN BAINP.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN BAINP.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE BAINP IS 'TRANS_CONTABLES_CXP';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN BAINP.NUMBTH IS 'Número Batch';
LABEL ON COLUMN BAINP.NUMSEC IS 'NUMSEC';
LABEL ON COLUMN BAINP.NUMID IS 'Número Identificación';
LABEL ON COLUMN BAINP.RAZSOC IS 'Razón Social';
LABEL ON COLUMN BAINP.EMLASC IS 'Email';
LABEL ON COLUMN BAINP.NUMTEL IS 'Teléfono';
LABEL ON COLUMN BAINP.MNTORI IS 'Monto Original';
LABEL ON COLUMN BAINP.SLDPEN IS 'Saldo Pendiente';
LABEL ON COLUMN BAINP.FECEMI IS 'Fecha Emisión';
LABEL ON COLUMN BAINP.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN BAINP.ESTCXP IS 'Estado CXP';
LABEL ON COLUMN BAINP.VERREG IS 'Versión Registro';
LABEL ON COLUMN BAINP.OBSREG IS 'Observaciones';
LABEL ON COLUMN BAINP.ESTREG IS 'Estado Registro';
LABEL ON COLUMN BAINP.USRING IS 'Usuario Creación';
LABEL ON COLUMN BAINP.FECING IS 'Fecha Creación';
LABEL ON COLUMN BAINP.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN BAINP.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN BAINP.NUMBTH TEXT IS 'Número Batch';
LABEL ON COLUMN BAINP.NUMSEC TEXT IS 'Secuencia';
LABEL ON COLUMN BAINP.NUMID TEXT IS 'Número Identificación';
LABEL ON COLUMN BAINP.RAZSOC TEXT IS 'Razón Social';
LABEL ON COLUMN BAINP.EMLASC TEXT IS 'Email';
LABEL ON COLUMN BAINP.NUMTEL TEXT IS 'Teléfono';
LABEL ON COLUMN BAINP.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN BAINP.SLDPEN TEXT IS 'Saldo Pendiente';
LABEL ON COLUMN BAINP.FECEMI TEXT IS 'Fecha Emisión';
LABEL ON COLUMN BAINP.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN BAINP.ESTCXP TEXT IS 'Estado CXP';
LABEL ON COLUMN BAINP.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN BAINP.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN BAINP.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN BAINP.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN BAINP.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN BAINP.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN BAINP.FECACT TEXT IS 'Fecha Actualiza';
