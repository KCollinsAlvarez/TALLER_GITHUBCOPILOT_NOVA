--======================================================================
-- Nombre de la Tabla : FIXMS - ACTIVOS_FIJOS
--
-- DESCRIPCIÓN:
-- Maestro de Activos Fijos. Registra los activos fijos de la
-- entidad bancaria incluyendo valoración, depreciación acumulada,
-- vida útil y estado operativo de cada activo.
--
-- Objetivo:
-- Centralizar el control y seguimiento de activos fijos para
-- gestión contable, depreciación y reportes patrimoniales.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Administración de activos fijos y contabilidad del banco.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Consultado por procesos de depreciación, control patrimonial
-- y generación de reportes de activos fijos.
--
-- Restricciones:
-- PK simple: numero_activo.
-- ESTADO_REGISTRO solo acepta A o I.
-- ESTADO_ACTIVO acepta: A=Activo, B=Baja, V=Vendido,
-- D=Depreciado.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-04
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE FIXMS (

    NUMERO_ACTIVO FOR COLUMN NUMACT VARCHAR(30)
                      NOT NULL,

    DESCRIPCION FOR COLUMN DESACT VARCHAR(120)
                    NOT NULL DEFAULT '',

    FECHA_ADQUISICION FOR COLUMN FECADQ DATE
                          NOT NULL DEFAULT '0001-01-01',

    VALOR_ADQUISICION FOR COLUMN VALADQ DECIMAL(18, 2)
                          NOT NULL DEFAULT 0,

    VIDA_UTIL_MESES FOR COLUMN VIDUTLMES INTEGER
                        NOT NULL DEFAULT 0,

    DEPRECIACION_ACUM FOR COLUMN DEPACM DECIMAL(18, 2)
                          NOT NULL DEFAULT 0,

    ESTADO_ACTIVO FOR COLUMN ESTACT VARCHAR(20)
                      NOT NULL DEFAULT 'A',

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

    CONSTRAINT FIXMS_PK PRIMARY KEY (NUMACT),

    CONSTRAINT FIXMS_ESTREG_CST CHECK (ESTREG IN ('A', 'I')),

    CONSTRAINT FIXMS_ESTACT_CST CHECK (ESTACT IN ('A', 'B', 'V', 'D'))

) RCDFMT RFIXMS;

RENAME TABLE FIXMS
TO ACTIVOS_FIJOS
FOR SYSTEM NAME FIXMS;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE FIXMS IS
'ACTIVOS_FIJOS';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN FIXMS.NUMACT IS
'Número del activo fijo.';

COMMENT ON COLUMN FIXMS.DESACT IS
'Descripción del activo fijo.';

COMMENT ON COLUMN FIXMS.FECADQ IS
'Fecha de adquisición del activo.';

COMMENT ON COLUMN FIXMS.VALADQ IS
'Valor de adquisición del activo.';

COMMENT ON COLUMN FIXMS.VIDUTLMES IS
'Vida útil del activo expresada en meses.';

COMMENT ON COLUMN FIXMS.DEPACM IS
'Depreciación acumulada del activo a la fecha.';

COMMENT ON COLUMN FIXMS.ESTACT IS
'Estado operativo del activo.
 A=Activo, B=Baja, V=Vendido, D=Depreciado.';

COMMENT ON COLUMN FIXMS.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN FIXMS.OBSREG IS
'Observaciones adicionales del activo.';

COMMENT ON COLUMN FIXMS.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN FIXMS.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN FIXMS.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN FIXMS.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN FIXMS.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE FIXMS IS 'ACTIVOS_FIJOS';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN FIXMS.NUMACT  IS 'Número Activo';
LABEL ON COLUMN FIXMS.DESACT  IS 'Descripción';
LABEL ON COLUMN FIXMS.FECADQ  IS 'Fecha Adquisición';
LABEL ON COLUMN FIXMS.VALADQ  IS 'Valor Adquisición';
LABEL ON COLUMN FIXMS.VIDUTLMES  IS 'Vida Útil Meses';
LABEL ON COLUMN FIXMS.DEPACM  IS 'Depreciación Acumulado';
LABEL ON COLUMN FIXMS.ESTACT  IS 'Estado Activo';
LABEL ON COLUMN FIXMS.VERREG  IS 'Versión Registro';
LABEL ON COLUMN FIXMS.OBSREG  IS 'Observaciones';
LABEL ON COLUMN FIXMS.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN FIXMS.USRING  IS 'Usuario Creación';
LABEL ON COLUMN FIXMS.FECING  IS 'Fecha Creación';
LABEL ON COLUMN FIXMS.USRACT  IS 'Usuario Actualiza';
LABEL ON COLUMN FIXMS.FECACT  IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN FIXMS.NUMACT  TEXT IS 'Número Activo';
LABEL ON COLUMN FIXMS.DESACT  TEXT IS 'Descripción';
LABEL ON COLUMN FIXMS.FECADQ  TEXT IS 'Fecha Adquisición';
LABEL ON COLUMN FIXMS.VALADQ  TEXT IS 'Valor Adquisición';
LABEL ON COLUMN FIXMS.VIDUTLMES  TEXT IS 'Vida Útil Meses';
LABEL ON COLUMN FIXMS.DEPACM  TEXT IS 'Depreciación Acumulado';
LABEL ON COLUMN FIXMS.ESTACT  TEXT IS 'Estado Activo';
LABEL ON COLUMN FIXMS.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN FIXMS.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN FIXMS.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN FIXMS.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN FIXMS.FECING  TEXT IS 'Fecha Creación';
LABEL ON COLUMN FIXMS.USRACT  TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN FIXMS.FECACT  TEXT IS 'Fecha Actualiza';