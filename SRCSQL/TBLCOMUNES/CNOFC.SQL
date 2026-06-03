--======================================================================
-- Nombre de la Tabla : CNOFC - MAESTRO_REFERENCIAS
--
-- DESCRIPCIÓN:
-- Archivo de Referencias del Sistema o de Datos Comunes. Contiene los
-- registros de referencia utilizados por el sistema para catálogos y
-- constantes operativas.
--
-- Objetivo:
-- Centralizar valores de referencia para uso transaccional y de
-- configuración.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Operaciones del sistema y mantenimiento administrativo.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Validación y apoyo a procesos que requieren catálogos y referencias.
--
-- Restricciones:
-- PK compuesta; `ESTADO_REGISTRO` solo A o I; auditoría con defaults.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-02
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CNOFC (
    CODIGO_TABLA FOR COLUMN CODTAB VARCHAR(20)
                        NOT NULL,
    CODIGO_REGISTRO FOR COLUMN CODREG VARCHAR(20)
                        NOT NULL,
    DESCRIP_REFEREN FOR COLUMN DESREF VARCHAR(120)
                        NOT NULL DEFAULT '',
    VALOR_TEXTO FOR COLUMN VALTXT VARCHAR(50)
                        NOT NULL DEFAULT '',
    VALOR_NUMERICO FOR COLUMN VALNUM DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,
    VIGENCIA_DESDE FOR COLUMN VIGDED DATE
                        NOT NULL DEFAULT '0001-01-01',
    VIGENCIA_HASTA FOR COLUMN VIGHAS DATE
                        NOT NULL DEFAULT '0001-01-01',
    ORDEN_VISUAL FOR COLUMN ORDVIS INTEGER
                        NOT NULL DEFAULT 0,
    USUARIO_INGRESO FOR COLUMN USRING VARCHAR(18)
                        NOT NULL DEFAULT USER,
    USUARIO_ACTUALIZA FOR COLUMN USRACT VARCHAR(18)
                        NOT NULL DEFAULT USER,
    VERSION_REGISTRO FOR COLUMN VERREG INTEGER
                        NOT NULL DEFAULT 1,
    OBSERVACIONES FOR COLUMN OBSREF VARCHAR(120)
                        NOT NULL DEFAULT '',
    ESTADO_REGISTRO FOR COLUMN ESTREG CHAR(1)
                        NOT NULL DEFAULT 'A',
    FECHA_INGRESO FOR COLUMN FECING TIMESTAMP
                        NOT NULL WITH DEFAULT,
    FECHA_ACTUALIZA FOR COLUMN FECACT TIMESTAMP
                        NOT NULL WITH DEFAULT,

    CONSTRAINT CNOFC_PK PRIMARY KEY (CODTAB, CODREG),

    CONSTRAINT CNOFC_ESTREG_CST CHECK (ESTREG IN ('A','I'))
) RCDFMT RCNOFC;

RENAME TABLE CNOFC
TO MAESTRO_REFERENCIAS
FOR SYSTEM NAME CNOFC;

COMMENT ON TABLE CNOFC IS
'MAESTRO_REFERENCIAS';

--======================================================================
-- Comentarios
--======================================================================
COMMENT ON COLUMN CNOFC.CODTAB IS
'Código de la tabla identificadora del catálogo de referencias.';
COMMENT ON COLUMN CNOFC.CODREG IS
'Código identificador del registro dentro del catálogo.';
COMMENT ON COLUMN CNOFC.DESREF IS
'Descripción funcional del registro de referencia.';
COMMENT ON COLUMN CNOFC.VALTXT IS
'Valor textual asociado al registro de referencia.';
COMMENT ON COLUMN CNOFC.VALNUM IS
'Valor numérico asociado al registro de referencia.';
COMMENT ON COLUMN CNOFC.VIGDED IS
'Fecha desde en que el registro es vigente.';
COMMENT ON COLUMN CNOFC.VIGHAS IS
'Fecha hasta en que el registro es vigente.';
COMMENT ON COLUMN CNOFC.ORDVIS IS
'Orden de visualización o prioridad en listados.';
COMMENT ON COLUMN CNOFC.USRING IS
'Usuario que creó el registro.';
COMMENT ON COLUMN CNOFC.USRACT IS
'Usuario que actualizó el registro por última vez.';
COMMENT ON COLUMN CNOFC.VERREG IS
'Versión del registro para control de cambios.';
COMMENT ON COLUMN CNOFC.OBSREF IS
'Observaciones adicionales sobre el registro.';
COMMENT ON COLUMN CNOFC.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN CNOFC.FECING IS
'Fecha y hora de creación del registro.';
COMMENT ON COLUMN CNOFC.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================
LABEL ON TABLE CNOFC IS 'MAESTRO_REFERENCIAS';

LABEL ON COLUMN CNOFC.CODTAB  IS 'Código de Tabla';
LABEL ON COLUMN CNOFC.CODREG  IS 'Código Registro';
LABEL ON COLUMN CNOFC.DESREF  IS 'Descripción';
LABEL ON COLUMN CNOFC.VALTXT  IS 'Valor Texto';
LABEL ON COLUMN CNOFC.VALNUM  IS 'Valor Numérico';
LABEL ON COLUMN CNOFC.VIGDED  IS 'Vigencia Desde';
LABEL ON COLUMN CNOFC.VIGHAS  IS 'Vigencia Hasta';
LABEL ON COLUMN CNOFC.ORDVIS  IS 'Orden Visualización';
LABEL ON COLUMN CNOFC.USRING  IS 'Usuario creación';
LABEL ON COLUMN CNOFC.USRACT  IS 'Usuario actualización';
LABEL ON COLUMN CNOFC.VERREG  IS 'Versión del registro';
LABEL ON COLUMN CNOFC.OBSREF  IS 'Observaciones';
LABEL ON COLUMN CNOFC.ESTREG  IS 'Estado del registro';
LABEL ON COLUMN CNOFC.FECING  IS 'Fecha creación';
LABEL ON COLUMN CNOFC.FECACT  IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================
LABEL ON COLUMN CNOFC.CODTAB  TEXT  IS 'Código de Tabla';
LABEL ON COLUMN CNOFC.CODREG  TEXT  IS 'Código Registro';
LABEL ON COLUMN CNOFC.DESREF  TEXT  IS 'Descripción';
LABEL ON COLUMN CNOFC.VALTXT  TEXT  IS 'Valor Texto';
LABEL ON COLUMN CNOFC.VALNUM  TEXT  IS 'Valor Numérico';
LABEL ON COLUMN CNOFC.VIGDED  TEXT  IS 'Vigencia Desde';
LABEL ON COLUMN CNOFC.VIGHAS  TEXT  IS 'Vigencia Hasta';
LABEL ON COLUMN CNOFC.ORDVIS  TEXT  IS 'Orden Visualización';
LABEL ON COLUMN CNOFC.USRING  TEXT  IS 'Usuario creación';
LABEL ON COLUMN CNOFC.USRACT  TEXT  IS 'Usuario actualización';
LABEL ON COLUMN CNOFC.VERREG  TEXT  IS 'Versión del registro';
LABEL ON COLUMN CNOFC.OBSREF  TEXT  IS 'Observaciones';
LABEL ON COLUMN CNOFC.ESTREG  TEXT  IS 'Estado del registro';
LABEL ON COLUMN CNOFC.FECING  TEXT  IS 'Fecha creación';
LABEL ON COLUMN CNOFC.FECACT  TEXT  IS 'Fecha actualización';
