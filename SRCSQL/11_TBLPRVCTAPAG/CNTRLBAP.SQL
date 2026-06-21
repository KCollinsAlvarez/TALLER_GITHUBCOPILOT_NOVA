--======================================================================
-- Nombre de la Tabla : CNTRLBAP - CONTROL_CUENTA_PAGAR
--
-- DESCRIPCIÓN:
-- Archivo de control de cuentas por pagar (otros parámetros).
-- Registra información de control de cuentas por pagar con otros
-- parámetros incluyendo identificación, montos, saldos y fechas
-- para auditoría de pasivos no comisionales.
--
-- Objetivo:
-- Mantener control de cuentas por pagar por banco y moneda como base
-- para auditoría de pasivos diversos y conciliación de otros pagos.
--
-- Tipo de Tabla:
-- Maestro de Control.
--
-- Origen de los Datos:
-- Cuentas por pagar de proveedores y otros pagos del banco.
--
-- Permanencia de Datos:
-- Permanente (histórico de cuentas por pagar).
--
-- Uso de los Datos:
-- Auditoría de pasivos, análisis de pagos diversos, conciliación de
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

CREATE OR REPLACE TABLE CNTRLBAP (
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
    
    SALDO_PENDIENTE FOR COLUMN SDOPND DECIMAL(18, 2)
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
    
    CONSTRAINT CNTRLBAP_PK PRIMARY KEY (CODBCO, CODMON),

    CONSTRAINT CNTRLBAP_ESTREG_CHK CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCNTRLBAP;

RENAME TABLE CNTRLBAP
TO CONTROL_CUENTA_PAGAR
FOR SYSTEM NAME CNTRLBAP;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CNTRLBAP IS
'CONTROL_CUENTA_PAGAR';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CNTRLBAP.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN CNTRLBAP.CODMON IS
'Código de la moneda.';

COMMENT ON COLUMN CNTRLBAP.NUMIDN IS
'Número de identificación.';

COMMENT ON COLUMN CNTRLBAP.RZNSCL IS
'Razón social.';

COMMENT ON COLUMN CNTRLBAP.EMLASC IS
'Correo electrónico.';

COMMENT ON COLUMN CNTRLBAP.TELASC IS
'Teléfono.';

COMMENT ON COLUMN CNTRLBAP.MNTORI IS
'Monto original.';

COMMENT ON COLUMN CNTRLBAP.SDOPND IS
'Saldo pendiente.';

COMMENT ON COLUMN CNTRLBAP.FECEMI IS
'Fecha emisión.';

COMMENT ON COLUMN CNTRLBAP.FECVEN IS
'Fecha vencimiento.';

COMMENT ON COLUMN CNTRLBAP.ESTCXP IS
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
LABEL ON TABLE CNTRLBAP IS 'CONTROL_CUENTA_PAGAR';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CNTRLBAP.CODBCO IS 'Código Banco';
LABEL ON COLUMN CNTRLBAP.CODMON IS 'Código Moneda';
LABEL ON COLUMN CNTRLBAP.NUMIDN IS 'Número Identificación';
LABEL ON COLUMN CNTRLBAP.RZNSCL IS 'Razón Social';
LABEL ON COLUMN CNTRLBAP.EMLASC IS 'Email';
LABEL ON COLUMN CNTRLBAP.TELASC IS 'Teléfono';
LABEL ON COLUMN CNTRLBAP.MNTORI IS 'Monto Original';
LABEL ON COLUMN CNTRLBAP.SDOPND IS 'Saldo Pendiente';
LABEL ON COLUMN CNTRLBAP.FECEMI IS 'Fecha Emisión';
LABEL ON COLUMN CNTRLBAP.FECVEN IS 'Fecha Vencimiento';
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
LABEL ON COLUMN CNTRLBAP.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN CNTRLBAP.CODMON TEXT IS 'Código Moneda';
LABEL ON COLUMN CNTRLBAP.NUMIDN  TEXT IS 'Número Identificación';
LABEL ON COLUMN CNTRLBAP.RZNSCL TEXT IS 'Razón Social';
LABEL ON COLUMN CNTRLBAP.EMLASC  TEXT IS 'Email';
LABEL ON COLUMN CNTRLBAP.TELASC  TEXT IS 'Teléfono';
LABEL ON COLUMN CNTRLBAP.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN CNTRLBAP.SDOPND TEXT IS 'Saldo Pendiente';
LABEL ON COLUMN CNTRLBAP.FECEMI TEXT IS 'Fecha Emisión';
LABEL ON COLUMN CNTRLBAP.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN CNTRLBAF.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN CNTRLBAF.OBSREG TEXT IS 'Observaciones Registro';
LABEL ON COLUMN CNTRLBAF.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN CNTRLBAF.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN CNTRLBAF.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN CNTRLBAF.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLBAF.FECACT TEXT IS 'Fecha Actualiza';