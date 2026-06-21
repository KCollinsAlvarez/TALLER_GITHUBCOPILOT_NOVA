--======================================================================
-- Nombre de la Tabla : MLNOT - DATOS_NOTIFICACIONES
--
-- DESCRIPCIÓN:
-- Archivo que contiene los datos a imprimir en la notificación (Usos).
-- Registra el contenido y parámetros de las notificaciones por cuenta
-- y notificación.
--
-- Objetivo:
-- Centralizar la información de notificaciones para impresión y envío
-- a clientes.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Generación de notificaciones del sistema bancario.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Fuente para impresión de notificaciones y reportes.
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

CREATE OR REPLACE TABLE MLNOT (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    FECHA_PROCESO FOR COLUMN FECPRC DATE
                         NOT NULL DEFAULT '0001-01-01',

    NUMERO_CUENTA FOR COLUMN NUMCTA VARCHAR(24)
                      NOT NULL,

    CODIGO_NOTIFICACION FOR COLUMN CODNTF VARCHAR(20)
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

    ORDEN_VISUALIZACION FOR COLUMN ORDVIS INT
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

    CONSTRAINT MLNOT_PK PRIMARY KEY (
        CODBCO,FECPRC,NUMCTA,CODNTF,NVLNTF),

    CONSTRAINT MLNOT_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RMLNOT;

RENAME TABLE MLNOT
TO DATOS_NOTIFICACIONES
FOR SYSTEM NAME MLNOT;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE MLNOT IS
'DATOS_NOTIFICACIONES';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN MLNOT.CODBCO IS
'Código del banco de la notificación.';

COMMENT ON COLUMN MLNOT.FECPRC IS
'Fecha de proceso de la notificación.';

COMMENT ON COLUMN MLNOT.NUMCTA IS
'Número de cuenta asociado a la notificación.';

COMMENT ON COLUMN MLNOT.CODNTF IS
'Código de notificación.';

COMMENT ON COLUMN MLNOT.NVLNTF IS
'Nivel de la notificación.';

COMMENT ON COLUMN MLNOT.DESNTF IS
'Descripción para impresión de la notificación.';

COMMENT ON COLUMN MLNOT.VALTXT IS
'Valor de texto de la notificación.';

COMMENT ON COLUMN MLNOT.VALNUM IS
'Valor numérico de la notificación.';

COMMENT ON COLUMN MLNOT.VIGDES IS
'Fecha de inicio de vigencia.';

COMMENT ON COLUMN MLNOT.VIGHAS IS
'Fecha de fin de vigencia.';

COMMENT ON COLUMN MLNOT.ORDVIS IS
'Orden de visualización.';

COMMENT ON COLUMN MLNOT.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN MLNOT.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN MLNOT.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN MLNOT.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN MLNOT.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN MLNOT.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN MLNOT.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE MLNOT IS 'DATOS_NOTIFICACIONES';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN MLNOT.CODBCO IS 'Código Banco';
LABEL ON COLUMN MLNOT.FECPRC IS 'Fecha Proceso';
LABEL ON COLUMN MLNOT.NUMCTA IS 'Número Cuenta';
LABEL ON COLUMN MLNOT.CODNTF IS 'Código Notificación';
LABEL ON COLUMN MLNOT.NVLNTF IS 'Nivel';
LABEL ON COLUMN MLNOT.DESNTF IS 'Descripción';
LABEL ON COLUMN MLNOT.VALTXT IS 'Valor Texto';
LABEL ON COLUMN MLNOT.VALNUM IS 'Valor Numérico';
LABEL ON COLUMN MLNOT.VIGDES IS 'Vigencia Desde';
LABEL ON COLUMN MLNOT.VIGHAS IS 'Vigencia Hasta';
LABEL ON COLUMN MLNOT.ORDVIS IS 'Orden Visualización';
LABEL ON COLUMN MLNOT.VERREG IS 'Versión Registro';
LABEL ON COLUMN MLNOT.OBSREG IS 'Observaciones';
LABEL ON COLUMN MLNOT.ESTREG IS 'Estado Registro';
LABEL ON COLUMN MLNOT.USRING IS 'Usuario Creación';
LABEL ON COLUMN MLNOT.FECING IS 'Fecha Creación';
LABEL ON COLUMN MLNOT.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN MLNOT.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN MLNOT.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN MLNOT.FECPRC TEXT IS 'Fecha Proceso';
LABEL ON COLUMN MLNOT.NUMCTA TEXT IS 'Número Cuenta';
LABEL ON COLUMN MLNOT.CODNTF TEXT IS 'Código Notificación';
LABEL ON COLUMN MLNOT.NVLNTF TEXT IS 'Nivel';
LABEL ON COLUMN MLNOT.DESNTF TEXT IS 'Descripción';
LABEL ON COLUMN MLNOT.VALTXT TEXT IS 'Valor Texto';
LABEL ON COLUMN MLNOT.VALNUM TEXT IS 'Valor Numérico';
LABEL ON COLUMN MLNOT.VIGDES TEXT IS 'Vigencia Desde';
LABEL ON COLUMN MLNOT.VIGHAS TEXT IS 'Vigencia Hasta';
LABEL ON COLUMN MLNOT.ORDVIS TEXT IS 'Orden Visualización';
LABEL ON COLUMN MLNOT.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN MLNOT.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN MLNOT.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN MLNOT.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN MLNOT.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN MLNOT.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN MLNOT.FECACT TEXT IS 'Fecha Actualiza';