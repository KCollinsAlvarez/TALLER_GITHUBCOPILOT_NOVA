--======================================================================
-- Nombre de la Tabla : CIFXF - RELACION_OPE_CLIENTE
--
-- DESCRIPCIÓN:
-- Relación de operaciones con clientes. Registra la asociación entre
-- operaciones y clientes con información de vigencia y parámetros.
--
-- Objetivo:
-- Centralizar la relación de operaciones ligadas a clientes para
-- análisis y seguimiento.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Operaciones de clientes registradas en el banco.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte para reportes y análisis de operaciones de clientes.
--
-- Restricciones:
-- PK simple: id.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-17
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CIFXF (

    IDENTIFICADOR FOR COLUMN IDNRLC BIGINT NOT NULL
           GENERATED ALWAYS AS IDENTITY,

    DESCRIPCION FOR COLUMN DESRLC VARCHAR(120)
                           NOT NULL DEFAULT '',

    VALOR_TEXTO FOR COLUMN VALTXT VARCHAR(50)
                       NOT NULL DEFAULT '',

    VALOR_NUMERICO FOR COLUMN VALNUM DECIMAL(18, 2)
                          NOT NULL DEFAULT 0,

    VIGENCIA_DESDE FOR COLUMN VIGDES DATE
                        NOT NULL DEFAULT '0001-01-01',

    VIGENCIA_HASTA FOR COLUMN VIGHAS DATE
                        NOT NULL DEFAULT '0001-01-01',

    ORDEN_VISUALIZACION FOR COLUMN ORDVIZ INT
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

    CONSTRAINT CIFXF_PK PRIMARY KEY (IDNRLC),

    CONSTRAINT CIFXF_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCIFXF;

RENAME TABLE CIFXF
TO RELACION_OPE_CLIENTE
FOR SYSTEM NAME CIFXF;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CIFXF IS
'RELACION_OPE_CLIENTE';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CIFXF.IDNRLC IS
'Identificador técnico único.';

COMMENT ON COLUMN CIFXF.DESRLC IS
'Descripción de la relación de operaciones.';

COMMENT ON COLUMN CIFXF.VALTXT IS
'Valor de texto de la operación.';

COMMENT ON COLUMN CIFXF.VALNUM IS
'Valor numérico de la operación.';

COMMENT ON COLUMN CIFXF.VIGDES IS
'Fecha de inicio de vigencia.';

COMMENT ON COLUMN CIFXF.VIGHAS IS
'Fecha de fin de vigencia.';

COMMENT ON COLUMN CIFXF.ORDVIZ IS
'Orden de visualización.';

COMMENT ON COLUMN CIFXF.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN CIFXF.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN CIFXF.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN CIFXF.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN CIFXF.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN CIFXF.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN CIFXF.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CIFXF IS 'RELACION_OPE_CLIENTE';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CIFXF.IDNRLC IS 'ID';
LABEL ON COLUMN CIFXF.DESRLC IS 'Descripción';
LABEL ON COLUMN CIFXF.VALTXT IS 'Valor Texto';
LABEL ON COLUMN CIFXF.VALNUM IS 'Valor Numérico';
LABEL ON COLUMN CIFXF.VIGDES IS 'Vigencia Desde';
LABEL ON COLUMN CIFXF.VIGHAS IS 'Vigencia Hasta';
LABEL ON COLUMN CIFXF.ORDVIZ IS 'Orden Visualización';
LABEL ON COLUMN CIFXF.VERREG IS 'Versión Registro';
LABEL ON COLUMN CIFXF.OBSREG IS 'Observaciones';
LABEL ON COLUMN CIFXF.ESTREG IS 'Estado Registro';
LABEL ON COLUMN CIFXF.USRING IS 'Usuario Creación';
LABEL ON COLUMN CIFXF.FECING IS 'Fecha Creación';
LABEL ON COLUMN CIFXF.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN CIFXF.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CIFXF.IDNRLC TEXT IS 'ID';
LABEL ON COLUMN CIFXF.DESRLC TEXT IS 'Descripción';
LABEL ON COLUMN CIFXF.VALTXT TEXT IS 'Valor Texto';
LABEL ON COLUMN CIFXF.VALNUM TEXT IS 'Valor Numérico';
LABEL ON COLUMN CIFXF.VIGDES TEXT IS 'Vigencia Desde';
LABEL ON COLUMN CIFXF.VIGHAS TEXT IS 'Vigencia Hasta';
LABEL ON COLUMN CIFXF.ORDVIZ TEXT IS 'Orden Visualización';
LABEL ON COLUMN CIFXF.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN CIFXF.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN CIFXF.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN CIFXF.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN CIFXF.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN CIFXF.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN CIFXF.FECACT TEXT IS 'Fecha Actualiza';