--======================================================================
-- Nombre de la Tabla : HSNOT - HIST_NOTIFICACION
--
-- DESCRIPCIÓN:
-- Histórico de Datos impresos en las Notificaciones. Registra el
-- contenido impreso en las notificaciones por cliente y fecha de
-- proceso.
--
-- Objetivo:
-- Centralizar el histórico de notificaciones impresas para auditoría
-- y verificación.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Registro de notificaciones generadas e impresas.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte para auditoría de notificaciones y reconstrucción de
-- impresiones históricas.
--
-- Restricciones:
-- PK técnica sobre codigo_banco, fecha_proceso, numero_cuenta,
-- codigo_de_notificacion y nivel.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-17
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE HSNOT (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    FECHA_PROCESO FOR COLUMN FECPRO DATE
                         NOT NULL DEFAULT '0001-01-01',

    NUMERO_CUENTA FOR COLUMN NUMCTA VARCHAR(24)
                      NOT NULL,

    CODIGO_NOTIFICACION FOR COLUMN CODNOT VARCHAR(20)
                                NOT NULL,

    NIVEL_NOTIFIC FOR COLUMN NVLNTF INT
                     NOT NULL,

    DESCRIPCION FOR COLUMN DESNTF VARCHAR(120)
                          NOT NULL DEFAULT '',

    VALOR_TEXTO FOR COLUMN VALTXT VARCHAR(50)
                       NOT NULL DEFAULT '',

    VALOR_NUMERICO FOR COLUMN VALNUM DECIMAL(18, 2)
                          NOT NULL DEFAULT 0,

    VIGENCIA_DESDE FOR COLUMN VIGDES DATE
                              NOT NULL DEFAULT '0001-01-01',

    VIGENCIA_HASTA FOR COLUMN VIGHAS DATE
                              NOT NULL DEFAULT '0001-01-01',

    ORDEN_VISUALIZACION FOR COLUMN ORDVIZ INT
                              NOT NULL DEFAULT 0,

    VERSION_REGISTRO FOR COLUMN VERREG INTEGER
                         NOT NULL DEFAULT 1,

    OBSERVACIONES FOR COLUMN OBSREG VARCHAR(120)
                      NOT NULL DEFAULT '',

    ESTADO_REGISTRO FOR COLUMN ESTREG CHAR(1)
                        NOT NULL DEFAULT 'A',

    USUARIO_INGRESO FOR COLUMN USRING CHAR(18)
                        NOT NULL DEFAULT USER,

    FECHA_INGRESO FOR COLUMN FECING TIMESTAMP
                      NOT NULL WITH DEFAULT,

    USUARIO_ACTUALIZA FOR COLUMN USRACT CHAR(18)
                          NOT NULL DEFAULT USER,

    FECHA_ACTUALIZA FOR COLUMN FECACT TIMESTAMP
                        NOT NULL WITH DEFAULT,

    CONSTRAINT HSNOT_PK PRIMARY KEY 
    (CODBCO,FECPRO,NUMCTA,CODNOT,NVLNTF),

    CONSTRAINT HSNOT_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RHSNOT;

RENAME TABLE HSNOT
TO HIST_NOTIFICACION
FOR SYSTEM NAME HSNOT;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE HSNOT IS
'HIST_NOTIFICACION';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN HSNOT.CODBCO IS
'Código del banco de la notificación.';

COMMENT ON COLUMN HSNOT.FECPRO IS
'Fecha de proceso de la notificación.';

COMMENT ON COLUMN HSNOT.NUMCTA IS
'Número de cuenta asociado a la notificación.';

COMMENT ON COLUMN HSNOT.CODNOT IS
'Código de notificación.';

COMMENT ON COLUMN HSNOT.NVLNTF IS
'Nivel de la notificación.';

COMMENT ON COLUMN HSNOT.DESNTF IS
'Descripción para impresión de la notificación.';

COMMENT ON COLUMN HSNOT.VALTXT IS
'Valor de texto de la notificación.';

COMMENT ON COLUMN HSNOT.VALNUM IS
'Valor numérico de la notificación.';

COMMENT ON COLUMN HSNOT.VIGDES IS
'Fecha de inicio de vigencia.';

COMMENT ON COLUMN HSNOT.VIGHAS IS
'Fecha de fin de vigencia.';

COMMENT ON COLUMN HSNOT.ORDVIZ IS
'Orden de visualización.';

COMMENT ON COLUMN HSNOT.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN HSNOT.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN HSNOT.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN HSNOT.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN HSNOT.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN HSNOT.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN HSNOT.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE HSNOT IS 'HIST_NOTIFICACION';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN HSNOT.CODBCO IS 'Código Banco';
LABEL ON COLUMN HSNOT.FECPRO IS 'Fecha Proceso';
LABEL ON COLUMN HSNOT.NUMCTA IS 'Número Cuenta';
LABEL ON COLUMN HSNOT.CODNOT IS 'Código Notificación';
LABEL ON COLUMN HSNOT.NVLNTF IS 'Nivel';
LABEL ON COLUMN HSNOT.DESNTF IS 'Descripción';
LABEL ON COLUMN HSNOT.VALTXT IS 'Valor Texto';
LABEL ON COLUMN HSNOT.VALNUM IS 'Valor Numérico';
LABEL ON COLUMN HSNOT.VIGDES IS 'Vigencia Desde';
LABEL ON COLUMN HSNOT.VIGHAS IS 'Vigencia Hasta';
LABEL ON COLUMN HSNOT.ORDVIZ IS 'Orden Visualización';
LABEL ON COLUMN HSNOT.VERREG IS 'Versión Registro';
LABEL ON COLUMN HSNOT.OBSREG IS 'Observaciones';
LABEL ON COLUMN HSNOT.ESTREG IS 'Estado Registro';
LABEL ON COLUMN HSNOT.USRING IS 'Usuario Creación';
LABEL ON COLUMN HSNOT.FECING IS 'Fecha Creación';
LABEL ON COLUMN HSNOT.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN HSNOT.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN HSNOT.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN HSNOT.FECPRO TEXT IS 'Fecha Proceso';
LABEL ON COLUMN HSNOT.NUMCTA TEXT IS 'Número Cuenta';
LABEL ON COLUMN HSNOT.CODNOT TEXT IS 'Código Notificación';
LABEL ON COLUMN HSNOT.NVLNTF TEXT IS 'Nivel';
LABEL ON COLUMN HSNOT.DESNTF TEXT IS 'Descripción';
LABEL ON COLUMN HSNOT.VALTXT TEXT IS 'Valor Texto';
LABEL ON COLUMN HSNOT.VALNUM TEXT IS 'Valor Numérico';
LABEL ON COLUMN HSNOT.VIGDES TEXT IS 'Vigencia Desde';
LABEL ON COLUMN HSNOT.VIGHAS TEXT IS 'Vigencia Hasta';
LABEL ON COLUMN HSNOT.ORDVIZ TEXT IS 'Orden Visualización';
LABEL ON COLUMN HSNOT.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN HSNOT.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN HSNOT.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN HSNOT.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN HSNOT.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN HSNOT.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN HSNOT.FECACT TEXT IS 'Fecha Actualiza';
