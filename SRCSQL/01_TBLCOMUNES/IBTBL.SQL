--======================================================================
-- Nombre de la Tabla : IBTBL - REF_CRUZADA_INTERSUC
--
-- DESCRIPCIÓN:
-- Archivo de Referencias Cruzadas para manejo de Intersucursales.
-- Registra la definición de cruces entre sucursales y parámetros de
-- referencia.
--
-- Objetivo:
-- Centralizar las referencias cruzadas para operaciones
-- intersucursales.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Definiciones de referencias cruzadas del sistema.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte para rutas intersucursales y procesamiento transaccional.
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

CREATE OR REPLACE TABLE IBTBL (

    IDENTIFICADOR_REF FOR COLUMN IDNREF BIGINT NOT NULL
           GENERATED ALWAYS AS IDENTITY,

    DESCRIPCION FOR COLUMN DESREF VARCHAR(120)
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

    CONSTRAINT IBTBL_PK PRIMARY KEY (IDNREF),

    CONSTRAINT IBTBL_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RIBTBL;

RENAME TABLE IBTBL
TO REF_CRUZADA_INTERSUC
FOR SYSTEM NAME IBTBL;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE IBTBL IS
'REF_CRUZADA_INTERSUC';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN IBTBL.IDNREF IS
'Identificador técnico único.';

COMMENT ON COLUMN IBTBL.DESREF IS
'Descripción de la referencia cruzada.';

COMMENT ON COLUMN IBTBL.VALTXT IS
'Valor texto de la referencia cruzada.';

COMMENT ON COLUMN IBTBL.VALNUM IS
'Valor numérico de la referencia cruzada.';

COMMENT ON COLUMN IBTBL.VIGDES IS
'Fecha de inicio de vigencia.';

COMMENT ON COLUMN IBTBL.VIGHAS IS
'Fecha de fin de vigencia.';

COMMENT ON COLUMN IBTBL.ORDVIZ IS
'Orden de visualización.';

COMMENT ON COLUMN IBTBL.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN IBTBL.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN IBTBL.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN IBTBL.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN IBTBL.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN IBTBL.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN IBTBL.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE IBTBL IS 'REF_CRUZADA_INTERSUC';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN IBTBL.IDNREF IS 'ID';
LABEL ON COLUMN IBTBL.DESREF IS 'Descripción';
LABEL ON COLUMN IBTBL.VALTXT IS 'Valor Texto';
LABEL ON COLUMN IBTBL.VALNUM IS 'Valor Numérico';
LABEL ON COLUMN IBTBL.VIGDES IS 'Vigencia Desde';
LABEL ON COLUMN IBTBL.VIGHAS IS 'Vigencia Hasta';
LABEL ON COLUMN IBTBL.ORDVIZ IS 'Orden Visualización';
LABEL ON COLUMN IBTBL.VERREG IS 'Versión Registro';
LABEL ON COLUMN IBTBL.OBSREG IS 'Observaciones';
LABEL ON COLUMN IBTBL.ESTREG IS 'Estado Registro';
LABEL ON COLUMN IBTBL.USRING IS 'Usuario Creación';
LABEL ON COLUMN IBTBL.FECING IS 'Fecha Creación';
LABEL ON COLUMN IBTBL.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN IBTBL.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN IBTBL.IDNREF TEXT IS 'ID';
LABEL ON COLUMN IBTBL.DESREF TEXT IS 'Descripción';
LABEL ON COLUMN IBTBL.VALTXT TEXT IS 'Valor Texto';
LABEL ON COLUMN IBTBL.VALNUM TEXT IS 'Valor Numérico';
LABEL ON COLUMN IBTBL.VIGDES TEXT IS 'Vigencia Desde';
LABEL ON COLUMN IBTBL.VIGHAS TEXT IS 'Vigencia Hasta';
LABEL ON COLUMN IBTBL.ORDVIZ TEXT IS 'Orden Visualización';
LABEL ON COLUMN IBTBL.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN IBTBL.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN IBTBL.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN IBTBL.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN IBTBL.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN IBTBL.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN IBTBL.FECACT TEXT IS 'Fecha Actualiza';
