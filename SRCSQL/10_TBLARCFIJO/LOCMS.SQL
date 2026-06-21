--======================================================================
-- Nombre de la Tabla : LOCMS - LOCALIZ_ACTIVOS
--
-- DESCRIPCIÓN:
-- Maestro de Localizaciones de Activos Fijos. Define las
-- ubicaciones físicas donde se encuentran los activos fijos
-- de la entidad, incluyendo valoración y depreciación
-- asociada a cada localización.
--
-- Objetivo:
-- Centralizar las localizaciones físicas para el control
-- y seguimiento geográfico de los activos fijos del banco.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Administración de activos fijos y control patrimonial.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Consultado por procesos de control y reportes de activos
-- para identificar la ubicación física de cada activo.
--
-- Restricciones:
-- PK simple: numero_localizacion.
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

CREATE OR REPLACE TABLE LOCMS (

    NUMERO_LOCALIZACION FOR COLUMN NUMLOC VARCHAR(30)
                            NOT NULL,

    DESCRIPCION FOR COLUMN DESLOC VARCHAR(120)
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

    CONSTRAINT LOCMS_PK PRIMARY KEY (NUMLOC),

    CONSTRAINT LOCMS_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RLOCMS;

RENAME TABLE LOCMS
TO LOCALIZ_ACTIVOS
FOR SYSTEM NAME LOCMS;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE LOCMS IS
'LOCALIZ_ACTIVOS';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN LOCMS.NUMLOC IS
'Número de localización del activo fijo. PK de la tabla.';

COMMENT ON COLUMN LOCMS.DESLOC IS
'Descripción de la localización.';

COMMENT ON COLUMN LOCMS.FECADQ IS
'Fecha de adquisición asociada a la localización.';

COMMENT ON COLUMN LOCMS.VALADQ IS
'Valor de adquisición base de la localización.';

COMMENT ON COLUMN LOCMS.VIDUTLMES IS
'Vida útil expresada en meses.';

COMMENT ON COLUMN LOCMS.DEPACM IS
'Depreciación acumulada a la fecha.';

COMMENT ON COLUMN LOCMS.ESTACT IS
'Estado operativo.';

COMMENT ON COLUMN LOCMS.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN LOCMS.OBSREG IS
'Observaciones adicionales de la localización.';

COMMENT ON COLUMN LOCMS.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN LOCMS.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN LOCMS.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN LOCMS.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN LOCMS.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE LOCMS IS 'LOCALIZ_ACTIVOS';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN LOCMS.NUMLOC  IS 'Núm. Localización';
LABEL ON COLUMN LOCMS.DESLOC  IS 'Descripción';
LABEL ON COLUMN LOCMS.FECADQ  IS 'Fecha Adquisición';
LABEL ON COLUMN LOCMS.VALADQ  IS 'Valor Adquisición';
LABEL ON COLUMN LOCMS.VIDUTLMES  IS 'Vida Útil Meses';
LABEL ON COLUMN LOCMS.DEPACM  IS 'Depreciación Acumulado';
LABEL ON COLUMN LOCMS.ESTACT  IS 'Estado Activo';
LABEL ON COLUMN LOCMS.VERREG  IS 'Versión Registro';
LABEL ON COLUMN LOCMS.OBSREG  IS 'Observaciones';
LABEL ON COLUMN LOCMS.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN LOCMS.USRING  IS 'Usuario Creación';
LABEL ON COLUMN LOCMS.FECING  IS 'Fecha Creación';
LABEL ON COLUMN LOCMS.USRACT  IS 'Usuario Actualiza';
LABEL ON COLUMN LOCMS.FECACT  IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN LOCMS.NUMLOC  TEXT IS 'Núm. Localización';
LABEL ON COLUMN LOCMS.DESLOC  TEXT IS 'Descripción';
LABEL ON COLUMN LOCMS.FECADQ  TEXT IS 'Fecha Adquisición';
LABEL ON COLUMN LOCMS.VALADQ  TEXT IS 'Valor Adquisición';
LABEL ON COLUMN LOCMS.VIDUTLMES  TEXT IS 'Vida Útil Meses';
LABEL ON COLUMN LOCMS.DEPACM  TEXT IS 'Depreciación Acumulado';
LABEL ON COLUMN LOCMS.ESTACT  TEXT IS 'Estado Activo';
LABEL ON COLUMN LOCMS.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN LOCMS.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN LOCMS.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN LOCMS.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN LOCMS.FECING  TEXT IS 'Fecha Creación';
LABEL ON COLUMN LOCMS.USRACT  TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN LOCMS.FECACT  TEXT IS 'Fecha Actualiza';