--======================================================================
-- Nombre de la Tabla : HOLYD - ARCHIVO_FERIADOS
--
-- DESCRIPCIÓN:
-- Archivo maestro de feriados por moneda. Registra las fechas de
-- feriados y días no laborables asociados a cada moneda y mercado
-- para cálculos de valor y procesamiento de operaciones.
--
-- Objetivo:
-- Centralizar la definición de fechas feriadas por moneda y mercado
-- para aplicación en cálculos de valor en operaciones bancarias.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Configuración del sistema y mantenimiento de catálogo de feriados.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte a procesos que requieren validación de fechas laborables
-- y cálculos de valor según el mercado y moneda.
--
-- Restricciones:
-- PK compuesta; ESTADO_REGISTRO solo A o I; auditoría con valores
-- por defecto.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-04
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE HOLYD (
    CODIGO_MONEDA FOR COLUMN CODMON CHAR(3)
                        NOT NULL,

    FECHA_FERIADO FOR COLUMN FECFER DATE
                        NOT NULL,

    DESCRIP_FERIADO FOR COLUMN DESFER VARCHAR(120)
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

    CONSTRAINT HOLYD_PK PRIMARY KEY (CODMON, FECFER),

    CONSTRAINT HOLYD_ESTREG_CST CHECK (ESTREG IN ('A','I'))

) RCDFMT RHOLYD;

RENAME TABLE HOLYD
TO ARCHIVO_FERIADOS
FOR SYSTEM NAME HOLYD;

--======================================================================
-- Comentarios
--======================================================================

COMMENT ON TABLE HOLYD IS
'ARCHIVO_FERIADOS';

COMMENT ON COLUMN HOLYD.CODMON IS
'Código identificador de la moneda asociada al feriado.';

COMMENT ON COLUMN HOLYD.FECFER IS
'Fecha del día feriado o no laborable registrado.';

COMMENT ON COLUMN HOLYD.DESFER IS
'Descripción funcional del feriado o evento especial.';

COMMENT ON COLUMN HOLYD.VALTXT IS
'Valor textual adicional asociado al feriado.';

COMMENT ON COLUMN HOLYD.VALNUM IS
'Valor numérico adicional asociado al feriado.';

COMMENT ON COLUMN HOLYD.VIGDED IS
'Fecha desde la cual el feriado es vigente en el sistema.';

COMMENT ON COLUMN HOLYD.VIGHAS IS
'Fecha hasta la cual el feriado es vigente en el sistema.';

COMMENT ON COLUMN HOLYD.ORDVIZ IS
'Orden de visualización o prioridad en listados.';

COMMENT ON COLUMN HOLYD.USRING IS
'Usuario que creó el registro de feriado.';

COMMENT ON COLUMN HOLYD.USRACT IS
'Usuario que actualizó por última vez el registro.';

COMMENT ON COLUMN HOLYD.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN HOLYD.OBSREG IS
'Observaciones adicionales sobre el feriado.';

COMMENT ON COLUMN HOLYD.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';

COMMENT ON COLUMN HOLYD.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN HOLYD.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================

LABEL ON TABLE HOLYD IS 'ARCHIVO_FERIADOS';

LABEL ON COLUMN HOLYD.CODMON IS 'Código Moneda';

LABEL ON COLUMN HOLYD.FECFER IS 'Fecha Feriado';

LABEL ON COLUMN HOLYD.DESFER IS 'Descripción';

LABEL ON COLUMN HOLYD.VALTXT IS 'Valor Texto';

LABEL ON COLUMN HOLYD.VALNUM IS 'Valor Numérico';

LABEL ON COLUMN HOLYD.VIGDED IS 'Vigencia Desde';

LABEL ON COLUMN HOLYD.VIGHAS IS 'Vigencia Hasta';

LABEL ON COLUMN HOLYD.ORDVIZ IS 'Orden Visualización';

LABEL ON COLUMN HOLYD.USRING IS 'Usuario creación';

LABEL ON COLUMN HOLYD.USRACT IS 'Usuario actualización';

LABEL ON COLUMN HOLYD.VERREG IS 'Versión del registro';

LABEL ON COLUMN HOLYD.OBSREG IS 'Observaciones';

LABEL ON COLUMN HOLYD.ESTREG IS 'Estado del registro';

LABEL ON COLUMN HOLYD.FECING IS 'Fecha creación';

LABEL ON COLUMN HOLYD.FECACT IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================

LABEL ON COLUMN HOLYD.CODMON TEXT IS 'Código Moneda';

LABEL ON COLUMN HOLYD.FECFER TEXT IS 'Fecha Feriado';

LABEL ON COLUMN HOLYD.DESFER TEXT IS 'Descripción';

LABEL ON COLUMN HOLYD.VALTXT TEXT IS 'Valor Texto';

LABEL ON COLUMN HOLYD.VALNUM TEXT IS 'Valor Numérico';

LABEL ON COLUMN HOLYD.VIGDED TEXT IS 'Vigencia Desde';

LABEL ON COLUMN HOLYD.VIGHAS TEXT IS 'Vigencia Hasta';

LABEL ON COLUMN HOLYD.ORDVIZ TEXT IS 'Orden Visualización';

LABEL ON COLUMN HOLYD.USRING TEXT IS 'Usuario creación';

LABEL ON COLUMN HOLYD.USRACT TEXT IS 'Usuario actualización';

LABEL ON COLUMN HOLYD.VERREG TEXT IS 'Versión del registro';

LABEL ON COLUMN HOLYD.OBSREG TEXT IS 'Observaciones';

LABEL ON COLUMN HOLYD.ESTREG TEXT IS 'Estado del registro';

LABEL ON COLUMN HOLYD.FECING TEXT IS 'Fecha creación';

LABEL ON COLUMN HOLYD.FECACT TEXT IS 'Fecha actualización';