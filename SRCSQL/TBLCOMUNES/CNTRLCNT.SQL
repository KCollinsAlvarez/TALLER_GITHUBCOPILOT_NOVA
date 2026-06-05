--======================================================================
-- Nombre de la Tabla : CNTRLCNT - PARAM_GENERALES
--
-- DESCRIPCIÓN:
-- Archivo de Parámetros Generales del Sistema. Almacena la
-- configuración central del sistema por entidad bancaria,
-- incluyendo valores de texto, numéricos y vigencias que
-- controlan el comportamiento general del sistema.
--
-- Objetivo:
-- Centralizar los parámetros de configuración operativa del
-- sistema por banco, permitiendo ajustes de comportamiento
-- sin modificar código fuente.
--
-- Tipo de Tabla:
-- Configuración.
--
-- Origen de los Datos:
-- Administración del sistema y configuración inicial del banco.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Consultado por procesos operativos y batch para obtener
-- parámetros de ejecución y configuración por entidad.
--
-- Restricciones:
-- PK por codigo_banco; un registro por entidad bancaria.
-- ESTADO_REGISTRO solo acepta valores A o I.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-04
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CNTRLCNT (

    CODIGO_BANCO FOR COLUMN CODBCO VARCHAR(20)
                     NOT NULL,

    DESCRIPCION FOR COLUMN DESPRM VARCHAR(120)
                    NOT NULL DEFAULT '',

    VALOR_TEXTO FOR COLUMN VALTXT VARCHAR(50)
                    NOT NULL DEFAULT '',

    VALOR_NUMERICO FOR COLUMN VALNUM DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    VIGENCIA_DESDE FOR COLUMN VIGDED DATE
                       NOT NULL DEFAULT '0001-01-01',

    VIGENCIA_HASTA FOR COLUMN VIGHAS DATE
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

    CONSTRAINT CNTRLCNT_PK PRIMARY KEY (CODBCO),

    CONSTRAINT CNTRLCNT_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCNTRLCNT;

RENAME TABLE CNTRLCNT
TO PARAM_GENERALES
FOR SYSTEM NAME CNTRLCNT;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CNTRLCNT IS
'PARAM_GENERALES';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CNTRLCNT.CODBCO IS
'Código único de la entidad bancaria.';

COMMENT ON COLUMN CNTRLCNT.DESPRM IS
'Descripción general del parámetro o configuración del sistema
 para la entidad bancaria.';

COMMENT ON COLUMN CNTRLCNT.VALTXT IS
'Valor de texto asociado al parámetro general del sistema.';

COMMENT ON COLUMN CNTRLCNT.VALNUM IS
'Valor numérico asociado al parámetro general del sistema.';

COMMENT ON COLUMN CNTRLCNT.VIGDED IS
'Fecha de inicio de vigencia del parámetro. Indica desde cuándo
 es válida la configuración registrada.';

COMMENT ON COLUMN CNTRLCNT.VIGHAS IS
'Fecha de fin de vigencia del parámetro. Indica hasta cuándo
 es válida la configuración registrada.';

COMMENT ON COLUMN CNTRLCNT.ORDVIZ IS
'Orden de visualización del registro en pantallas y reportes.
 Permite controlar la presentación de los parámetros.';

COMMENT ON COLUMN CNTRLCNT.VERREG IS
'Número de versión del registro. Se incrementa en cada
 actualización para control de cambios y auditoría.';

COMMENT ON COLUMN CNTRLCNT.OBSREG IS
'Observaciones adicionales o notas relacionadas con el
 parámetro o su configuración.';

COMMENT ON COLUMN CNTRLCNT.ESTREG IS
'Estado del registro. Valores válidos:
 A = Activo, I = Inactivo.';

COMMENT ON COLUMN CNTRLCNT.USRING IS
'Usuario del sistema que creó el registro. Se asigna
 automáticamente con el valor del usuario de sesión (USER).';

COMMENT ON COLUMN CNTRLCNT.FECING IS
'Fecha y hora de creación del registro. Se asigna
 automáticamente al momento del INSERT.';

COMMENT ON COLUMN CNTRLCNT.USRACT IS
'Usuario del sistema que realizó la última actualización.
 Se asigna automáticamente con el valor del usuario de sesión.';

COMMENT ON COLUMN CNTRLCNT.FECACT IS
'Fecha y hora de la última actualización del registro.
 Se asigna automáticamente al momento del UPDATE.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CNTRLCNT IS 'PARAM_GENERALES';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CNTRLCNT.CODBCO  IS 'Código Banco';
LABEL ON COLUMN CNTRLCNT.DESPRM  IS 'Descripción';
LABEL ON COLUMN CNTRLCNT.VALTXT  IS 'Valor Texto';
LABEL ON COLUMN CNTRLCNT.VALNUM  IS 'Valor Numérico';
LABEL ON COLUMN CNTRLCNT.VIGDED  IS 'Vigencia Desde';
LABEL ON COLUMN CNTRLCNT.VIGHAS  IS 'Vigencia Hasta';
LABEL ON COLUMN CNTRLCNT.ORDVIZ  IS 'Orden Visualización';
LABEL ON COLUMN CNTRLCNT.VERREG  IS 'Versión Registro';
LABEL ON COLUMN CNTRLCNT.OBSREG  IS 'Observaciones';
LABEL ON COLUMN CNTRLCNT.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN CNTRLCNT.USRING  IS 'Usuario Creación';
LABEL ON COLUMN CNTRLCNT.FECING  IS 'Fecha Creación';
LABEL ON COLUMN CNTRLCNT.USRACT  IS 'Usuario Actualización';
LABEL ON COLUMN CNTRLCNT.FECACT  IS 'Fecha Actualización';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CNTRLCNT.CODBCO  TEXT IS 'Código de Banco';
LABEL ON COLUMN CNTRLCNT.DESPRM  TEXT IS 'Descripción';
LABEL ON COLUMN CNTRLCNT.VALTXT  TEXT IS 'Valor de Texto';
LABEL ON COLUMN CNTRLCNT.VALNUM  TEXT IS 'Valor Numérico';
LABEL ON COLUMN CNTRLCNT.VIGDED  TEXT IS 'Vigencia Desde';
LABEL ON COLUMN CNTRLCNT.VIGHAS  TEXT IS 'Vigencia Hasta';
LABEL ON COLUMN CNTRLCNT.ORDVIZ  TEXT IS 'Orden de Visualización';
LABEL ON COLUMN CNTRLCNT.VERREG  TEXT IS 'Versión del Registro';
LABEL ON COLUMN CNTRLCNT.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN CNTRLCNT.ESTREG  TEXT IS 'Estado del Registro';
LABEL ON COLUMN CNTRLCNT.USRING  TEXT IS 'Usuario de Creación';
LABEL ON COLUMN CNTRLCNT.FECING  TEXT IS 'Fecha de Creación';
LABEL ON COLUMN CNTRLCNT.USRACT  TEXT IS 'Usuario de Actualización';
LABEL ON COLUMN CNTRLCNT.FECACT  TEXT IS 'Fecha de Actualización';