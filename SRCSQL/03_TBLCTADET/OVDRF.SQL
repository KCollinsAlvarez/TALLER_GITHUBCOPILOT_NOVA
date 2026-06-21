--======================================================================
-- Nombre de la Tabla : OVDRF - DIARIO_SOBREGIROS
--
-- DESCRIPCIÓN:
-- Archivo diario de Sobregiros. Registra los sobregiros generados
-- durante el día.
--
-- Objetivo:
-- Mantener el control diario de sobregiros.
--
-- Tipo de Tabla:
-- Diario.
--
-- Origen de los Datos:
-- Procesos de conciliación y control de cuentas.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Análisis de sobregiros, reporte y auditoría.
--
-- Restricciones:
-- PK técnica sobre id.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-17
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE OVDRF (

    ID_REGISTRO FOR COLUMN IDNREG BIGINT NOT NULL 
                    GENERATED ALWAYS AS IDENTITY,

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

    CONSTRAINT OVDRF_PK PRIMARY KEY (IDNREG),

    CONSTRAINT OVDRF_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RUNCOL;

RENAME TABLE OVDRF
TO DIARIO_SOBREGIROS
FOR SYSTEM NAME OVDRF;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE OVDRF IS
'DIARIO_SOBREGIROS';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN OVDRF.IDNREG IS
'Identificador único del registro de sobregiro.';

COMMENT ON COLUMN OVDRF.FECAPR IS
'Fecha de apertura del registro.';

COMMENT ON COLUMN OVDRF.FECULTTRN IS
'Fecha de la última transacción registrada.';

COMMENT ON COLUMN OVDRF.SLDACT IS
'Saldo actual del sobregiro.';

COMMENT ON COLUMN OVDRF.SLDDSP IS
'Saldo disponible asociado al sobregiro.';

COMMENT ON COLUMN OVDRF.LIMSBR IS
'Límite de sobregiro.';

COMMENT ON COLUMN OVDRF.ESTCTA IS
'Estado de la cuenta asociada al sobregiro.';

COMMENT ON COLUMN OVDRF.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN OVDRF.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN OVDRF.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN OVDRF.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN OVDRF.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN OVDRF.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN OVDRF.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE OVDRF IS 'DIARIO_SOBREGIROS';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN OVDRF.IDNREG IS 'ID Registro';
LABEL ON COLUMN OVDRF.FECAPR IS 'Fecha Apertura';
LABEL ON COLUMN OVDRF.FECULTTRN IS 'Fecha Última Transacción';
LABEL ON COLUMN OVDRF.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN OVDRF.SLDDSP IS 'Saldo Disponible';
LABEL ON COLUMN OVDRF.LIMSBR IS 'Límite Sobregiro';
LABEL ON COLUMN OVDRF.ESTCTA IS 'Estado Cuenta';
LABEL ON COLUMN OVDRF.VERREG IS 'Versión Registro';
LABEL ON COLUMN OVDRF.OBSREG IS 'Observaciones';
LABEL ON COLUMN OVDRF.ESTREG IS 'Estado Registro';
LABEL ON COLUMN OVDRF.USRING IS 'Usuario Creación';
LABEL ON COLUMN OVDRF.FECING IS 'Fecha Creación';
LABEL ON COLUMN OVDRF.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN OVDRF.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN OVDRF.IDNREG TEXT IS 'ID Registro';
LABEL ON COLUMN OVDRF.FECAPR TEXT IS 'Fecha Apertura';
LABEL ON COLUMN OVDRF.FECULTTRN TEXT IS 'Fecha Última Transacción';
LABEL ON COLUMN OVDRF.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN OVDRF.SLDDSP TEXT IS 'Saldo Disponible';
LABEL ON COLUMN OVDRF.LIMSBR TEXT IS 'Límite Sobregiro';
LABEL ON COLUMN OVDRF.ESTCTA TEXT IS 'Estado Cuenta';
LABEL ON COLUMN OVDRF.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN OVDRF.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN OVDRF.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN OVDRF.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN OVDRF.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN OVDRF.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN OVDRF.FECACT TEXT IS 'Fecha Actualiza';