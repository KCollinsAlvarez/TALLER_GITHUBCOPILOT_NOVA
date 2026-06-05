--======================================================================
-- Nombre de la Tabla : CNTRLTAX - DEFINICION_IMPUESTOS
--
-- DESCRIPCIÓN:
-- Definiciones para el manejo y cobro de impuestos por entidad
-- bancaria. Almacena los parámetros de configuración fiscal
-- aplicables por banco y tipo de impuesto.
--
-- Objetivo:
-- Centralizar las definiciones fiscales que rigen el cobro
-- de impuestos por banco y código de impuesto en el sistema.
--
-- Tipo de Tabla:
-- Configuración.
--
-- Origen de los Datos:
-- Administración del sistema y configuración fiscal del banco.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Consultado por procesos operativos y batch para aplicar
-- las definiciones fiscales correspondientes por banco.
--
-- Restricciones:
-- PK compuesta por codigo_banco y codigo_impuesto.
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-04
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CNTRLTAX (

    CODIGO_BANCO FOR COLUMN CODBCO VARCHAR(20)
                     NOT NULL,

    CODIGO_IMPUESTO FOR COLUMN CODIMP VARCHAR(20)
                        NOT NULL,

    DESCRIPCION FOR COLUMN DESPRM VARCHAR(120)
                    NOT NULL DEFAULT '',

    VALOR_TEXTO FOR COLUMN VALTXT VARCHAR(50)
                    NOT NULL DEFAULT '',

    VALOR_NUMERICO FOR COLUMN VALNUM DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    VIGENCIA_DESDE FOR COLUMN VIGDED DATE
                       NOT NULL DEFAULT '0001-01-01',

    VIGENCIA_HASTA FOR COLUMN VIGHST DATE
                       NOT NULL DEFAULT '0001-01-01',

    ORDEN_VISUALIZACION FOR COLUMN ORDVIZ INTEGER
                            NOT NULL DEFAULT 0,

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

    CONSTRAINT CNTRLTAX_PK PRIMARY KEY (CODBCO, CODIMP),

    CONSTRAINT CNTRLTAX_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCNTRLTAX;

RENAME TABLE CNTRLTAX
TO DEFINICION_IMPUESTOS
FOR SYSTEM NAME CNTRLTAX;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CNTRLTAX IS
'DEFINICION_IMPUESTOS';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CNTRLTAX.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN CNTRLTAX.CODIMP IS
'Código del impuesto.';

COMMENT ON COLUMN CNTRLTAX.DESPRM IS
'Descripción del parámetro fiscal.';

COMMENT ON COLUMN CNTRLTAX.VALTXT IS
'Valor de texto del parámetro de configuración.';

COMMENT ON COLUMN CNTRLTAX.VALNUM IS
'Valor numérico del parámetro de configuración.';

COMMENT ON COLUMN CNTRLTAX.VIGDED IS
'Fecha de inicio de vigencia del parámetro.';

COMMENT ON COLUMN CNTRLTAX.VIGHST IS
'Fecha de fin de vigencia del parámetro.';

COMMENT ON COLUMN CNTRLTAX.ORDVIZ IS
'Orden de visualización en pantallas y reportes.';

COMMENT ON COLUMN CNTRLTAX.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN CNTRLTAX.OBSREG IS
'Observaciones adicionales del parámetro.';

COMMENT ON COLUMN CNTRLTAX.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN CNTRLTAX.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN CNTRLTAX.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN CNTRLTAX.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN CNTRLTAX.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CNTRLTAX IS 'DEFINICION_IMPUESTOS';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CNTRLTAX.CODBCO  IS 'Código Banco';
LABEL ON COLUMN CNTRLTAX.CODIMP  IS 'Código Impuesto';
LABEL ON COLUMN CNTRLTAX.DESPRM  IS 'Descripción';
LABEL ON COLUMN CNTRLTAX.VALTXT  IS 'Valor Texto';
LABEL ON COLUMN CNTRLTAX.VALNUM  IS 'Valor Numérico';
LABEL ON COLUMN CNTRLTAX.VIGDED  IS 'Vigencia Desde';
LABEL ON COLUMN CNTRLTAX.VIGHST  IS 'Vigencia Hasta';
LABEL ON COLUMN CNTRLTAX.ORDVIZ  IS 'Orden Visual';
LABEL ON COLUMN CNTRLTAX.VERREG  IS 'Versión Registro';
LABEL ON COLUMN CNTRLTAX.OBSREG  IS 'Observaciones';
LABEL ON COLUMN CNTRLTAX.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN CNTRLTAX.USRING  IS 'Usuario Creación';
LABEL ON COLUMN CNTRLTAX.FECING  IS 'Fecha Creación';
LABEL ON COLUMN CNTRLTAX.USRACT  IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLTAX.FECACT  IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CNTRLTAX.CODBCO  TEXT IS 'Código Banco';
LABEL ON COLUMN CNTRLTAX.CODIMP  TEXT IS 'Código Impuesto';
LABEL ON COLUMN CNTRLTAX.DESPRM  TEXT IS 'Descripción';
LABEL ON COLUMN CNTRLTAX.VALTXT  TEXT IS 'Valor Texto';
LABEL ON COLUMN CNTRLTAX.VALNUM  TEXT IS 'Valor Numérico';
LABEL ON COLUMN CNTRLTAX.VIGDED  TEXT IS 'Vigencia Desde';
LABEL ON COLUMN CNTRLTAX.VIGHST  TEXT IS 'Vigencia Hasta';
LABEL ON COLUMN CNTRLTAX.ORDVIZ  TEXT IS 'Orden Visual';
LABEL ON COLUMN CNTRLTAX.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN CNTRLTAX.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN CNTRLTAX.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN CNTRLTAX.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN CNTRLTAX.FECING  TEXT IS 'Fecha Creación';
LABEL ON COLUMN CNTRLTAX.USRACT  TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLTAX.FECACT  TEXT IS 'Fecha Actualiza';