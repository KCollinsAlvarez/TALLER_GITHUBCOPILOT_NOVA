--======================================================================
-- Nombre de la Tabla : BAPRC - CUENTAS_POR_PAGAR
--
-- DESCRIPCIÓN:
-- Maestro de Cuentas por Pagar. Registra las cuentas por pagar
-- asociadas a clientes, con datos de origen, referencia, valores,
-- fechas y estado de la obligación.
--
-- Objetivo:
-- Centralizar el registro de cuentas por pagar para control
-- de pasivos y seguimiento de pagos.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Generación de obligaciones a pagar en operaciones de proveedores
-- y clientes.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Fuente para gestión de pasivos, pagos y conciliaciones.
--
-- Restricciones:
-- PK técnica sobre codigo_banco, codigo_sucursal, origen_cuenta,
-- tipo_cuenta, id_cliente, numero_referencia y tipo_registro.
-- FK a CUMST (id_cliente).
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-17
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE BAPRC (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    CODIGO_SUCURSAL FOR COLUMN CODSUC VARCHAR(20)
                        NOT NULL,

    ORIGEN_CUENTA FOR COLUMN ORICTA VARCHAR(20)
                       NOT NULL,

    TIPO_CUENTA FOR COLUMN TIPCTA VARCHAR(20)
                      NOT NULL,

    NUM_CLIENTE FOR COLUMN NUMCLI VARCHAR(30)
                  NOT NULL,

    NUMERO_REFERENCIA FOR COLUMN NUMREF VARCHAR(30)
                         NOT NULL,

    TIPO_REGISTRO FOR COLUMN TIPREG VARCHAR(20)
                      NOT NULL,

    NUMERO_IDENTIFICACION FOR COLUMN NUMIDN VARCHAR(30)
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

    USUARIO_CREACION FOR COLUMN USRING CHAR(18)
                        NOT NULL DEFAULT USER,

    FECHA_INGRESO FOR COLUMN FECING TIMESTAMP
                      NOT NULL WITH DEFAULT,

    USUARIO_ACTUALIZA FOR COLUMN USRACT CHAR(18)
                          NOT NULL DEFAULT USER,

    FECHA_ACTUALIZA FOR COLUMN FECACT TIMESTAMP
                        NOT NULL WITH DEFAULT,

    CONSTRAINT BAPRC_PK PRIMARY KEY 
    (CODBCO, CODSUC, ORICTA, TIPCTA, NUMCLI, NUMREF, TIPREG),

    CONSTRAINT FK_BAPRC_CUMST FOREIGN KEY (NUMCLI)
        REFERENCES CUMST (NUMCLI),

    CONSTRAINT BAPRC_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RBAPRC;

RENAME TABLE BAPRC
TO CUENTAS_POR_PAGAR
FOR SYSTEM NAME BAPRC;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE BAPRC IS
'CUENTAS_POR_PAGAR';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN BAPRC.CODBCO IS
'Código del banco de la cuenta por pagar.';

COMMENT ON COLUMN BAPRC.CODSUC IS
'Código de la sucursal de la cuenta por pagar.';

COMMENT ON COLUMN BAPRC.ORICTA IS
'Origen de la cuenta por pagar.';

COMMENT ON COLUMN BAPRC.TIPCTA IS
'Tipo de cuenta por pagar.';

COMMENT ON COLUMN BAPRC.NUMCLI IS
'Identificación del cliente asociado.';

COMMENT ON COLUMN BAPRC.NUMREF IS
'Número de referencia de la cuenta por pagar.';

COMMENT ON COLUMN BAPRC.TIPREG IS
'Tipo de registro de la cuenta por pagar.';

COMMENT ON COLUMN BAPRC.NUMIDN IS
'Número de identificación del proveedor o cliente.';

COMMENT ON COLUMN BAPRC.RAZSOC IS
'Razón social del proveedor o cliente.';

COMMENT ON COLUMN BAPRC.EMLASC IS
'Correo electrónico del proveedor o cliente.';

COMMENT ON COLUMN BAPRC.NUMTEL IS
'Teléfono del proveedor o cliente.';

COMMENT ON COLUMN BAPRC.MNTORI IS
'Monto original de la cuenta por pagar.';

COMMENT ON COLUMN BAPRC.SLDPEN IS
'Saldo pendiente de la cuenta por pagar.';

COMMENT ON COLUMN BAPRC.FECEMI IS
'Fecha de emisión de la cuenta por pagar.';

COMMENT ON COLUMN BAPRC.FECVEN IS
'Fecha de vencimiento de la cuenta por pagar.';

COMMENT ON COLUMN BAPRC.ESTCXP IS
'Estado de la cuenta por pagar.';

COMMENT ON COLUMN BAPRC.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN BAPRC.OBSREG IS
'Observaciones adicionales de la cuenta por pagar.';

COMMENT ON COLUMN BAPRC.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN BAPRC.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN BAPRC.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN BAPRC.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN BAPRC.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE BAPRC IS 'CUENTAS_POR_PAGAR';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN BAPRC.CODBCO IS 'Código Banco';
LABEL ON COLUMN BAPRC.CODSUC IS 'Código Sucursal';
LABEL ON COLUMN BAPRC.ORICTA IS 'Origen Cuenta';
LABEL ON COLUMN BAPRC.TIPCTA IS 'Tipo Cuenta';
LABEL ON COLUMN BAPRC.NUMCLI IS 'ID Cliente';
LABEL ON COLUMN BAPRC.NUMREF IS 'Número Referencia';
LABEL ON COLUMN BAPRC.TIPREG IS 'Tipo Registro';
LABEL ON COLUMN BAPRC.NUMIDN IS 'Número Identificación';
LABEL ON COLUMN BAPRC.RAZSOC IS 'Razón Social';
LABEL ON COLUMN BAPRC.EMLASC IS 'Email';
LABEL ON COLUMN BAPRC.NUMTEL IS 'Teléfono';
LABEL ON COLUMN BAPRC.MNTORI IS 'Monto Original';
LABEL ON COLUMN BAPRC.SLDPEN IS 'Saldo Pendiente';
LABEL ON COLUMN BAPRC.FECEMI IS 'Fecha Emisión';
LABEL ON COLUMN BAPRC.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN BAPRC.ESTCXP IS 'Estado CXP';
LABEL ON COLUMN BAPRC.VERREG IS 'Versión Registro';
LABEL ON COLUMN BAPRC.OBSREG IS 'Observaciones';
LABEL ON COLUMN BAPRC.ESTREG IS 'Estado Registro';
LABEL ON COLUMN BAPRC.USRING IS 'Usuario Creación';
LABEL ON COLUMN BAPRC.FECING IS 'Fecha Creación';
LABEL ON COLUMN BAPRC.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN BAPRC.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN BAPRC.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN BAPRC.CODSUC TEXT IS 'Código Sucursal';
LABEL ON COLUMN BAPRC.ORICTA TEXT IS 'Origen Cuenta';
LABEL ON COLUMN BAPRC.TIPCTA TEXT IS 'Tipo Cuenta';
LABEL ON COLUMN BAPRC.NUMCLI TEXT IS 'ID Cliente';
LABEL ON COLUMN BAPRC.NUMREF TEXT IS 'Número Referencia';
LABEL ON COLUMN BAPRC.TIPREG TEXT IS 'Tipo Registro';
LABEL ON COLUMN BAPRC.NUMIDN TEXT IS 'Número Identificación';
LABEL ON COLUMN BAPRC.RAZSOC TEXT IS 'Razón Social';
LABEL ON COLUMN BAPRC.EMLASC TEXT IS 'Email';
LABEL ON COLUMN BAPRC.NUMTEL TEXT IS 'Teléfono';
LABEL ON COLUMN BAPRC.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN BAPRC.SLDPEN TEXT IS 'Saldo Pendiente';
LABEL ON COLUMN BAPRC.FECEMI TEXT IS 'Fecha Emisión';
LABEL ON COLUMN BAPRC.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN BAPRC.ESTCXP TEXT IS 'Estado CXP';
LABEL ON COLUMN BAPRC.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN BAPRC.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN BAPRC.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN BAPRC.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN BAPRC.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN BAPRC.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN BAPRC.FECACT TEXT IS 'Fecha Actualiza';
