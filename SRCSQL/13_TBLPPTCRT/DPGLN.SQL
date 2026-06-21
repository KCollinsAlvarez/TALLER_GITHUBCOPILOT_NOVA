--======================================================================
-- Nombre de la Tabla : DPGLN - PLAN_CUENTA_CLIENTES
--
-- DESCRIPCIÓN:
-- Plan de cuentas de nuestros clientes. Registra información de
-- propuestas de crédito por cliente incluyendo montos solicitados,
-- plazos, tasas propuestas, dictámenes y estado de propuesta para
-- gestión de líneas de crédito.
--
-- Objetivo:
-- Mantener plan de cuentas y propuestas de crédito de clientes como
-- base para análisis crediticio y gestión de líneas.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Propuestas de crédito y líneas de clientes del banco.
--
-- Permanencia de Datos:
-- Permanente (histórico de propuestas).
--
-- Uso de los Datos:
-- Gestión de líneas de crédito, análisis crediticio, auditoría de
-- propuestas y seguimiento de dictámenes.
--
-- Restricciones:
-- PK compuesta: tipo_balance, codigo_cuenta.
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-21
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================
CREATE OR REPLACE TABLE DPGLN (
    TIPO_BALANCE FOR COLUMN TIPBLN VARCHAR(20)
                         NOT NULL,
    
    CODIGO_CUENTA FOR COLUMN CODCTA VARCHAR(20)
                         NOT NULL,
    
    FECHA_PROPUESTA FOR COLUMN FECPRP DATE
                         NOT NULL DEFAULT '0001-01-01',
    
    MONTO_SOLICITADO FOR COLUMN MNTSOL DECIMAL(18, 2)
                             NOT NULL DEFAULT 0,
    
    PLAZO_MESES FOR COLUMN PLZMES INTEGER
                       NOT NULL DEFAULT 0,
    
    TASA_PROPUESTA FOR COLUMN TASPRP DECIMAL(18, 2)
                            NOT NULL DEFAULT 0,
    
    DICTAMEN_CREDITO FOR COLUMN DCTCRT VARCHAR(120)
                            NOT NULL DEFAULT '',
    
    ESTADO_PROPUESTA FOR COLUMN ESTPRP VARCHAR(20)
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
    
    CONSTRAINT DPGLN_PK PRIMARY KEY (TIPBLN, CODCTA),

    CONSTRAINT DPGLN_ESTREG_CHK CHECK (ESTADO_REGISTRO IN ('A', 'I'))
) RCDFMT RDPGLN;

RENAME TABLE DPGLN
TO PLAN_CUENTA_CLIENTES
FOR SYSTEM NAME DPGLN;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE DPGLN IS 'PLAN_CUENTA_CLIENTES';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN DPGLN.TIPBLN IS
'Tipo de balance.';

COMMENT ON COLUMN DPGLN.CODCTA IS
'Código de cuenta.';

COMMENT ON COLUMN DPGLN.FECPRP IS
'Fecha de la propuesta.';

COMMENT ON COLUMN DPGLN.MNTSOL IS
'Monto solicitado.';

COMMENT ON COLUMN DPGLN.PLZMES IS
'Plazo en meses.';

COMMENT ON COLUMN DPGLN.TASPRP IS
'Tasa propuesta.';

COMMENT ON COLUMN DPGLN.DCTCRT IS
'Dictamen de crédito.';

COMMENT ON COLUMN DPGLN.ESTPRP IS
'Estado de la propuesta.';

COMMENT ON COLUMN DPGLN.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN DPGLN.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN DPGLN.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN DPGLN.USRING IS
'Usuario que creó el registro';

COMMENT ON COLUMN DPGLN.FECING IS
'Fecha y hora de creación';

COMMENT ON COLUMN DPGLN.USRACT IS
'Usuario que realizó la última actualización';

COMMENT ON COLUMN DPGLN.FECACT IS
'Fecha y hora de la última actualización';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE DPGLN IS 'PLAN_CUENTA_CLIENTES';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN DPGLN.TIPBLN IS 'Tipo Balance';
LABEL ON COLUMN DPGLN.CODCTA IS 'Código Cuenta';
LABEL ON COLUMN DPGLN.FECPRP IS 'Fecha Propuesta';
LABEL ON COLUMN DPGLN.MNTSOL IS 'Monto Solicitado';
LABEL ON COLUMN DPGLN.PLZMES IS 'Plazo Meses';
LABEL ON COLUMN DPGLN.TASPRP IS 'Tasa Propuesta';
LABEL ON COLUMN DPGLN.DCTCRT IS 'Dictamen Crédito';
LABEL ON COLUMN DPGLN.ESTPRP IS 'Estado Propuesta';
LABEL ON COLUMN DPGLN.VERREG IS 'Versión Registro';
LABEL ON COLUMN DPGLN.OBSREG IS 'Observaciones';
LABEL ON COLUMN DPGLN.ESTREG IS 'Estado Registro';
LABEL ON COLUMN DPGLN.USRING IS 'Usuario Creación';
LABEL ON COLUMN DPGLN.FECING IS 'Fecha Creación';
LABEL ON COLUMN DPGLN.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN DPGLN.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN DPGLN.TIPBLN  TEXT IS 'Tipo Balance';
LABEL ON COLUMN DPGLN.CODCTA  TEXT IS 'Código Cuenta';
LABEL ON COLUMN DPGLN.FECPRP TEXT IS 'Fecha Propuesta';
LABEL ON COLUMN DPGLN.MNTSOL  TEXT IS 'Monto Solicitado';
LABEL ON COLUMN DPGLN.PLZMES  TEXT IS 'Plazo Meses';
LABEL ON COLUMN DPGLN.TASPRP TEXT IS 'Tasa Propuesta';
LABEL ON COLUMN DPGLN.DCTCRT  TEXT IS 'Dictamen Crédito';
LABEL ON COLUMN DPGLN.ESTPRP TEXT IS 'Estado Propuesta';
LABEL ON COLUMN DPGLN.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN DPGLN.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN DPGLN.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN DPGLN.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN DPGLN.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN DPGLN.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN DPGLN.FECACT TEXT IS 'Fecha Actualiza';