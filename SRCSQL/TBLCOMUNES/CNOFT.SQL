--======================================================================
-- Nombre de la Tabla : CNOFT - MAESTRO_DATOS_COMUN
--
-- DESCRIPCIÓN:
-- Archivo Maestro de Tablas de Datos Comunes. Registra los datos de
-- catálogo de tablas y referencias de uso común en el sistema.
--
-- Objetivo:
-- Centralizar los parámetros y valores de referencia asociados a las
-- tablas comunes del módulo de archivos.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Configuración del sistema y mantenimiento de catálogo.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte a procesos que consumen referencias de tablas de datos comunes.
--
-- Restricciones:
-- PK compuesta; `ESTADO_REGISTRO` solo A o I; auditoría con valores
-- por defecto.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-02
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CNOFT (
    CODIGO_TABLA FOR COLUMN CODTAB VARCHAR(20)
                        NOT NULL,
    IDIOMA_ASOCIADO FOR COLUMN IDMASO VARCHAR(20)
                        NOT NULL,
    DESCRIPCION FOR COLUMN DESFUN  VARCHAR(120)
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
    USUARIO_INGRESO FOR COLUMN USRING VARCHAR(18)
                        NOT NULL DEFAULT USER,
    USUARIO_ACTUALIZA FOR COLUMN USRACT VARCHAR(18)
                        NOT NULL DEFAULT USER,
    VERSION_REGISTRO FOR COLUMN VERREG INTEGER
                        NOT NULL DEFAULT 1,
    OBSERVACIONES FOR COLUMN OBSREG VARCHAR(120)
                        NOT NULL DEFAULT '',
    ESTADO_REGISTRO FOR COLUMN ESTREG CHAR(1)
                        NOT NULL DEFAULT 'A',
    FECHA_INGRESO FOR COLUMN FECING TIMESTAMP
                        NOT NULL WITH DEFAULT,
    FECHA_ACTUALIZA FOR COLUMN FECACT TIMESTAMP
                        NOT NULL WITH DEFAULT,

    CONSTRAINT CNOFT_PK PRIMARY KEY (CODTAB, IDMASO),

    CONSTRAINT CNOFT_ESTREG_CST CHECK (ESTREG IN ('A','I'))
) RCDFMT RCNOFT;

RENAME TABLE CNOFT
TO MAESTRO_DATOS_COMUN
FOR SYSTEM NAME CNOFT;

COMMENT ON TABLE CNOFT IS
'MAESTRO_DATOS_COMUN';

--======================================================================
-- Comentarios
--======================================================================
COMMENT ON COLUMN CNOFT.CODTAB IS
'Código de tabla identificador del catálogo de tablas comunes.';
COMMENT ON COLUMN CNOFT.IDMASO IS
'Idioma asociado al registro de tabla común.';
COMMENT ON COLUMN CNOFT.DESFUN  IS
'Descripción funcional de la tabla de datos comunes.';
COMMENT ON COLUMN CNOFT.VALTXT IS
'Valor textual asociado al registro de la tabla común.';
COMMENT ON COLUMN CNOFT.VALNUM IS
'Valor numérico asociado al registro de la tabla común.';
COMMENT ON COLUMN CNOFT.VIGDED IS
'Fecha desde en que el registro es vigente.';
COMMENT ON COLUMN CNOFT.VIGHAS IS
'Fecha hasta en que el registro es vigente.';
COMMENT ON COLUMN CNOFT.ORDVIZ IS
'Orden de visualización o prioridad en listados.';
COMMENT ON COLUMN CNOFT.USRING IS
'Usuario que creó el registro.';
COMMENT ON COLUMN CNOFT.USRACT IS
'Usuario que actualizó el registro por última vez.';
COMMENT ON COLUMN CNOFT.VERREG IS
'Versión del registro para control de cambios.';
COMMENT ON COLUMN CNOFT.OBSREG IS
'Observaciones adicionales sobre el registro.';
COMMENT ON COLUMN CNOFT.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN CNOFT.FECING IS
'Fecha y hora de creación del registro.';
COMMENT ON COLUMN CNOFT.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================
LABEL ON TABLE CNOFT IS 'MAESTRO_DATOS_COMUN';

LABEL ON COLUMN CNOFT.CODTAB  IS 'Código de Tabla';
LABEL ON COLUMN CNOFT.IDMASO  IS 'Idioma';
LABEL ON COLUMN CNOFT.DESFUN  IS 'Descripción';
LABEL ON COLUMN CNOFT.VALTXT  IS 'Valor Texto';
LABEL ON COLUMN CNOFT.VALNUM  IS 'Valor Numérico';
LABEL ON COLUMN CNOFT.VIGDED  IS 'Vigencia Desde';
LABEL ON COLUMN CNOFT.VIGHAS  IS 'Vigencia Hasta';
LABEL ON COLUMN CNOFT.ORDVIZ  IS 'Orden Visualización';
LABEL ON COLUMN CNOFT.USRING  IS 'Usuario creación';
LABEL ON COLUMN CNOFT.USRACT  IS 'Usuario actualización';
LABEL ON COLUMN CNOFT.VERREG  IS 'Versión del registro';
LABEL ON COLUMN CNOFT.OBSREG  IS 'Observaciones';
LABEL ON COLUMN CNOFT.ESTREG  IS 'Estado del registro';
LABEL ON COLUMN CNOFT.FECING  IS 'Fecha creación';
LABEL ON COLUMN CNOFT.FECACT  IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================
LABEL ON COLUMN CNOFT.CODTAB  TEXT  IS 'Código de Tabla';
LABEL ON COLUMN CNOFT.IDMASO  TEXT  IS 'Idioma';
LABEL ON COLUMN CNOFT.DESFUN  TEXT  IS 'Descripción';
LABEL ON COLUMN CNOFT.VALTXT  TEXT  IS 'Valor Texto';
LABEL ON COLUMN CNOFT.VALNUM  TEXT  IS 'Valor Numérico';
LABEL ON COLUMN CNOFT.VIGDED  TEXT  IS 'Vigencia Desde';
LABEL ON COLUMN CNOFT.VIGHAS  TEXT  IS 'Vigencia Hasta';
LABEL ON COLUMN CNOFT.ORDVIZ  TEXT  IS 'Orden Visualización';
LABEL ON COLUMN CNOFT.USRING  TEXT  IS 'Usuario creación';
LABEL ON COLUMN CNOFT.USRACT  TEXT  IS 'Usuario actualización';
LABEL ON COLUMN CNOFT.VERREG  TEXT  IS 'Versión del registro';
LABEL ON COLUMN CNOFT.OBSREG  TEXT  IS 'Observaciones';
LABEL ON COLUMN CNOFT.ESTREG  TEXT  IS 'Estado del registro';
LABEL ON COLUMN CNOFT.FECING  TEXT  IS 'Fecha creación';
LABEL ON COLUMN CNOFT.FECACT  TEXT  IS 'Fecha actualización';