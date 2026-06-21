--======================================================================
-- Nombre de la Tabla : TLMST - MAESTRO_CAJEROS
--
-- DESCRIPCIÓN:
-- Maestro de Cajeros. Registra los cajeros por código y moneda con
-- información de saldos, límites y estado.
--
-- Objetivo:
-- Centralizar el registro de cajeros para control operacional de caja.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Definición de cajeros en sucursales.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte para operaciones de caja y conciliación diaria.
--
-- Restricciones:
-- PK técnica sobre codigo_de_cajero, codigo_moneda.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-17
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE TLMST (

    CODIGO_CAJERO FOR COLUMN CODCJR VARCHAR(20)
                         NOT NULL,

    CODIGO_MONEDA FOR COLUMN CODMON VARCHAR(3)
                      NOT NULL,

    FECHA_APERTURA FOR COLUMN FECAPR DATE
                        NOT NULL DEFAULT '0001-01-01',

    FEC_ULTIMA_TRANS FOR COLUMN FECULTTRN DATE
                                  NOT NULL DEFAULT '0001-01-01',

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                     NOT NULL DEFAULT 0,

    SALDO_DISPONIBLE FOR COLUMN SLDDSP DECIMAL(18, 2)
                         NOT NULL DEFAULT 0,

    LIMITE_SOBREGIRO FOR COLUMN LIMSBR DECIMAL(18, 2)
                         NOT NULL DEFAULT 0,

    ESTADO_CUENTA FOR COLUMN ESTCTA VARCHAR(20)
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

    CONSTRAINT TLMST_PK PRIMARY KEY (CODCJR, CODMON),

    CONSTRAINT TLMST_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RTLMST;

RENAME TABLE TLMST
TO MAESTRO_CAJEROS
FOR SYSTEM NAME TLMST;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE TLMST IS
'MAESTRO_CAJEROS';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN TLMST.CODCJR IS
'Código único del cajero.';

COMMENT ON COLUMN TLMST.CODMON IS
'Código de moneda del cajero.';

COMMENT ON COLUMN TLMST.FECAPR IS
'Fecha de apertura del cajero.';

COMMENT ON COLUMN TLMST.FECULTTRN IS
'Fecha de la última transacción del cajero.';

COMMENT ON COLUMN TLMST.SLDACT IS
'Saldo actual del cajero.';

COMMENT ON COLUMN TLMST.SLDDSP IS
'Saldo disponible del cajero.';

COMMENT ON COLUMN TLMST.LIMSBR IS
'Límite de sobregiro del cajero.';

COMMENT ON COLUMN TLMST.ESTCTA IS
'Estado de la cuenta del cajero.';

COMMENT ON COLUMN TLMST.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN TLMST.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN TLMST.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN TLMST.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN TLMST.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN TLMST.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN TLMST.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE TLMST IS 'MAESTRO_CAJEROS';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN TLMST.CODCJR IS 'Código Cajero';
LABEL ON COLUMN TLMST.CODMON IS 'Código Moneda';
LABEL ON COLUMN TLMST.FECAPR IS 'Fecha Apertura';
LABEL ON COLUMN TLMST.FECULTTRN IS 'Fecha Última Transacción';
LABEL ON COLUMN TLMST.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN TLMST.SLDDSP IS 'Saldo Disponible';
LABEL ON COLUMN TLMST.LIMSBR IS 'Límite Sobregiro';
LABEL ON COLUMN TLMST.ESTCTA IS 'Estado Cuenta';
LABEL ON COLUMN TLMST.VERREG IS 'Versión Registro';
LABEL ON COLUMN TLMST.OBSREG IS 'Observaciones';
LABEL ON COLUMN TLMST.ESTREG IS 'Estado Registro';
LABEL ON COLUMN TLMST.USRING IS 'Usuario Creación';
LABEL ON COLUMN TLMST.FECING IS 'Fecha Creación';
LABEL ON COLUMN TLMST.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN TLMST.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN TLMST.CODCJR TEXT IS 'Código Cajero';
LABEL ON COLUMN TLMST.CODMON TEXT IS 'Código Moneda';
LABEL ON COLUMN TLMST.FECAPR TEXT IS 'Fecha Apertura';
LABEL ON COLUMN TLMST.FECULTTRN TEXT IS 'Fecha Última Transacción';
LABEL ON COLUMN TLMST.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN TLMST.SLDDSP TEXT IS 'Saldo Disponible';
LABEL ON COLUMN TLMST.LIMSBR TEXT IS 'Límite Sobregiro';
LABEL ON COLUMN TLMST.ESTCTA TEXT IS 'Estado Cuenta';
LABEL ON COLUMN TLMST.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN TLMST.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN TLMST.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN TLMST.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN TLMST.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN TLMST.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN TLMST.FECACT TEXT IS 'Fecha Actualiza';
