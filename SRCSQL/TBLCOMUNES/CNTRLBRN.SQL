--======================================================================
-- Nombre de la Tabla : CNTRLBRN - ARCHIVO_SUCURSALES
--
-- DESCRIPCIÓN:
-- Archivo de Sucursales del Sistema. Almacena la configuración
-- y parámetros operativos por sucursal dentro de cada entidad
-- bancaria, incluyendo valores de texto, numéricos y vigencias
-- que controlan el comportamiento por unidad de negocio.
--
-- Objetivo:
-- Centralizar la definición y parámetros de cada sucursal
-- bancaria, permitiendo la administración independiente de
-- configuraciones por unidad operativa dentro del banco.
--
-- Tipo de Tabla:
-- Configuración.
--
-- Origen de los Datos:
-- Administración del sistema y configuración operativa del
-- banco por sucursal.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Consultado por procesos operativos y batch para obtener
-- parámetros de configuración y validar la existencia de
-- sucursales dentro de cada entidad bancaria.
--
-- Restricciones:
-- PK compuesta por codigo_banco y codigo_sucursal.
-- ESTADO_REGISTRO solo acepta A o I.
-- No se define FK a CNTRLCNT (marcada FK=NO en propuesta).
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-04
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CNTRLBRN (

    CODIGO_BANCO FOR COLUMN CODBCO SMALLINT
                     NOT NULL,

    CODIGO_SUCURSAL FOR COLUMN CODSUC VARCHAR(20)
                        NOT NULL,

    DESCRIPCION FOR COLUMN DESACH VARCHAR(120)
                    NOT NULL DEFAULT '',

    VALOR_TEXTO FOR COLUMN VALTXT VARCHAR(50)
                    NOT NULL DEFAULT '',

    VALOR_NUMERICO FOR COLUMN VALNUM DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    VIGENCIA_DESDE FOR COLUMN VIGDED DATE
                       NOT NULL DEFAULT '0001-01-01',

    VIGENCIA_HASTA FOR COLUMN VIGHST DATE
                       NOT NULL DEFAULT '0001-01-01',

    ORDEN_VISUALIZACION FOR COLUMN ORDVIZ INTEGER
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

    CONSTRAINT CNTRLBRN_PK PRIMARY KEY (CODBCO, CODSUC),

    CONSTRAINT CNTRLBRN_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCNTRLBRN;

RENAME TABLE CNTRLBRN
TO ARCHIVO_SUCURSALES
FOR SYSTEM NAME CNTRLBRN;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CNTRLBRN IS
'ARCHIVO_SUCURSALES';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CNTRLBRN.CODBCO IS
'Código único de la entidad bancaria.';

COMMENT ON COLUMN CNTRLBRN.CODSUC IS
'Código único de la sucursal dentro del banco.';

COMMENT ON COLUMN CNTRLBRN.DESACH IS
'Descripción general de la sucursal o del parámetro de
 configuración asociado a la unidad operativa.';

COMMENT ON COLUMN CNTRLBRN.VALTXT IS
'Valor de texto asociado al parámetro de la sucursal.';

COMMENT ON COLUMN CNTRLBRN.VALNUM IS
'Valor numérico asociado al parámetro de la sucursal.';

COMMENT ON COLUMN CNTRLBRN.VIGDED IS
'Fecha de inicio de vigencia del parámetro. Indica desde cuándo
 es válida la configuración de la sucursal.';

COMMENT ON COLUMN CNTRLBRN.VIGHST IS
'Fecha de fin de vigencia del parámetro. Indica hasta cuándo
 es válida la configuración de la sucursal.';

COMMENT ON COLUMN CNTRLBRN.ORDVIZ IS
'Orden de visualización del registro en pantallas y reportes.
 Permite controlar la presentación de las sucursales.';

COMMENT ON COLUMN CNTRLBRN.VERREG IS
'Número de versión del registro. Se incrementa en cada
 actualización para control de cambios y auditoría.';

COMMENT ON COLUMN CNTRLBRN.OBSREG IS
'Observaciones adicionales o notas relacionadas con la
 sucursal o su configuración.';

COMMENT ON COLUMN CNTRLBRN.ESTREG IS
'Estado del registro. Valores válidos:
 A = Activo, I = Inactivo.';

COMMENT ON COLUMN CNTRLBRN.USRING IS
'Usuario del sistema que creó el registro.';

COMMENT ON COLUMN CNTRLBRN.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN CNTRLBRN.USRACT IS
'Usuario del sistema que realizó la última actualización.';

COMMENT ON COLUMN CNTRLBRN.FECACT IS
'Fecha y hora de la última actualización del registro.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CNTRLBRN IS 'ARCHIVO_SUCURSALES';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CNTRLBRN.CODBCO  IS 'Código Banco';
LABEL ON COLUMN CNTRLBRN.CODSUC  IS 'Código Sucursal';
LABEL ON COLUMN CNTRLBRN.DESACH  IS 'Descripción';
LABEL ON COLUMN CNTRLBRN.VALTXT  IS 'Valor Texto';
LABEL ON COLUMN CNTRLBRN.VALNUM  IS 'Valor Numérico';
LABEL ON COLUMN CNTRLBRN.VIGDED  IS 'Vigencia Desde';
LABEL ON COLUMN CNTRLBRN.VIGHST  IS 'Vigencia Hasta';
LABEL ON COLUMN CNTRLBRN.ORDVIZ  IS 'Orden Visualización';
LABEL ON COLUMN CNTRLBRN.VERREG  IS 'Versión Registro';
LABEL ON COLUMN CNTRLBRN.OBSREG  IS 'Observaciones';
LABEL ON COLUMN CNTRLBRN.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN CNTRLBRN.USRING  IS 'Usuario Creación';
LABEL ON COLUMN CNTRLBRN.FECING  IS 'Fecha Creación';
LABEL ON COLUMN CNTRLBRN.USRACT  IS 'Usuario Actualización';
LABEL ON COLUMN CNTRLBRN.FECACT  IS 'Fecha Actualización';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CNTRLBRN.CODBCO  TEXT IS 'Código de Banco';
LABEL ON COLUMN CNTRLBRN.CODSUC  TEXT IS 'Código de Sucursal';
LABEL ON COLUMN CNTRLBRN.DESACH  TEXT IS 'Descripción';
LABEL ON COLUMN CNTRLBRN.VALTXT  TEXT IS 'Valor de Texto';
LABEL ON COLUMN CNTRLBRN.VALNUM  TEXT IS 'Valor Numérico';
LABEL ON COLUMN CNTRLBRN.VIGDED  TEXT IS 'Vigencia Desde';
LABEL ON COLUMN CNTRLBRN.VIGHST  TEXT IS 'Vigencia Hasta';
LABEL ON COLUMN CNTRLBRN.ORDVIZ  TEXT IS 'Orden Visualización';
LABEL ON COLUMN CNTRLBRN.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN CNTRLBRN.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN CNTRLBRN.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN CNTRLBRN.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN CNTRLBRN.FECING  TEXT IS 'Fecha  Creación';
LABEL ON COLUMN CNTRLBRN.USRACT  TEXT IS 'Usuario Actualización';
LABEL ON COLUMN CNTRLBRN.FECACT  TEXT IS 'Fecha Actualización';