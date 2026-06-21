--======================================================================
-- Nombre de la Tabla : IBSDD - DICCIONARIO_DATOS
--
-- DESCRIPCIÓN:
-- Diccionario de datos del sistema IBS.
--
-- Objetivo:
-- Mantener información descriptiva y de referencia utilizada por
-- los diferentes componentes funcionales del sistema.
--
-- Tipo de Tabla:
-- Configuración.
--
-- Origen de los Datos:
-- Procesos administrativos y parametrización del sistema.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Consulta de definiciones y referencias de datos.
--
-- Restricciones:
-- Identificador único por registro.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-04
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE IBSDD (
    IDENTIFICADOR FOR COLUMN IDREG BIGINT
    NOT NULL GENERATED ALWAYS AS IDENTITY,

    DESCRIPCION FOR COLUMN DESREG VARCHAR(120)
    NOT NULL DEFAULT '',

    VALOR_TEXTO FOR COLUMN VALTEX VARCHAR(50)
    NOT NULL DEFAULT '',

    VALOR_NUMERICO FOR COLUMN VALNUM DECIMAL(18, 2)
    NOT NULL DEFAULT 0,

    VIGENCIA_DESDE FOR COLUMN VIGDED DATE
    NOT NULL DEFAULT '0001-01-01',

    VIGENCIA_HASTA FOR COLUMN VIGHAS DATE
    NOT NULL DEFAULT '0001-01-01',

    ORDEN_VISUALIZACION FOR COLUMN ORDVIZ INTEGER
    NOT NULL DEFAULT 0,

    USUARIO_INGRESO FOR COLUMN USRING CHAR(18)
    NOT NULL DEFAULT USER,

    FECHA_INGRESO FOR COLUMN FECING TIMESTAMP
    NOT NULL WITH DEFAULT,

    USUARIO_ACTUALIZA FOR COLUMN USRACT CHAR(18)
    NOT NULL DEFAULT USER,

    FECHA_ACTUALIZA FOR COLUMN FECACT TIMESTAMP
    NOT NULL WITH DEFAULT,

    VERSION_REGISTRO FOR COLUMN VERREG INTEGER
    NOT NULL DEFAULT 0,

    OBSERVACIONES FOR COLUMN OBSREG VARCHAR(120)
    NOT NULL DEFAULT '',

    ESTADO_REGISTRO FOR COLUMN ESTREG CHAR(1)
    NOT NULL DEFAULT 'A',

    CONSTRAINT IBSDD_PK PRIMARY KEY (IDREG),

    CONSTRAINT IBSDD_ESTREG_CST CHECK (ESTREG IN ('A','I'))

)
RCDFMT RIBSDD;

RENAME TABLE IBSDD
TO DICCIONARIO_DATOS
FOR SYSTEM NAME IBSDD;

COMMENT ON TABLE IBSDD IS
'DICCIONARIO_DATOS';

--======================================================================
-- COMMENT ON COLUMN
--======================================================================

COMMENT ON COLUMN IBSDD.IDREG IS
'Identificador unico del registro';

COMMENT ON COLUMN IBSDD.DESREG IS
'Descripcion funcional del registro';

COMMENT ON COLUMN IBSDD.VALTEX IS
'Valor textual asociado al registro';

COMMENT ON COLUMN IBSDD.VALNUM IS
'Valor numerico asociado al registro';

COMMENT ON COLUMN IBSDD.VIGDED IS
'Fecha inicial de vigencia';

COMMENT ON COLUMN IBSDD.VIGHAS IS
'Fecha final de vigencia';

COMMENT ON COLUMN IBSDD.ORDVIZ IS
'Orden de visualizacion del registro';

COMMENT ON COLUMN IBSDD.USRING IS
'Usuario que crea el registro';

COMMENT ON COLUMN IBSDD.FECING IS
'Fecha y hora de creacion del registro';

COMMENT ON COLUMN IBSDD.USRACT IS
'Usuario que realiza la actualizacion';

COMMENT ON COLUMN IBSDD.FECACT IS
'Fecha y hora de ultima actualizacion';

COMMENT ON COLUMN IBSDD.VERREG IS
'Version del registro';

COMMENT ON COLUMN IBSDD.OBSREG IS
'Observaciones asociadas al registro';

COMMENT ON COLUMN IBSDD.ESTREG IS
'Estado del registro. Valores validos A=Activo I=Inactivo';

--======================================================================
-- LABEL ON COLUMN
--======================================================================
LABEL ON TABLE IBSDD IS
'DICCIONARIO_DATOS';

LABEL ON COLUMN IBSDD.IDREG IS 'Identificador';

LABEL ON COLUMN IBSDD.DESREG IS 'Descripcion';

LABEL ON COLUMN IBSDD.VALTEX IS 'Valor Texto';

LABEL ON COLUMN IBSDD.VALNUM IS 'Valor Numerico';

LABEL ON COLUMN IBSDD.VIGDED IS 'Vigencia Desde';

LABEL ON COLUMN IBSDD.VIGHAS IS 'Vigencia Hasta';

LABEL ON COLUMN IBSDD.ORDVIZ IS 'Orden Visualiza';

LABEL ON COLUMN IBSDD.USRING IS 'Usuario Ingreso';

LABEL ON COLUMN IBSDD.FECING IS 'Fecha Ingreso';

LABEL ON COLUMN IBSDD.USRACT IS 'Usuario Actualiza';

LABEL ON COLUMN IBSDD.FECACT IS 'Fecha Actualiza';

LABEL ON COLUMN IBSDD.VERREG IS 'Version Registro';

LABEL ON COLUMN IBSDD.OBSREG IS 'Observaciones';

LABEL ON COLUMN IBSDD.ESTREG IS 'Estado Registro';

--======================================================================
-- LABEL ON COLUMN TEXT IS
--======================================================================

LABEL ON COLUMN IBSDD.IDREG TEXT IS 'Identificador';

LABEL ON COLUMN IBSDD.DESREG TEXT IS 'Descripcion';

LABEL ON COLUMN IBSDD.VALTEX TEXT IS 'Valor Texto';

LABEL ON COLUMN IBSDD.VALNUM TEXT IS 'Valor Numerico';

LABEL ON COLUMN IBSDD.VIGDED TEXT IS 'Vigencia Desde';

LABEL ON COLUMN IBSDD.VIGHAS TEXT IS 'Vigencia Hasta';

LABEL ON COLUMN IBSDD.ORDVIZ TEXT IS 'Orden Visualiza';

LABEL ON COLUMN IBSDD.USRING TEXT IS 'Usuario Ingreso';

LABEL ON COLUMN IBSDD.FECING TEXT IS 'Fecha Ingreso';

LABEL ON COLUMN IBSDD.USRACT TEXT IS 'Usuario Actualiza';

LABEL ON COLUMN IBSDD.FECACT TEXT IS 'Fecha Actualiza';

LABEL ON COLUMN IBSDD.VERREG TEXT IS 'Version Registro';

LABEL ON COLUMN IBSDD.OBSREG TEXT IS 'Observaciones';

LABEL ON COLUMN IBSDD.ESTREG TEXT IS 'Estado Registro';