--======================================================================
-- Nombre de la Tabla : HEAD - TITULOS_REPORTES
--
-- DESCRIPCIÓN:
-- Archivo títulos de reportes. Registra los títulos asociados a cada
-- printer file y su secuencia de presentación.
--
-- Objetivo:
-- Centralizar los títulos de reportes para los procesos de impresión.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Procesos de generación de reportes y archivos de impresión.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte a consultas, generación de reportes e impresión de títulos.
--
-- Restricciones:
-- PK compuesta; `ESTADO_REGISTRO` solo puede tomar A o I; auditoría
-- estándar en español aplicada; defaults obligatorios en campos no PK.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-03
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE HEAD (
    NOMBRE_PRINTER_FILE FOR COLUMN NOMPRT VARCHAR(50)
                            NOT NULL,
    NUM_SECUENCIA FOR COLUMN NUMSEC INTEGER
                        NOT NULL,
    DESCRIP_REPORTE FOR COLUMN DESREP VARCHAR(120)
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

    CONSTRAINT HEAD_PK PRIMARY KEY (NOMPRT, NUMSEC),

    CONSTRAINT HEAD_ESTREG_CST CHECK (ESTREG IN ('A','I'))
) RCDFMT RHEAD;

RENAME TABLE HEAD
TO TITULOS_REPORTES
FOR SYSTEM NAME HEAD;

COMMENT ON TABLE HEAD IS
'TITULOS_REPORTES';

--======================================================================
-- Comentarios
--======================================================================
COMMENT ON COLUMN HEAD.NOMPRT IS
'Nombre del printer file asociado al título del reporte.';
COMMENT ON COLUMN HEAD.NUMSEC IS
'Secuencia del título dentro del printer file.';
COMMENT ON COLUMN HEAD.DESREP IS
'Descripción funcional del título del reporte.';
COMMENT ON COLUMN HEAD.VALTXT IS
'Valor textual adicional asociado al título.';
COMMENT ON COLUMN HEAD.VALNUM IS
'Valor numérico asociado al título.';
COMMENT ON COLUMN HEAD.VIGDED IS
'Fecha desde en que el título es vigente.';
COMMENT ON COLUMN HEAD.VIGHAS IS
'Fecha hasta en que el título es vigente.';
COMMENT ON COLUMN HEAD.ORDVIZ IS
'Orden de visualización del título en listados.';
COMMENT ON COLUMN HEAD.USRING IS
'Usuario que creó el registro.';
COMMENT ON COLUMN HEAD.USRACT IS
'Usuario que actualizó el registro por última vez.';
COMMENT ON COLUMN HEAD.VERREG IS
'Versión del registro para control de cambios.';
COMMENT ON COLUMN HEAD.OBSREG IS
'Observaciones adicionales sobre el registro.';
COMMENT ON COLUMN HEAD.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN HEAD.FECING IS
'Fecha y hora de creación del registro.';
COMMENT ON COLUMN HEAD.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================
LABEL ON TABLE HEAD IS 'TITULOS_REPORTES';

LABEL ON COLUMN HEAD.NOMPRT  IS 'Printer File';
LABEL ON COLUMN HEAD.NUMSEC  IS 'Secuencia';
LABEL ON COLUMN HEAD.DESREP  IS 'Descripción';
LABEL ON COLUMN HEAD.VALTXT  IS 'Valor Texto';
LABEL ON COLUMN HEAD.VALNUM  IS 'Valor Numérico';
LABEL ON COLUMN HEAD.VIGDED  IS 'Vigencia Desde';
LABEL ON COLUMN HEAD.VIGHAS  IS 'Vigencia Hasta';
LABEL ON COLUMN HEAD.ORDVIZ  IS 'Orden Visualización';
LABEL ON COLUMN HEAD.USRING  IS 'Usuario creación';
LABEL ON COLUMN HEAD.USRACT  IS 'Usuario actualización';
LABEL ON COLUMN HEAD.VERREG  IS 'Versión registro';
LABEL ON COLUMN HEAD.OBSREG  IS 'Observaciones';
LABEL ON COLUMN HEAD.ESTREG  IS 'Estado registro';
LABEL ON COLUMN HEAD.FECING  IS 'Fecha creación';
LABEL ON COLUMN HEAD.FECACT  IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================
LABEL ON COLUMN HEAD.NOMPRT  TEXT  IS 'Printer File';
LABEL ON COLUMN HEAD.NUMSEC  TEXT  IS 'Secuencia';
LABEL ON COLUMN HEAD.DESREP  TEXT  IS 'Descripción';
LABEL ON COLUMN HEAD.VALTXT  TEXT  IS 'Valor Texto';
LABEL ON COLUMN HEAD.VALNUM  TEXT  IS 'Valor Numérico';
LABEL ON COLUMN HEAD.VIGDED  TEXT  IS 'Vigencia Desde';
LABEL ON COLUMN HEAD.VIGHAS  TEXT  IS 'Vigencia Hasta';
LABEL ON COLUMN HEAD.ORDVIZ  TEXT  IS 'Orden Visualización';
LABEL ON COLUMN HEAD.USRING  TEXT  IS 'Usuario creación';
LABEL ON COLUMN HEAD.USRACT  TEXT  IS 'Usuario actualización';
LABEL ON COLUMN HEAD.VERREG  TEXT  IS 'Versión registro';
LABEL ON COLUMN HEAD.OBSREG  TEXT  IS 'Observaciones';
LABEL ON COLUMN HEAD.ESTREG  TEXT  IS 'Estado registro';
LABEL ON COLUMN HEAD.FECING  TEXT  IS 'Fecha creación';
LABEL ON COLUMN HEAD.FECACT  TEXT  IS 'Fecha actualización';