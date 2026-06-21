--======================================================================
-- Nombre de la Tabla : CNTRLNUM - CONTROL_NUMERACION
--
-- DESCRIPCIÓN:
-- Control de Numeración Automática de Operaciones. Almacena
-- los parámetros que rigen la generación automática de números
-- de operación por aplicación y tipo de cuenta.
--
-- Objetivo:
-- Garantizar la numeración secuencial y controlada de
-- operaciones por aplicación y tipo de cuenta en el sistema.
--
-- Tipo de Tabla:
-- Configuración.
--
-- Origen de los Datos:
-- Administración del sistema durante configuración inicial.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Consultado por procesos operativos para obtener y actualizar
-- el consecutivo de numeración por aplicación y tipo.
--
-- Restricciones:
-- PK compuesta por codigo_aplicacion y tipo_cuenta.
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-04
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CNTRLNUM (

    CODIGO_APLICACION FOR COLUMN CODAPL VARCHAR(20)
                          NOT NULL,

    TIPO_CUENTA FOR COLUMN TIPCTA VARCHAR(20)
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

    CONSTRAINT CNTRLNUM_PK PRIMARY KEY (CODAPL, TIPCTA),

    CONSTRAINT CNTRLNUM_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCNTRLNUM;

RENAME TABLE CNTRLNUM
TO CONTROL_NUMERACION
FOR SYSTEM NAME CNTRLNUM;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CNTRLNUM IS
'CONTROL_NUMERACION';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CNTRLNUM.CODAPL IS
'Código de la aplicación.';

COMMENT ON COLUMN CNTRLNUM.TIPCTA IS
'Tipo de cuenta asociado a la numeración.';

COMMENT ON COLUMN CNTRLNUM.DESPRM IS
'Descripción del parámetro de numeración.';

COMMENT ON COLUMN CNTRLNUM.VALTXT IS
'Valor de texto del parámetro de configuración.';

COMMENT ON COLUMN CNTRLNUM.VALNUM IS
'Valor numérico del parámetro de configuración.';

COMMENT ON COLUMN CNTRLNUM.VIGDED IS
'Fecha de inicio de vigencia del parámetro.';

COMMENT ON COLUMN CNTRLNUM.VIGHST IS
'Fecha de fin de vigencia del parámetro.';

COMMENT ON COLUMN CNTRLNUM.ORDVIZ IS
'Orden de visualización en pantallas y reportes.';

COMMENT ON COLUMN CNTRLNUM.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN CNTRLNUM.OBSREG IS
'Observaciones adicionales del parámetro.';

COMMENT ON COLUMN CNTRLNUM.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN CNTRLNUM.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN CNTRLNUM.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN CNTRLNUM.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN CNTRLNUM.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CNTRLNUM IS 'CONTROL_NUMERACION';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CNTRLNUM.CODAPL  IS 'Código Aplicación';
LABEL ON COLUMN CNTRLNUM.TIPCTA  IS 'Tipo Cuenta';
LABEL ON COLUMN CNTRLNUM.DESPRM  IS 'Descripción';
LABEL ON COLUMN CNTRLNUM.VALTXT  IS 'Valor Texto';
LABEL ON COLUMN CNTRLNUM.VALNUM  IS 'Valor Numérico';
LABEL ON COLUMN CNTRLNUM.VIGDED  IS 'Vigencia Desde';
LABEL ON COLUMN CNTRLNUM.VIGHST  IS 'Vigencia Hasta';
LABEL ON COLUMN CNTRLNUM.ORDVIZ  IS 'Orden Visual';
LABEL ON COLUMN CNTRLNUM.VERREG  IS 'Versión Registro';
LABEL ON COLUMN CNTRLNUM.OBSREG  IS 'Observaciones';
LABEL ON COLUMN CNTRLNUM.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN CNTRLNUM.USRING  IS 'Usuario Creación';
LABEL ON COLUMN CNTRLNUM.FECING  IS 'Fecha Creación';
LABEL ON COLUMN CNTRLNUM.USRACT  IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLNUM.FECACT  IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CNTRLNUM.CODAPL  TEXT IS 'Código Aplicación';
LABEL ON COLUMN CNTRLNUM.TIPCTA  TEXT IS 'Tipo Cuenta';
LABEL ON COLUMN CNTRLNUM.DESPRM  TEXT IS 'Descripción';
LABEL ON COLUMN CNTRLNUM.VALTXT  TEXT IS 'Valor Texto';
LABEL ON COLUMN CNTRLNUM.VALNUM  TEXT IS 'Valor Numérico';
LABEL ON COLUMN CNTRLNUM.VIGDED  TEXT IS 'Vigencia Desde';
LABEL ON COLUMN CNTRLNUM.VIGHST  TEXT IS 'Vigencia Hasta';
LABEL ON COLUMN CNTRLNUM.ORDVIZ  TEXT IS 'Orden Visual';
LABEL ON COLUMN CNTRLNUM.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN CNTRLNUM.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN CNTRLNUM.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN CNTRLNUM.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN CNTRLNUM.FECING  TEXT IS 'Fecha Creación';
LABEL ON COLUMN CNTRLNUM.USRACT  TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLNUM.FECACT  TEXT IS 'Fecha Actualiza';