--======================================================================
-- Nombre de la Tabla : BAMOR - AMORTIZACIONES_CXP
--
-- DESCRIPCIÓN:
-- Amortizaciones de Cuentas por Pagar. Registra las amortizaciones
-- aplicadas a cuentas por pagar, con la misma estructura de identificación,
-- cliente y control de saldos.
--
-- Objetivo:
-- Centralizar el registro de amortizaciones de cuentas por pagar para
-- gestión de pasivos y pagos.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Pagos y amortizaciones aplicadas a cuentas por pagar.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte para el seguimiento de amortizaciones y conciliación de CXP.
--
-- Restricciones:
-- PK técnica sobre codigo_banco, codigo_sucursal, origen_cuenta,
-- tipo_cuenta, id_cliente, numero_referencia y tipo_registro.
-- FK a BAPRC (id_cliente).
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-17
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE BAMOR (

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

    NUM_IDENTIFICACION FOR COLUMN NUMIDN VARCHAR(30)
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

    CONSTRAINT BAMOR_PK PRIMARY KEY 
    (CODBCO, CODSUC, ORICTA, TIPCTA, NUMCLI, NUMREF, TIPREG),

    CONSTRAINT FK_BAMOR_BAPRC FOREIGN KEY (NUMCLI)
        REFERENCES BAPRC (NUMCLI),

    CONSTRAINT BAMOR_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RBAMOR;

RENAME TABLE BAMOR
TO AMORTIZACIONES_CXP
FOR SYSTEM NAME BAMOR;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE BAMOR IS
'AMORTIZACIONES_CXP';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN BAMOR.CODBCO IS
'Código del banco de la amortización.';

COMMENT ON COLUMN BAMOR.CODSUC IS
'Código de la sucursal de la amortización.';

COMMENT ON COLUMN BAMOR.ORICTA IS
'Origen de la cuenta por pagar.';

COMMENT ON COLUMN BAMOR.TIPCTA IS
'Tipo de cuenta por pagar.';

COMMENT ON COLUMN BAMOR.NUMCLI IS
'Identificación del cliente asociado.';

COMMENT ON COLUMN BAMOR.NUMREF IS
'Número de referencia de la amortización.';

COMMENT ON COLUMN BAMOR.TIPREG IS
'Tipo de registro de la amortización.';

COMMENT ON COLUMN BAMOR.NUMIDN IS
'Número de identificación del proveedor o cliente.';

COMMENT ON COLUMN BAMOR.RAZSOC IS
'Razón social del proveedor o cliente.';

COMMENT ON COLUMN BAMOR.EMLASC IS
'Correo electrónico del proveedor o cliente.';

COMMENT ON COLUMN BAMOR.NUMTEL IS
'Teléfono del proveedor o cliente.';

COMMENT ON COLUMN BAMOR.MNTORI IS
'Monto original de la amortización.';

COMMENT ON COLUMN BAMOR.SLDPEN IS
'Saldo pendiente de la amortización.';

COMMENT ON COLUMN BAMOR.FECEMI IS
'Fecha de emisión de la amortización.';

COMMENT ON COLUMN BAMOR.FECVEN IS
'Fecha de vencimiento de la amortización.';

COMMENT ON COLUMN BAMOR.ESTCXP IS
'Estado de la cuenta por pagar amortizada.';

COMMENT ON COLUMN BAMOR.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN BAMOR.OBSREG IS
'Observaciones adicionales de la amortización.';

COMMENT ON COLUMN BAMOR.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN BAMOR.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN BAMOR.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN BAMOR.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN BAMOR.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE BAMOR IS 'AMORTIZACIONES_CXP';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN BAMOR.CODBCO IS 'Código Banco';
LABEL ON COLUMN BAMOR.CODSUC IS 'Código Sucursal';
LABEL ON COLUMN BAMOR.ORICTA IS 'Origen Cuenta';
LABEL ON COLUMN BAMOR.TIPCTA IS 'Tipo Cuenta';
LABEL ON COLUMN BAMOR.NUMCLI IS 'ID Cliente';
LABEL ON COLUMN BAMOR.NUMREF IS 'Número Referencia';
LABEL ON COLUMN BAMOR.TIPREG IS 'Tipo Registro';
LABEL ON COLUMN BAMOR.NUMIDN IS 'Número Identificación';
LABEL ON COLUMN BAMOR.RAZSOC IS 'Razón Social';
LABEL ON COLUMN BAMOR.EMLASC IS 'Email';
LABEL ON COLUMN BAMOR.NUMTEL IS 'Teléfono';
LABEL ON COLUMN BAMOR.MNTORI IS 'Monto Original';
LABEL ON COLUMN BAMOR.SLDPEN IS 'Saldo Pendiente';
LABEL ON COLUMN BAMOR.FECEMI IS 'Fecha Emisión';
LABEL ON COLUMN BAMOR.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN BAMOR.ESTCXP IS 'Estado CXP';
LABEL ON COLUMN BAMOR.VERREG IS 'Versión Registro';
LABEL ON COLUMN BAMOR.OBSREG IS 'Observaciones';
LABEL ON COLUMN BAMOR.ESTREG IS 'Estado Registro';
LABEL ON COLUMN BAMOR.USRING IS 'Usuario Creación';
LABEL ON COLUMN BAMOR.FECING IS 'Fecha Creación';
LABEL ON COLUMN BAMOR.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN BAMOR.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN BAMOR.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN BAMOR.CODSUC TEXT IS 'Código Sucursal';
LABEL ON COLUMN BAMOR.ORICTA TEXT IS 'Origen Cuenta';
LABEL ON COLUMN BAMOR.TIPCTA TEXT IS 'Tipo Cuenta';
LABEL ON COLUMN BAMOR.NUMCLI TEXT IS 'ID Cliente';
LABEL ON COLUMN BAMOR.NUMREF TEXT IS 'Número Referencia';
LABEL ON COLUMN BAMOR.TIPREG TEXT IS 'Tipo Registro';
LABEL ON COLUMN BAMOR.NUMIDN TEXT IS 'Número Identificación';
LABEL ON COLUMN BAMOR.RAZSOC TEXT IS 'Razón Social';
LABEL ON COLUMN BAMOR.EMLASC TEXT IS 'Email';
LABEL ON COLUMN BAMOR.NUMTEL TEXT IS 'Teléfono';
LABEL ON COLUMN BAMOR.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN BAMOR.SLDPEN TEXT IS 'Saldo Pendiente';
LABEL ON COLUMN BAMOR.FECEMI TEXT IS 'Fecha Emisión';
LABEL ON COLUMN BAMOR.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN BAMOR.ESTCXP TEXT IS 'Estado CXP';
LABEL ON COLUMN BAMOR.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN BAMOR.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN BAMOR.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN BAMOR.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN BAMOR.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN BAMOR.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN BAMOR.FECACT TEXT IS 'Fecha Actualiza';
