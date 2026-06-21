--======================================================================
-- Nombre de la Tabla : CNTRLDEV - CAUSALES_DEVOLUCION
--
-- DESCRIPCIÓN:
-- Definición de las causales de devolución de cheques. Registra los
-- códigos usados para clasificar devoluciones.
--
-- Objetivo:
-- Mantener el catálogo de causales de devolución.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Configuración de devolución de cheques.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Validación y reporte de cheques devueltos.
--
-- Restricciones:
-- PK sobre código de causal.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-19
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CNTRLDEV (

    CODIGO_CAUSAL FOR COLUMN CODCSL VARCHAR(20)
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

    CONSTRAINT CNTRLDEV_PK PRIMARY KEY (CODCSL),

    CONSTRAINT CNTRLDEV_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCNTRLDEV;

RENAME TABLE CNTRLDEV
TO CAUSALES_DEVOLUCION
FOR SYSTEM NAME CNTRLDEV;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CNTRLDEV IS
'CAUSALES_DEVOLUCION';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CNTRLDEV.CODCSL IS
'Código de la causal de devolución.';

COMMENT ON COLUMN CNTRLDEV.FECAPR IS
'Fecha de apertura del registro.';

COMMENT ON COLUMN CNTRLDEV.FECULTTRN IS
'Fecha de la última transacción registrada.';

COMMENT ON COLUMN CNTRLDEV.SLDACT IS
'Saldo actual asociado al registro.';

COMMENT ON COLUMN CNTRLDEV.SLDDSP IS
'Saldo disponible asociado al registro.';

COMMENT ON COLUMN CNTRLDEV.LIMSBR IS
'Límite de sobregiro asociado al registro.';

COMMENT ON COLUMN CNTRLDEV.ESTCTA IS
'Estado de cuenta asociado al registro.';

COMMENT ON COLUMN CNTRLDEV.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN CNTRLDEV.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN CNTRLDEV.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN CNTRLDEV.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN CNTRLDEV.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN CNTRLDEV.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN CNTRLDEV.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CNTRLDEV IS 'CAUSALES_DEVOLUCION';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CNTRLDEV.CODCSL IS 'Código Causal';
LABEL ON COLUMN CNTRLDEV.FECAPR IS 'Fecha Apertura';
LABEL ON COLUMN CNTRLDEV.FECULTTRN IS 'Fecha Última Transacción';
LABEL ON COLUMN CNTRLDEV.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN CNTRLDEV.SLDDSP IS 'Saldo Disponible';
LABEL ON COLUMN CNTRLDEV.LIMSBR IS 'Límite Sobregiro';
LABEL ON COLUMN CNTRLDEV.ESTCTA IS 'Estado Cuenta';
LABEL ON COLUMN CNTRLDEV.VERREG IS 'Versión Registro';
LABEL ON COLUMN CNTRLDEV.OBSREG IS 'Observaciones';
LABEL ON COLUMN CNTRLDEV.ESTREG IS 'Estado Registro';
LABEL ON COLUMN CNTRLDEV.USRING IS 'Usuario Creación';
LABEL ON COLUMN CNTRLDEV.FECING IS 'Fecha Creación';
LABEL ON COLUMN CNTRLDEV.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLDEV.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CNTRLDEV.CODCSL TEXT IS 'Código Causal';
LABEL ON COLUMN CNTRLDEV.FECAPR TEXT IS 'Fecha Apertura';
LABEL ON COLUMN CNTRLDEV.FECULTTRN TEXT IS 'Fecha Última Transacción';
LABEL ON COLUMN CNTRLDEV.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN CNTRLDEV.SLDDSP TEXT IS 'Saldo Disponible';
LABEL ON COLUMN CNTRLDEV.LIMSBR TEXT IS 'Límite Sobregiro';
LABEL ON COLUMN CNTRLDEV.ESTCTA TEXT IS 'Estado Cuenta';
LABEL ON COLUMN CNTRLDEV.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN CNTRLDEV.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN CNTRLDEV.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN CNTRLDEV.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN CNTRLDEV.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN CNTRLDEV.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLDEV.FECACT TEXT IS 'Fecha Actualiza';
