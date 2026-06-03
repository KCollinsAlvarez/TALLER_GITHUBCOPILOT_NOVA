--======================================================================
-- Nombre de la Tabla : DIMST - MAESTRO_INVENT_DOCS
--
-- DESCRIPCIÓN:
-- Maestro de Inventario de Documentos para el módulo de manejo de
-- documentos. Registra los documentos asociados a cada tabla y
-- secuencia del inventario documental.
--
-- Objetivo:
-- Controlar el inventario de documentos vinculados a tablas de
-- manejo documental, con validación de tipo, fechas y obligatoriedad.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Procesos de gestión documental y mantenimiento de inventarios.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte a controles de cumplimiento documental y consulta de
-- tipos de documentos asociados a tablas.
--
-- Restricciones:
-- PK compuesta; `IND_OBLIGATORIO` solo puede tomar S o N;
-- `ESTADO_REGISTRO` solo puede tomar A o I; auditoría con valores
-- por defecto; referencia a DITBL por `NUMERO_TABLA`.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-02
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE DIMST (
    TIPO_CUENTA FOR COLUMN TIPCTA VARCHAR(20)
                        NOT NULL,
    NUMERO_TABLA FOR COLUMN NUMTAB VARCHAR(30)
                        NOT NULL,
    NUM_SECUENCIA FOR COLUMN NUMSEC INTEGER
                        NOT NULL,
    TIPO_DOCUMENTO FOR COLUMN TIPDOC VARCHAR(20)
                         NOT NULL DEFAULT '',
    DESCRIP_DOCUMENTO FOR COLUMN DESDOC VARCHAR(120)
                                 NOT NULL DEFAULT '',
    IND_OBLIGATORIO FOR COLUMN INDOBL CHAR(1)
                        NOT NULL DEFAULT 'N',
    FECHA_RECEPCION FOR COLUMN FECREC DATE
                        NOT NULL DEFAULT '0001-01-01',
    FECHA_VENCIMIENTO FOR COLUMN FECVTO DATE
                        NOT NULL DEFAULT '0001-01-01',
    OBSERVACIONES FOR COLUMN OBSDOC VARCHAR(120)
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

    CONSTRAINT DIMST_PK PRIMARY KEY (TIPCTA, NUMTAB, NUMSEC),

    CONSTRAINT DIMST_DITBL_FK FOREIGN KEY (NUMTAB,NUMSEC)
        REFERENCES DITBL (NUMTAB,NUMSEC),

    CONSTRAINT DIMST_INDOBL_CST CHECK (INDOBL IN ('S','N')),
    CONSTRAINT DIMST_ESTREG_CST CHECK (ESTREG IN ('A','I'))
) RCDFMT RDIMST;

RENAME TABLE DIMST
TO MAESTRO_INVENT_DOCS
FOR SYSTEM NAME DIMST;

COMMENT ON TABLE DIMST IS
'MAESTRO_INVENT_DOCS';

--======================================================================
-- Comentarios
--======================================================================
COMMENT ON COLUMN DIMST.TIPCTA IS
'Tipo de cuenta asociada al registro de inventario documental.';
COMMENT ON COLUMN DIMST.NUMTAB IS
'Número de tabla identificador del inventario de documentos.';
COMMENT ON COLUMN DIMST.NUMSEC IS
'Secuencia del documento dentro del inventario documental.';
COMMENT ON COLUMN DIMST.TIPDOC IS
'Tipo de documento asociado al inventario.';
COMMENT ON COLUMN DIMST.DESDOC IS
'Descripción funcional detallada del documento.';
COMMENT ON COLUMN DIMST.INDOBL IS
'Indicador de obligatoriedad del documento: S=Sí, N=No.';
COMMENT ON COLUMN DIMST.FECREC IS
'Fecha de recepción prevista o registrada del documento.';
COMMENT ON COLUMN DIMST.FECVTO IS
'Fecha de vencimiento asociada al documento.';
COMMENT ON COLUMN DIMST.OBSDOC IS
'Observaciones adicionales sobre el registro documental.';
COMMENT ON COLUMN DIMST.USRING IS
'Usuario que creó el registro.';
COMMENT ON COLUMN DIMST.USRACT IS
'Usuario que actualizó el registro por última vez.';
COMMENT ON COLUMN DIMST.VERREG IS
'Versión del registro para control de cambios.';
COMMENT ON COLUMN DIMST.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN DIMST.FECING IS
'Fecha y hora de creación del registro.';
COMMENT ON COLUMN DIMST.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================
LABEL ON TABLE DIMST IS 'MAESTRO_INVENT_DOCS';

LABEL ON COLUMN DIMST.TIPCTA  IS 'Tipo de cuenta';
LABEL ON COLUMN DIMST.NUMTAB  IS 'Número de tabla';
LABEL ON COLUMN DIMST.NUMSEC  IS 'Secuencia';
LABEL ON COLUMN DIMST.TIPDOC  IS 'Tipo de documento';
LABEL ON COLUMN DIMST.DESDOC  IS 'Descripción documento';
LABEL ON COLUMN DIMST.INDOBL  IS 'Indicador obligatorio';
LABEL ON COLUMN DIMST.FECREC  IS 'Fecha recepción';
LABEL ON COLUMN DIMST.FECVTO  IS 'Fecha vencimiento';
LABEL ON COLUMN DIMST.OBSDOC  IS 'Observaciones';
LABEL ON COLUMN DIMST.USRING  IS 'Usuario creación';
LABEL ON COLUMN DIMST.USRACT  IS 'Usuario actualización';
LABEL ON COLUMN DIMST.VERREG  IS 'Versión del registro';
LABEL ON COLUMN DIMST.ESTREG  IS 'Estado del registro';
LABEL ON COLUMN DIMST.FECING  IS 'Fecha creación';
LABEL ON COLUMN DIMST.FECACT  IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================
LABEL ON COLUMN DIMST.TIPCTA  TEXT  IS 'Tipo de cuenta';
LABEL ON COLUMN DIMST.NUMTAB  TEXT  IS 'Número de tabla';
LABEL ON COLUMN DIMST.NUMSEC  TEXT  IS 'Secuencia';
LABEL ON COLUMN DIMST.TIPDOC  TEXT  IS 'Tipo de documento';
LABEL ON COLUMN DIMST.DESDOC  TEXT  IS 'Descripción documento';
LABEL ON COLUMN DIMST.INDOBL  TEXT  IS 'Indicador obligatorio';
LABEL ON COLUMN DIMST.FECREC  TEXT  IS 'Fecha de recepción';
LABEL ON COLUMN DIMST.FECVTO  TEXT  IS 'Fecha de vencimiento';
LABEL ON COLUMN DIMST.OBSDOC  TEXT  IS 'Observaciones';
LABEL ON COLUMN DIMST.USRING  TEXT  IS 'Usuario creación';
LABEL ON COLUMN DIMST.USRACT  TEXT  IS 'Usuario actualización';
LABEL ON COLUMN DIMST.VERREG  TEXT  IS 'Versión del registro';
LABEL ON COLUMN DIMST.ESTREG  TEXT  IS 'Estado del registro';
LABEL ON COLUMN DIMST.FECING  TEXT  IS 'Fecha creación';
LABEL ON COLUMN DIMST.FECACT  TEXT  IS 'Fecha actualización';