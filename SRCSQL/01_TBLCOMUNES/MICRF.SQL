--======================================================================
-- Nombre de la Tabla : MICRF - REPORTES_MICROFICHA
--
-- DESCRIPCIÓN:
-- Archivo que contiene los reportes almacenados en microficha.
--
-- Objetivo:
-- Mantener la información de reportes archivados mediante
-- formularios y secuencias documentales.
--
-- Tipo de Tabla:
-- Histórico.
--
-- Origen de los Datos:
-- Procesos de generación y almacenamiento documental.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Consulta y recuperación histórica de reportes archivados.
--
-- Restricciones:
-- PK compuesta por tipo de formulario, nombre del reporte
-- y secuencia.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-04
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE MICRF (

    TIPO_FORMULARIO FOR COLUMN TIPFOR VARCHAR(50)
                        NOT NULL,

    NOMBRE_REPORTE FOR COLUMN NOMREP VARCHAR(50)
                        NOT NULL,

    NUM_SECUENCIA FOR COLUMN NUMSEC INTEGER
                        NOT NULL,

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

    ORDEN_VISUALIZA FOR COLUMN ORDVIS INTEGER
                        NOT NULL DEFAULT 0,

    USUARIO_INGRESO FOR COLUMN USRING CHAR(18)
                        NOT NULL DEFAULT USER,

    USUARIO_ACTUALIZA FOR COLUMN USRACT CHAR(18)
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

    CONSTRAINT MICRF_PK PRIMARY KEY (TIPFOR, NOMREP,NUMSEC),

    CONSTRAINT MICRF_ESTREG_CST CHECK ( ESTREG IN ('A','I'))

) RCDFMT RMICRF;

RENAME TABLE MICRF
TO REPORTES_MICROFICHA
FOR SYSTEM NAME MICRF;

COMMENT ON TABLE MICRF IS
'REPORTES_MICROFICHA';

--======================================================================
-- Comentarios
--======================================================================
COMMENT ON COLUMN MICRF.TIPFOR IS
'Tipo de formulario asociado al reporte';

COMMENT ON COLUMN MICRF.NOMREP IS
'Nombre del reporte almacenado en microficha';

COMMENT ON COLUMN MICRF.NUMSEC IS
'Secuencia del registro dentro del reporte';

COMMENT ON COLUMN MICRF.DESREG IS
'Descripcion general del registro';

COMMENT ON COLUMN MICRF.VALTEX IS
'Valor textual asociado al registro';

COMMENT ON COLUMN MICRF.VALNUM IS
'Valor numerico asociado al registro';

COMMENT ON COLUMN MICRF.VIGDED IS
'Fecha inicial de vigencia';

COMMENT ON COLUMN MICRF.VIGHAS IS
'Fecha final de vigencia';

COMMENT ON COLUMN MICRF.ORDVIS IS
'Orden de visualizacion del registro';

COMMENT ON COLUMN MICRF.USRING IS
'Usuario que crea el registro';

COMMENT ON COLUMN MICRF.USRACT IS
'Usuario que realiza la actualizacion';

COMMENT ON COLUMN MICRF.VERREG IS
'Version del registro';

COMMENT ON COLUMN MICRF.OBSREG IS
'Observaciones del registro';

COMMENT ON COLUMN MICRF.ESTREG IS
'Estado del registro';

COMMENT ON COLUMN MICRF.FECING IS
'Fecha de creacion del registro';

COMMENT ON COLUMN MICRF.FECACT IS
'Fecha de ultima actualizacion';

--======================================================================
-- Labels
--======================================================================
LABEL ON TABLE MICRF IS 'REPORTES_MICROFICHA';

LABEL ON COLUMN MICRF.TIPFOR IS 'Tipo Formulario';

LABEL ON COLUMN MICRF.NOMREP IS 'Nombre Reporte';

LABEL ON COLUMN MICRF.NUMSEC IS 'Secuencia';

LABEL ON COLUMN MICRF.DESREG IS 'Descripcion';

LABEL ON COLUMN MICRF.VALTEX IS 'Valor Texto';

LABEL ON COLUMN MICRF.VALNUM IS 'Valor Numerico';

LABEL ON COLUMN MICRF.VIGDED IS 'Vigencia Desde';

LABEL ON COLUMN MICRF.VIGHAS IS 'Vigencia Hasta';

LABEL ON COLUMN MICRF.ORDVIS IS 'Orden Visualiza';

LABEL ON COLUMN MICRF.USRING IS 'Usuario Ingreso';

LABEL ON COLUMN MICRF.USRACT IS 'Usuario Actualiza';

LABEL ON COLUMN MICRF.VERREG IS 'Version Registro';

LABEL ON COLUMN MICRF.OBSREG IS 'Observaciones';

LABEL ON COLUMN MICRF.ESTREG IS 'Estado Registro';

LABEL ON COLUMN MICRF.FECING IS 'Fecha Ingreso';

LABEL ON COLUMN MICRF.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS
--======================================================================
LABEL ON COLUMN MICRF.TIPFOR TEXT IS 'Tipo Formulario';

LABEL ON COLUMN MICRF.NOMREP TEXT IS 'Nombre Reporte';

LABEL ON COLUMN MICRF.NUMSEC TEXT IS 'Secuencia';

LABEL ON COLUMN MICRF.DESREG TEXT IS 'Descripcion';

LABEL ON COLUMN MICRF.VALTEX TEXT IS 'Valor Texto';

LABEL ON COLUMN MICRF.VALNUM TEXT IS 'Valor Numerico';

LABEL ON COLUMN MICRF.VIGDED TEXT IS 'Vigencia Desde';

LABEL ON COLUMN MICRF.VIGHAS TEXT IS 'Vigencia Hasta';

LABEL ON COLUMN MICRF.ORDVIS TEXT IS 'Orden Visualiza';

LABEL ON COLUMN MICRF.USRING TEXT IS 'Usuario Ingreso';

LABEL ON COLUMN MICRF.USRACT TEXT IS 'Usuario Actualiza';

LABEL ON COLUMN MICRF.VERREG TEXT IS 'Version Registro';

LABEL ON COLUMN MICRF.OBSREG TEXT IS 'Observaciones';

LABEL ON COLUMN MICRF.ESTREG TEXT IS 'Estado Registro';

LABEL ON COLUMN MICRF.FECING TEXT IS 'Fecha Ingreso';

LABEL ON COLUMN MICRF.FECACT TEXT IS 'Fecha Actualiza';

