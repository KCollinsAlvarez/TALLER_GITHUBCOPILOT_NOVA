--======================================================================
-- Nombre de la Tabla : PRENS - DESC_PROG_ESPANOL
--
-- DESCRIPCIÓN:
-- Archivo maestro de descripciones de programas en idioma español.
-- Registra los nombres, descripciones y documentación de programas
-- en español para referencia técnica y documentación del sistema.
--
-- Objetivo:
-- Centralizar la documentación bilingüe de programas manteniendo
-- descripciones estandarizadas en español para consulta y auditoría.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Mantenimiento manual por administradores y desarrolladores del
-- sistema.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte a procesos de documentación, auditoría técnica y consulta
-- de descripciones de programas en idioma español.
--
-- Restricciones:
-- PK simple; ESTADO_REGISTRO solo A o I; auditoría con valores
-- por defecto.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-04
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE PRENS (
    NOMBRE_PROGRAMA FOR COLUMN NOMPRG VARCHAR(50)
                        NOT NULL,

    DESCRIPCION FOR COLUMN DESPRG VARCHAR(120)
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

    CONSTRAINT PRENS_PK PRIMARY KEY (NOMPRG),

    CONSTRAINT PRENS_ESTREG_CST CHECK (ESTREG IN ('A','I'))

) RCDFMT RPRENS;

RENAME TABLE PRENS
TO DESC_PROG_ESPANOL
FOR SYSTEM NAME PRENS;

--======================================================================
-- Comentarios
--======================================================================

COMMENT ON TABLE PRENS IS
'DESC_PROG_ESPANOL';

COMMENT ON COLUMN PRENS.NOMPRG IS
'Nombre identificador único del programa en el sistema.';

COMMENT ON COLUMN PRENS.DESPRG IS
'Descripción adicional funcional del programa.';

COMMENT ON COLUMN PRENS.VALTXT IS
'Valor textual adicional asociado al programa.';

COMMENT ON COLUMN PRENS.VALNUM IS
'Valor numérico adicional asociado al programa.';

COMMENT ON COLUMN PRENS.VIGDED IS
'Fecha desde la cual la descripción es vigente.';

COMMENT ON COLUMN PRENS.VIGHAS IS
'Fecha hasta la cual la descripción es vigente.';

COMMENT ON COLUMN PRENS.ORDVIZ IS
'Orden de visualización o prioridad en listados.';

COMMENT ON COLUMN PRENS.USRING IS
'Usuario que creó el registro de descripción.';

COMMENT ON COLUMN PRENS.USRACT IS
'Usuario que actualizó por última vez el registro.';

COMMENT ON COLUMN PRENS.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN PRENS.OBSREG IS
'Observaciones adicionales sobre el programa.';

COMMENT ON COLUMN PRENS.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';

COMMENT ON COLUMN PRENS.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN PRENS.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================

LABEL ON TABLE PRENS IS 'DESC_PROG_ESPANOL';

LABEL ON COLUMN PRENS.NOMPRG IS 'Nombre Programa';

LABEL ON COLUMN PRENS.DESPRG IS 'Descripción';

LABEL ON COLUMN PRENS.VALTXT IS 'Valor Texto';

LABEL ON COLUMN PRENS.VALNUM IS 'Valor Numérico';

LABEL ON COLUMN PRENS.VIGDED IS 'Vigencia Desde';

LABEL ON COLUMN PRENS.VIGHAS IS 'Vigencia Hasta';

LABEL ON COLUMN PRENS.ORDVIZ IS 'Orden Visualización';

LABEL ON COLUMN PRENS.USRING IS 'Usuario creación';

LABEL ON COLUMN PRENS.USRACT IS 'Usuario actualización';

LABEL ON COLUMN PRENS.VERREG IS 'Versión del registro';

LABEL ON COLUMN PRENS.OBSREG IS 'Observaciones';

LABEL ON COLUMN PRENS.ESTREG IS 'Estado del registro';

LABEL ON COLUMN PRENS.FECING IS 'Fecha creación';

LABEL ON COLUMN PRENS.FECACT IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================

LABEL ON COLUMN PRENS.NOMPRG TEXT IS 'Nombre Programa';

LABEL ON COLUMN PRENS.DESPRG TEXT IS 'Descripción';

LABEL ON COLUMN PRENS.VALTXT TEXT IS 'Valor Texto';

LABEL ON COLUMN PRENS.VALNUM TEXT IS 'Valor Numérico';

LABEL ON COLUMN PRENS.VIGDED TEXT IS 'Vigencia Desde';

LABEL ON COLUMN PRENS.VIGHAS TEXT IS 'Vigencia Hasta';

LABEL ON COLUMN PRENS.ORDVIZ TEXT IS 'Orden Visualización';

LABEL ON COLUMN PRENS.USRING TEXT IS 'Usuario creación';

LABEL ON COLUMN PRENS.USRACT TEXT IS 'Usuario actualización';

LABEL ON COLUMN PRENS.VERREG TEXT IS 'Versión del registro';

LABEL ON COLUMN PRENS.OBSREG TEXT IS 'Observaciones';

LABEL ON COLUMN PRENS.ESTREG TEXT IS 'Estado del registro';

LABEL ON COLUMN PRENS.FECING TEXT IS 'Fecha creación';

LABEL ON COLUMN PRENS.FECACT TEXT IS 'Fecha actualización';