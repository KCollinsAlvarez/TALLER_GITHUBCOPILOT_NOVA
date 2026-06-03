--======================================================================
-- Nombre de la Tabla : MLNCT - NOTIF_PATRON_FORMATO
--
-- DESCRIPCIÓN:
-- Archivo de patrones/formatos de Notificaciones a Clientes. Registra
-- los patrones de formato asociados a notificaciones del sistema.
--
-- Objetivo:
-- Centralizar los patrones y configuraciones de notificaciones por
-- banco, tipo de notificación e idioma.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Configuración del sistema de notificaciones.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte a procesos de generación y envío de notificaciones a
-- clientes en diferentes idiomas y formatos.
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

CREATE OR REPLACE TABLE MLNCT (
    CODIGO_BANCO FOR COLUMN CODBCO VARCHAR(20)
                        NOT NULL,
    CODIGO_NOTIF FOR COLUMN CODNTF VARCHAR(20)
                        NOT NULL,
    CODIGO_NIVEL FOR COLUMN CODNVL INTEGER
                        NOT NULL,
    IDIOMA_ASOCIADO FOR COLUMN IDMASO VARCHAR(20)
                        NOT NULL,
    SECUENCIA FOR COLUMN NUMSEC INTEGER
                        NOT NULL,
    DESCRIPCION FOR COLUMN DESFUN VARCHAR(120)
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

    CONSTRAINT MLNCT_PK PRIMARY KEY (CODBCO, CODNTF, CODNVL, IDMASO, NUMSEC),

    CONSTRAINT MLNCT_ESTREG_CST CHECK (ESTREG IN ('A','I'))
) RCDFMT RMLNCT;

RENAME TABLE MLNCT
TO NOTIF_PATRON_FORMATO
FOR SYSTEM NAME MLNCT;

COMMENT ON TABLE MLNCT IS
'NOTIF_PATRON_FORMATO';

--======================================================================
-- Comentarios
--======================================================================
COMMENT ON COLUMN MLNCT.CODBCO IS
'Código de banco para identificar la entidad emisora.';
COMMENT ON COLUMN MLNCT.CODNTF IS
'Código de notificación que identifica el tipo de patrón.';
COMMENT ON COLUMN MLNCT.CODNVL IS
'Nivel jerárquico del patrón de notificación.';
COMMENT ON COLUMN MLNCT.IDMASO IS
'Idioma del patrón de notificación a cliente.';
COMMENT ON COLUMN MLNCT.NUMSEC IS
'Secuencia de la línea dentro del patrón.';
COMMENT ON COLUMN MLNCT.DESFUN IS
'Descripción funcional del patrón de notificación.';
COMMENT ON COLUMN MLNCT.VALTXT IS
'Valor textual asociado al patrón.';
COMMENT ON COLUMN MLNCT.VALNUM IS
'Valor numérico asociado al patrón.';
COMMENT ON COLUMN MLNCT.VIGDED IS
'Fecha desde en que el patrón es vigente.';
COMMENT ON COLUMN MLNCT.VIGHAS IS
'Fecha hasta en que el patrón es vigente.';
COMMENT ON COLUMN MLNCT.ORDVIZ IS
'Orden de visualización o prioridad en listados.';
COMMENT ON COLUMN MLNCT.USRING IS
'Usuario que creó el registro.';
COMMENT ON COLUMN MLNCT.USRACT IS
'Usuario que actualizó el registro por última vez.';
COMMENT ON COLUMN MLNCT.VERREG IS
'Versión del registro para control de cambios.';
COMMENT ON COLUMN MLNCT.OBSREG IS
'Observaciones adicionales sobre el patrón.';
COMMENT ON COLUMN MLNCT.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN MLNCT.FECING IS
'Fecha y hora de creación del registro.';
COMMENT ON COLUMN MLNCT.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================
LABEL ON TABLE MLNCT IS 'NOTIF_PATRON_FORMATO';

LABEL ON COLUMN MLNCT.CODBCO  IS 'Código de Banco';
LABEL ON COLUMN MLNCT.CODNTF  IS 'Código Notificación';
LABEL ON COLUMN MLNCT.CODNVL   IS 'Nivel';
LABEL ON COLUMN MLNCT.IDMASO  IS 'Idioma';
LABEL ON COLUMN MLNCT.NUMSEC  IS 'Secuencia';
LABEL ON COLUMN MLNCT.DESFUN IS 'Descripción';
LABEL ON COLUMN MLNCT.VALTXT  IS 'Valor Texto';
LABEL ON COLUMN MLNCT.VALNUM  IS 'Valor Numérico';
LABEL ON COLUMN MLNCT.VIGDED  IS 'Vigencia Desde';
LABEL ON COLUMN MLNCT.VIGHAS  IS 'Vigencia Hasta';
LABEL ON COLUMN MLNCT.ORDVIZ  IS 'Orden Visualización';
LABEL ON COLUMN MLNCT.USRING  IS 'Usuario creación';
LABEL ON COLUMN MLNCT.USRACT  IS 'Usuario actualización';
LABEL ON COLUMN MLNCT.VERREG  IS 'Versión del registro';
LABEL ON COLUMN MLNCT.OBSREG  IS 'Observaciones';
LABEL ON COLUMN MLNCT.ESTREG  IS 'Estado del registro';
LABEL ON COLUMN MLNCT.FECING  IS 'Fecha creación';
LABEL ON COLUMN MLNCT.FECACT  IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================
LABEL ON COLUMN MLNCT.CODBCO  TEXT  IS 'Código de Banco';
LABEL ON COLUMN MLNCT.CODNTF  TEXT  IS 'Código Notificación';
LABEL ON COLUMN MLNCT.CODNVL   TEXT  IS 'Nivel';
LABEL ON COLUMN MLNCT.IDMASO  TEXT  IS 'Idioma';
LABEL ON COLUMN MLNCT.NUMSEC  TEXT  IS 'Secuencia';
LABEL ON COLUMN MLNCT.DESFUN TEXT  IS 'Descripción';
LABEL ON COLUMN MLNCT.VALTXT  TEXT  IS 'Valor Texto';
LABEL ON COLUMN MLNCT.VALNUM  TEXT  IS 'Valor Numérico';
LABEL ON COLUMN MLNCT.VIGDED  TEXT  IS 'Vigencia Desde';
LABEL ON COLUMN MLNCT.VIGHAS  TEXT  IS 'Vigencia Hasta';
LABEL ON COLUMN MLNCT.ORDVIZ  TEXT  IS 'Orden Visualización';
LABEL ON COLUMN MLNCT.USRING  TEXT  IS 'Usuario creación';
LABEL ON COLUMN MLNCT.USRACT  TEXT  IS 'Usuario actualización';
LABEL ON COLUMN MLNCT.VERREG  TEXT  IS 'Versión del registro';
LABEL ON COLUMN MLNCT.OBSREG  TEXT  IS 'Observaciones';
LABEL ON COLUMN MLNCT.ESTREG  TEXT  IS 'Estado del registro';
LABEL ON COLUMN MLNCT.FECING  TEXT  IS 'Fecha creación';
LABEL ON COLUMN MLNCT.FECACT  TEXT  IS 'Fecha actualización';
