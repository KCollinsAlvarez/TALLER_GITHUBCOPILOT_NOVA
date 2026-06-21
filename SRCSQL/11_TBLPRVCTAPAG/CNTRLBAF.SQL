--======================================================================
-- Nombre de la Tabla : CNTRLBAF - CONTROL_CUENTAS_PAG
--
-- DESCRIPCIÓN:
-- Archivo de control de cuentas por pagar (sección comisiones).
-- Registra información de control de cuentas por pagar de proveedores
-- y comisiones incluyendo identificación, montos, saldos y fechas
-- para auditoría de pasivos.
--
-- Objetivo:
-- Mantener control de cuentas por pagar por banco y moneda como base
-- para auditoría de pasivos y conciliación de comisiones.
--
-- Tipo de Tabla:
-- Maestro de Control.
--
-- Origen de los Datos:
-- Cuentas por pagar de proveedores y comisiones del banco.
--
-- Permanencia de Datos:
-- Permanente (histórico de cuentas por pagar).
--
-- Uso de los Datos:
-- Auditoría de pasivos, análisis de comisiones, conciliación de
-- cuentas por pagar y seguimiento de vencimientos.
--
-- Restricciones:
-- PK compuesta: codigo_banco, codigo_moneda.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-21
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CNTRLBAF (
    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,
    
    CODIGO_MONEDA FOR COLUMN CODMON CHAR(3)
                        NOT NULL,
    
    NUM_IDENTIFICACION FOR COLUMN NUMIDN VARCHAR(30)
                                 NOT NULL DEFAULT '',
    
    RAZON_SOCIAL FOR COLUMN RZNSCL VARCHAR(80)
                        NOT NULL DEFAULT '',
    
    EMAIL_ASOCIADO FOR COLUMN EMLASC VARCHAR(80)
                   NOT NULL DEFAULT '',
    
    TELEFONO_ASOCIADO FOR COLUMN TELASC VARCHAR(80)
                      NOT NULL DEFAULT '',
    
    MONTO_ORIGINAL FOR COLUMN MNTORI DECIMAL(18, 2)
                         NOT NULL DEFAULT 0,
    
    SALDO_PENDIENTE FOR COLUMN ALDPND DECIMAL(18, 2)
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
    
    CONSTRAINT CNTRLBAF_PK PRIMARY KEY (CODBCO, CODMON),

    CONSTRAINT CNTRLBAF_ESTREG_CHK CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCNTRLBAF;

RENAME TABLE CNTRLBAF
TO CONTROL_CUENTAS_PAG
FOR SYSTEM NAME CNTRLBAF;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CNTRLBAF IS
'CONTROL_CUENTAS_PAG';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CNTRLBAF.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN CNTRLBAF.CODMON IS
'Código de la moneda.';

COMMENT ON COLUMN CNTRLBAF.NUMIDN IS
'Número de identificación.';

COMMENT ON COLUMN CNTRLBAF.RZNSCL IS
'Razón social.';

COMMENT ON COLUMN CNTRLBAF.EMLASC IS
'Correo electrónico.';

COMMENT ON COLUMN CNTRLBAF.TELASC IS
'Teléfono.';

COMMENT ON COLUMN CNTRLBAF.MNTORI IS
'Monto original.';

COMMENT ON COLUMN CNTRLBAF.ALDPND IS
'Saldo pendiente.';

COMMENT ON COLUMN CNTRLBAF.FECEMI IS
'Fecha emisión.';

COMMENT ON COLUMN CNTRLBAF.FECVEN IS
'Fecha vencimiento.';

COMMENT ON COLUMN CNTRLBAF.ESTCXP IS
'Estado CxP.';

COMMENT ON COLUMN POTLX.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN POTLX.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN POTLX.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN POTLX.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN POTLX.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN POTLX.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN POTLX.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CNTRLBAF IS 'CONTROL_CUENTAS_PAG';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CNTRLBAF.CODBCO IS 'Código Banco';
LABEL ON COLUMN CNTRLBAF.CODMON IS 'Código Moneda';
LABEL ON COLUMN CNTRLBAF.NUMIDN IS 'Número Identificación';
LABEL ON COLUMN CNTRLBAF.RZNSCL IS 'Razón Social';
LABEL ON COLUMN CNTRLBAF.EMLASC IS 'Email';
LABEL ON COLUMN CNTRLBAF.TELASC IS 'Teléfono';
LABEL ON COLUMN CNTRLBAF.MNTORI IS 'Monto Original';
LABEL ON COLUMN CNTRLBAF.ALDPND IS 'Saldo Pendiente';
LABEL ON COLUMN CNTRLBAF.FECEMI IS 'Fecha Emisión';
LABEL ON COLUMN CNTRLBAF.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN CNTRLBAF.ESTCXP IS 'Estado CxP';
LABEL ON COLUMN CNTRLBAF.VERREG IS 'Versión Registro';
LABEL ON COLUMN CNTRLBAF.OBSREG IS 'Observaciones Registro';
LABEL ON COLUMN CNTRLBAF.ESTREG IS 'Estado Registro';
LABEL ON COLUMN CNTRLBAF.USRING IS 'Usuario Creación';
LABEL ON COLUMN CNTRLBAF.FECING IS 'Fecha Creación';
LABEL ON COLUMN CNTRLBAF.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLBAF.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CNTRLBAF.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN CNTRLBAF.CODMON TEXT IS 'Código Moneda';
LABEL ON COLUMN CNTRLBAF.NUMIDN  TEXT IS 'Número Identificación';
LABEL ON COLUMN CNTRLBAF.RZNSCL TEXT IS 'Razón Social';
LABEL ON COLUMN CNTRLBAF.EMLASC  TEXT IS 'Email';
LABEL ON COLUMN CNTRLBAF.TELASC  TEXT IS 'Teléfono';
LABEL ON COLUMN CNTRLBAF.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN CNTRLBAF.ALDPND TEXT IS 'Saldo Pendiente';
LABEL ON COLUMN CNTRLBAF.FECEMI TEXT IS 'Fecha Emisión';
LABEL ON COLUMN CNTRLBAF.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN CNTRLBAF.ESTCXP TEXT IS 'Estado CxP';
LABEL ON COLUMN CNTRLBAF.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN CNTRLBAF.OBSREG TEXT IS 'Observaciones Registro';
LABEL ON COLUMN CNTRLBAF.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN CNTRLBAF.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN CNTRLBAF.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN CNTRLBAF.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLBAF.FECACT TEXT IS 'Fecha Actualiza';