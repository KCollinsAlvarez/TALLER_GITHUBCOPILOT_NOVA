--======================================================================
-- Nombre de la Tabla : CLSMS - CLASES_AMORTIZACION
--
-- DESCRIPCIÓN:
-- Maestro de Clases de Amortizaciones de Activos Fijos.
-- Define las categorías de amortización aplicables a los
-- activos fijos, incluyendo parámetros de vida útil,
-- valoración y depreciación por clase.
--
-- Objetivo:
-- Centralizar las clases de amortización que rigen el cálculo
-- de depreciación de los activos fijos de la entidad bancaria.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Administración contable y configuración de activos fijos.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referenciado por procesos de depreciación y control de
-- activos para determinar el método de amortización aplicable.
--
-- Restricciones:
-- PK simple: codigo_clase.
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

CREATE OR REPLACE TABLE CLSMS (

    CODIGO_CLASE FOR COLUMN CODCLS VARCHAR(20)
                     NOT NULL,

    DESCRIPCION FOR COLUMN DESCLS VARCHAR(120)
                    NOT NULL DEFAULT '',

    FECHA_ADQUISICION FOR COLUMN FECADQ DATE
                          NOT NULL DEFAULT '0001-01-01',

    VALOR_ADQUISICION FOR COLUMN VALADQ DECIMAL(18, 2)
                          NOT NULL DEFAULT 0,

    VIDA_UTIL_MESES FOR COLUMN VALUTLMES INTEGER
                        NOT NULL DEFAULT 0,

    DEPRECIACION_ACUM FOR COLUMN DEPACM DECIMAL(18, 2)
                          NOT NULL DEFAULT 0,

    ESTADO_ACTIVO FOR COLUMN ESTACT VARCHAR(20)
                      NOT NULL DEFAULT ' ',

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

    CONSTRAINT CLSMS_PK PRIMARY KEY (CODCLS),

    CONSTRAINT CLSMS_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCLSMS;

RENAME TABLE CLSMS
TO CLASES_AMORTIZACION
FOR SYSTEM NAME CLSMS;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CLSMS IS
'CLASES_AMORTIZACION';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CLSMS.CODCLS IS
'Código de la clase de amortización. PK de la tabla.';

COMMENT ON COLUMN CLSMS.DESCLS IS
'Descripción de la clase de amortización.';

COMMENT ON COLUMN CLSMS.FECADQ IS
'Fecha de adquisición asociada a la clase.';

COMMENT ON COLUMN CLSMS.VALADQ IS
'Valor de adquisición base de la clase.';

COMMENT ON COLUMN CLSMS.VALUTLMES IS
'Vida útil de la clase expresada en meses.';

COMMENT ON COLUMN CLSMS.DEPACM IS
'Depreciación acumulada de la clase a la fecha.';

COMMENT ON COLUMN CLSMS.ESTACT IS
'Estado operativo de la clase.
 A=Activo, B=Baja, V=Vendido, D=Depreciado.';

COMMENT ON COLUMN CLSMS.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN CLSMS.OBSREG IS
'Observaciones adicionales de la clase.';

COMMENT ON COLUMN CLSMS.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN CLSMS.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN CLSMS.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN CLSMS.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN CLSMS.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CLSMS IS 'CLASES_AMORTIZACION';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CLSMS.CODCLS  IS 'Código Clase';
LABEL ON COLUMN CLSMS.DESCLS  IS 'Descripción';
LABEL ON COLUMN CLSMS.FECADQ  IS 'Fecha Adquisición';
LABEL ON COLUMN CLSMS.VALADQ  IS 'Valor Adquisición';
LABEL ON COLUMN CLSMS.VALUTLMES  IS 'Vida Útil Meses';
LABEL ON COLUMN CLSMS.DEPACM  IS 'Depreciación Acumulado';
LABEL ON COLUMN CLSMS.ESTACT  IS 'Estado Activo';
LABEL ON COLUMN CLSMS.VERREG  IS 'Versión Registro';
LABEL ON COLUMN CLSMS.OBSREG  IS 'Observaciones';
LABEL ON COLUMN CLSMS.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN CLSMS.USRING  IS 'Usuario Creación';
LABEL ON COLUMN CLSMS.FECING  IS 'Fecha Creación';
LABEL ON COLUMN CLSMS.USRACT  IS 'Usuario Actualiza';
LABEL ON COLUMN CLSMS.FECACT  IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CLSMS.CODCLS  TEXT IS 'Código Clase';
LABEL ON COLUMN CLSMS.DESCLS  TEXT IS 'Descripción';
LABEL ON COLUMN CLSMS.FECADQ  TEXT IS 'Fecha Adquisición';
LABEL ON COLUMN CLSMS.VALADQ  TEXT IS 'Valor Adquisición';
LABEL ON COLUMN CLSMS.VALUTLMES  TEXT IS 'Vida Útil Meses';
LABEL ON COLUMN CLSMS.DEPACM  TEXT IS 'Depreciación Acumulado';
LABEL ON COLUMN CLSMS.ESTACT  TEXT IS 'Estado Activo';
LABEL ON COLUMN CLSMS.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN CLSMS.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN CLSMS.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN CLSMS.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN CLSMS.FECING  TEXT IS 'Fecha Creación';
LABEL ON COLUMN CLSMS.USRACT  TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN CLSMS.FECACT  TEXT IS 'Fecha Actualiza';