--======================================================================
-- Nombre de la Tabla : DITBL - MAESTRO_TIP_DOCUMENT
--
-- DESCRIPCIÓN:
-- Maestro de tablas de tipos de documentos para inventario documental.
--
-- Objetivo:
-- Registrar los tipos de documento válidos asociados a las tablas
-- de manejo de documentos.
--
-- Tipo de Tabla:
-- Maestro
--
-- Origen de los Datos:
-- Definición interna del sistema de gestión documental.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Validación y configuración de tipos de documento asociados a
-- tablas de inventario documental.
--
-- Restricciones:
-- PK compuesta; obligatorio debe ser S o N; estado debe ser A o I;
-- auditoría con valores por defecto.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-05-31
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE DITBL (
    NUMERO_TABLA FOR COLUMN NUMTAB VARCHAR(30)
                    NOT NULL,
    NUMERO_SECUENCIA FOR COLUMN NUMSEC INTEGER
                    NOT NULL,
    TIPO_DOCUMENTO FOR COLUMN TIPDOC VARCHAR(20)
                       NOT NULL DEFAULT '',
    DESCRIPCION_DOCUMENTO FOR COLUMN DESDOC VARCHAR(120)
                               NOT NULL DEFAULT '',
    IND_OBLIGATORIO FOR COLUMN INDOBL CHAR(1)
                    NOT NULL DEFAULT 'N',
    FECHA_RECEPCION FOR COLUMN FECREC DATE
                        NOT NULL DEFAULT '0001-01-01',
    FECHA_VENCIMIENTO FOR COLUMN FECVTO DATE
                        NOT NULL DEFAULT '0001-01-01',
    OBSERVACIONES_DOC FOR COLUMN OBSDOC VARCHAR(120)
                        NOT NULL DEFAULT '',
    USUARIO_INGRESO FOR COLUMN USRING VARCHAR(18)
                        NOT NULL DEFAULT USER,
    USUARIO_ACTUALIZA FOR COLUMN USRACT VARCHAR(18)
                                NOT NULL DEFAULT USER,
    VERSION_REGISTRO FOR COLUMN VERREG INTEGER
                            NOT NULL DEFAULT 1,
    ESTADO_REGISTRO FOR COLUMN ESTREG CHAR(1)
                        NOT NULL DEFAULT 'A',
    FECHA_INGRESO FOR COLUMN FECING TIMESTAMP
                    NOT NULL WITH DEFAULT,
    FECHA_ACTUALIZA FOR COLUMN FECACT TIMESTAMP
                    NOT NULL WITH DEFAULT,

    CONSTRAINT DITBL_PK PRIMARY KEY (NUMTAB, NUMSEC),

    CONSTRAINT DITBL_INDOBL_CST CHECK (INDOBL IN ('S','N')),
    CONSTRAINT DITBL_ESTREG_CST CHECK (ESTREG IN ('A','I'))
) RCDFMT RDITBL;

RENAME TABLE DITBL
TO MAESTRO_TIP_DOCUMENT
FOR SYSTEM NAME DITBL;

COMMENT ON TABLE DITBL IS
'MAESTRO_TIP_DOCUMENT';

--======================================================================
-- Comentarios
--======================================================================
COMMENT ON COLUMN DITBL.NUMTAB IS
'Número de tabla identificador del inventario de documentos.';
COMMENT ON COLUMN DITBL.NUMSEC IS
'Secuencia del tipo de documento dentro de la tabla.';
COMMENT ON COLUMN DITBL.TIPDOC IS
'Tipo de documento asignado a la tabla.';
COMMENT ON COLUMN DITBL.DESDOC IS
'Descripción funcional detallada del tipo de documento.';
COMMENT ON COLUMN DITBL.INDOBL IS
'Indicador que determina si el documento es
obligatorio: S=Sí, N=No.';
COMMENT ON COLUMN DITBL.FECREC IS
'Fecha de recepción prevista o registrada del documento.';
COMMENT ON COLUMN DITBL.FECVTO IS
'Fecha de vencimiento asociada al documento.';
COMMENT ON COLUMN DITBL.OBSDOC IS
'Observaciones adicionales sobre el tipo de documento.';
COMMENT ON COLUMN DITBL.USRING IS
'Usuario que creó el registro.';
COMMENT ON COLUMN DITBL.USRACT IS
'Usuario que actualizó el registro por última vez.';
COMMENT ON COLUMN DITBL.VERREG IS
'Versión del registro para control de cambios.';
COMMENT ON COLUMN DITBL.ESTREG IS
'Estatus del registro, por ejemplo A=Activo, I=Inactivo.';
COMMENT ON COLUMN DITBL.FECING IS
'Fecha y hora de creación del registro.';
COMMENT ON COLUMN DITBL.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================
LABEL ON TABLE DITBL IS 'MAESTRO_TIP_DOCUMENT';

LABEL ON COLUMN DITBL.NUMTAB  IS 'Número de tabla';
LABEL ON COLUMN DITBL.NUMSEC  IS 'Numero de Secuencia';
LABEL ON COLUMN DITBL.TIPDOC  IS 'Tipo de documento';
LABEL ON COLUMN DITBL.DESDOC  IS 'Descripción documento';
LABEL ON COLUMN DITBL.INDOBL  IS 'Indicador Obligatorio';
LABEL ON COLUMN DITBL.FECREC  IS 'Fecha recepción';
LABEL ON COLUMN DITBL.FECVTO  IS 'Fecha vencimiento';
LABEL ON COLUMN DITBL.OBSDOC  IS 'Observaciones';
LABEL ON COLUMN DITBL.USRING  IS 'Usuario creación';
LABEL ON COLUMN DITBL.USRACT  IS 'Usuario actualización';
LABEL ON COLUMN DITBL.VERREG  IS 'Versión del registro';
LABEL ON COLUMN DITBL.ESTREG  IS 'Estado del registro';
LABEL ON COLUMN DITBL.FECING  IS 'Fecha creación';
LABEL ON COLUMN DITBL.FECACT  IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================
LABEL ON COLUMN DITBL.NUMTAB  TEXT  IS 'Número de tabla';
LABEL ON COLUMN DITBL.NUMSEC  TEXT  IS 'Numero de Secuencia';
LABEL ON COLUMN DITBL.TIPDOC  TEXT  IS 'Tipo de documento';
LABEL ON COLUMN DITBL.DESDOC  TEXT  IS 'Descripción documento';
LABEL ON COLUMN DITBL.INDOBL  TEXT  IS 'Indicador obligatorio';
LABEL ON COLUMN DITBL.FECREC  TEXT  IS 'Fecha de recepción';
LABEL ON COLUMN DITBL.FECVTO  TEXT  IS 'Fecha de vencimiento';
LABEL ON COLUMN DITBL.OBSDOC  TEXT  IS 'Observaciones';
LABEL ON COLUMN DITBL.USRING  TEXT  IS 'Usuario creación';
LABEL ON COLUMN DITBL.USRACT  TEXT  IS 'Usuario actualización';
LABEL ON COLUMN DITBL.ESTREG  TEXT  IS 'Estado del registro';
LABEL ON COLUMN DITBL.FECING  TEXT  IS 'Fecha creación';
LABEL ON COLUMN DITBL.FECACT  TEXT  IS 'Fecha actualización';