--======================================================================
-- Nombre de la Tabla : PRENA - DESC_PROG_INGLES
--
-- DESCRIPCIÓN:
-- Archivo maestro de descripciones de programas en idioma inglés.
-- Registra los nombres, descripciones y documentación de programas
-- en inglés para referencia técnica y documentación del sistema.
--
-- Objetivo:
-- Centralizar la documentación bilingüe de programas manteniendo
-- descripciones estandarizadas en inglés para consulta y auditoría.
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
-- de descripciones de programas en idioma inglés.
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

CREATE OR REPLACE TABLE PRENA (
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

    CONSTRAINT PRENA_PK PRIMARY KEY (NOMPRG),

    CONSTRAINT PRENA_ESTREG_CST CHECK (ESTREG IN ('A','I'))

) RCDFMT RPRENA;

RENAME TABLE PRENA
TO DESC_PROG_INGLES
FOR SYSTEM NAME PRENA;

--======================================================================
-- Comentarios
--======================================================================

COMMENT ON TABLE PRENA IS
'DESC_PROG_INGLES';

COMMENT ON COLUMN PRENA.NOMPRG IS
'Nombre identificador único del programa en el sistema.';

COMMENT ON COLUMN PRENA.DESPRG IS
'Descripción adicional funcional del programa.';

COMMENT ON COLUMN PRENA.VALTXT IS
'Valor textual adicional asociado al programa.';

COMMENT ON COLUMN PRENA.VALNUM IS
'Valor numérico adicional asociado al programa.';

COMMENT ON COLUMN PRENA.VIGDED IS
'Fecha desde la cual la descripción es vigente.';

COMMENT ON COLUMN PRENA.VIGHAS IS
'Fecha hasta la cual la descripción es vigente.';

COMMENT ON COLUMN PRENA.ORDVIZ IS
'Orden de visualización o prioridad en listados.';

COMMENT ON COLUMN PRENA.USRING IS
'Usuario que creó el registro de descripción.';

COMMENT ON COLUMN PRENA.USRACT IS
'Usuario que actualizó por última vez el registro.';

COMMENT ON COLUMN PRENA.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN PRENA.OBSREG IS
'Observaciones adicionales sobre el programa.';

COMMENT ON COLUMN PRENA.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';

COMMENT ON COLUMN PRENA.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN PRENA.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================

LABEL ON TABLE PRENA IS 'DESC_PROG_INGLES';

LABEL ON COLUMN PRENA.NOMPRG IS 'Nombre Programa';

LABEL ON COLUMN PRENA.DESPRG IS 'Descripción';

LABEL ON COLUMN PRENA.VALTXT IS 'Valor Texto';

LABEL ON COLUMN PRENA.VALNUM IS 'Valor Numérico';

LABEL ON COLUMN PRENA.VIGDED IS 'Vigencia Desde';

LABEL ON COLUMN PRENA.VIGHAS IS 'Vigencia Hasta';

LABEL ON COLUMN PRENA.ORDVIZ IS 'Orden Visualización';

LABEL ON COLUMN PRENA.USRING IS 'Usuario creación';

LABEL ON COLUMN PRENA.USRACT IS 'Usuario actualización';

LABEL ON COLUMN PRENA.VERREG IS 'Versión del registro';

LABEL ON COLUMN PRENA.OBSREG IS 'Observaciones';

LABEL ON COLUMN PRENA.ESTREG IS 'Estado del registro';

LABEL ON COLUMN PRENA.FECING IS 'Fecha creación';

LABEL ON COLUMN PRENA.FECACT IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================

LABEL ON COLUMN PRENA.NOMPRG TEXT IS 'Nombre Programa';

LABEL ON COLUMN PRENA.DESPRG TEXT IS 'Descripción';

LABEL ON COLUMN PRENA.VALTXT TEXT IS 'Valor Texto';

LABEL ON COLUMN PRENA.VALNUM TEXT IS 'Valor Numérico';

LABEL ON COLUMN PRENA.VIGDED TEXT IS 'Vigencia Desde';

LABEL ON COLUMN PRENA.VIGHAS TEXT IS 'Vigencia Hasta';

LABEL ON COLUMN PRENA.ORDVIZ TEXT IS 'Orden Visualización';

LABEL ON COLUMN PRENA.USRING TEXT IS 'Usuario creación';

LABEL ON COLUMN PRENA.USRACT TEXT IS 'Usuario actualización';

LABEL ON COLUMN PRENA.VERREG TEXT IS 'Versión del registro';

LABEL ON COLUMN PRENA.OBSREG TEXT IS 'Observaciones';

LABEL ON COLUMN PRENA.ESTREG TEXT IS 'Estado del registro';

LABEL ON COLUMN PRENA.FECING TEXT IS 'Fecha creación';

LABEL ON COLUMN PRENA.FECACT TEXT IS 'Fecha actualización';