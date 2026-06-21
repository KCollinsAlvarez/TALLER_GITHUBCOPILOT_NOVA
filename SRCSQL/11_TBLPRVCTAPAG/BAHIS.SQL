--======================================================================
-- Nombre de la Tabla : BAHIS - HIST_CUENTAS_PAGAR
--
-- DESCRIPCIÓN:
-- Histórico de Cuentas por Pagar. Registra el historial de pasivos
-- de cuentas por pagar con sus valores, fechas y estado de la
-- obligación.
--
-- Objetivo:
-- Centralizar el historial de cuentas por pagar para seguimiento,
-- conciliación y análisis de pasivos.
--
-- Tipo de Tabla:
-- Maestro transaccional.
--
-- Origen de los Datos:
-- Movimientos de cuentas por pagar y amortizaciones.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte para reportes de pasivos y auditoría de cuentas por pagar.
--
-- Restricciones:
-- PK técnica sobre codigo_banco, origen_cuenta, tipo_cuenta,
-- num_cliente, numero_referencia y fecha.
-- FK a BAPRC (num_cliente).
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-17
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE BAHIS (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    ORIGEN_CUENTA FOR COLUMN ORICTA VARCHAR(20)
                       NOT NULL,

    TIPO_CUENTA FOR COLUMN TIPCTA VARCHAR(20)
                      NOT NULL,

    NUM_CLIENTE FOR COLUMN NUMCLI VARCHAR(30)
                     NOT NULL,

    NUMERO_REFERENCIA FOR COLUMN NUMREF VARCHAR(30)
                         NOT NULL,

    FECHA_HISTORICO FOR COLUMN FECHIS DATE
                       NOT NULL DEFAULT '0001-01-01',

    NUM_IDENTIFICACION FOR COLUMN NUMID VARCHAR(30)
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

    CONSTRAINT BAHIS_PK PRIMARY KEY (
        CODBCO,ORICTA,
        TIPCTA,NUMCLI,
        NUMREF,FECHIS),

    CONSTRAINT FK_BAHIS_BAPRC FOREIGN KEY (NUMCLI)
        REFERENCES BAPRC (NUMCLI),

    CONSTRAINT BAHIS_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RBAHIS;

RENAME TABLE BAHIS
TO HIST_CUENTAS_PAGAR
FOR SYSTEM NAME BAHIS;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE BAHIS IS
'HIST_CUENTAS_PAGAR';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN BAHIS.CODBCO IS
'Código del banco de la cuenta por pagar.';

COMMENT ON COLUMN BAHIS.ORICTA IS
'Origen de la cuenta por pagar.';

COMMENT ON COLUMN BAHIS.TIPCTA IS
'Tipo de cuenta por pagar.';

COMMENT ON COLUMN BAHIS.NUMCLI IS
'Número de cliente asociado.';

COMMENT ON COLUMN BAHIS.NUMREF IS
'Número de referencia de la cuenta por pagar.';

COMMENT ON COLUMN BAHIS.FECHIS IS
'Fecha del registro histórico.';

COMMENT ON COLUMN BAHIS.NUMID IS
'Número de identificación del proveedor o cliente.';

COMMENT ON COLUMN BAHIS.RAZSOC IS
'Razón social del proveedor o cliente.';

COMMENT ON COLUMN BAHIS.EMLASC IS
'Correo electrónico del proveedor o cliente.';

COMMENT ON COLUMN BAHIS.NUMTEL IS
'Teléfono del proveedor o cliente.';

COMMENT ON COLUMN BAHIS.MNTORI IS
'Monto original de la cuenta por pagar.';

COMMENT ON COLUMN BAHIS.SLDPEN IS
'Saldo pendiente de la cuenta por pagar.';

COMMENT ON COLUMN BAHIS.FECEMI IS
'Fecha de emisión de la cuenta por pagar.';

COMMENT ON COLUMN BAHIS.FECVEN IS
'Fecha de vencimiento de la cuenta por pagar.';

COMMENT ON COLUMN BAHIS.ESTCXP IS
'Estado de la cuenta por pagar.';

COMMENT ON COLUMN BAHIS.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN BAHIS.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN BAHIS.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN BAHIS.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN BAHIS.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN BAHIS.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN BAHIS.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE BAHIS IS 'HIST_CUENTAS_PAGAR';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN BAHIS.CODBCO IS 'Código Banco';
LABEL ON COLUMN BAHIS.ORICTA IS 'Origen Cuenta';
LABEL ON COLUMN BAHIS.TIPCTA IS 'Tipo Cuenta';
LABEL ON COLUMN BAHIS.NUMCLI IS 'Número Cliente';
LABEL ON COLUMN BAHIS.NUMREF IS 'Número Referencia';
LABEL ON COLUMN BAHIS.FECHIS IS 'Fecha Histórico';
LABEL ON COLUMN BAHIS.NUMID IS 'Número Identificación';
LABEL ON COLUMN BAHIS.RAZSOC IS 'Razón Social';
LABEL ON COLUMN BAHIS.EMLASC IS 'Email';
LABEL ON COLUMN BAHIS.NUMTEL IS 'Teléfono';
LABEL ON COLUMN BAHIS.MNTORI IS 'Monto Original';
LABEL ON COLUMN BAHIS.SLDPEN IS 'Saldo Pendiente';
LABEL ON COLUMN BAHIS.FECEMI IS 'Fecha Emisión';
LABEL ON COLUMN BAHIS.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN BAHIS.ESTCXP IS 'Estado CXP';
LABEL ON COLUMN BAHIS.VERREG IS 'Versión Registro';
LABEL ON COLUMN BAHIS.OBSREG IS 'Observaciones';
LABEL ON COLUMN BAHIS.ESTREG IS 'Estado Registro';
LABEL ON COLUMN BAHIS.USRING IS 'Usuario Creación';
LABEL ON COLUMN BAHIS.FECING IS 'Fecha Creación';
LABEL ON COLUMN BAHIS.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN BAHIS.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN BAHIS.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN BAHIS.ORICTA TEXT IS 'Origen Cuenta';
LABEL ON COLUMN BAHIS.TIPCTA TEXT IS 'Tipo Cuenta';
LABEL ON COLUMN BAHIS.NUMCLI TEXT IS 'Número Cliente';
LABEL ON COLUMN BAHIS.NUMREF TEXT IS 'Número Referencia';
LABEL ON COLUMN BAHIS.FECHIS TEXT IS 'Fecha Histórico';
LABEL ON COLUMN BAHIS.NUMID TEXT IS 'Número Identificación';
LABEL ON COLUMN BAHIS.RAZSOC TEXT IS 'Razón Social';
LABEL ON COLUMN BAHIS.EMLASC TEXT IS 'Email';
LABEL ON COLUMN BAHIS.NUMTEL TEXT IS 'Teléfono';
LABEL ON COLUMN BAHIS.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN BAHIS.SLDPEN TEXT IS 'Saldo Pendiente';
LABEL ON COLUMN BAHIS.FECEMI TEXT IS 'Fecha Emisión';
LABEL ON COLUMN BAHIS.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN BAHIS.ESTCXP TEXT IS 'Estado CXP';
LABEL ON COLUMN BAHIS.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN BAHIS.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN BAHIS.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN BAHIS.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN BAHIS.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN BAHIS.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN BAHIS.FECACT TEXT IS 'Fecha Actualiza';
