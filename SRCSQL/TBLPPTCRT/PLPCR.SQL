--======================================================================
-- Nombre de la Tabla : PLPCR - PROPUESTAS_CREDITO
--
-- DESCRIPCIÓN:
-- Propuestas de Crédito. Registra las propuestas de crédito
-- presentadas en el banco, incluyendo montos solicitados, plazos,
-- tasas propuestas, dictamenes de crédito y estado de cada propuesta.
--
-- Objetivo:
-- Centralizar el catálogo de propuestas de crédito como referencia
-- para la gestión y seguimiento de solicitudes crediticias.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Solicitudes de crédito y análisis crediticio de clientes.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referenciado por PLPRD (Detalle de Productos) y PLGRT
-- (Garantías de Propuesta) para registro de detalles y garantías.
--
-- Restricciones:
-- PK simple: numero_propuesta.
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-06
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE PLPCR (

    NUMERO_PROPUESTA FOR COLUMN NUMPRP VARCHAR(30)
                         NOT NULL,

    FECHA_PROPUESTA FOR COLUMN FECPRP DATE
                        NOT NULL DEFAULT '0001-01-01',

    MONTO_SOLICITADO FOR COLUMN MOTSOL DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,

    PLAZO_MESES FOR COLUMN PLZMES INTEGER
                    NOT NULL DEFAULT 0,

    TASA_PROPUESTA FOR COLUMN TASPRP DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    DICTAMEN_CREDITO FOR COLUMN DICCRT VARCHAR(120)
                         NOT NULL DEFAULT '',

    ESTADO_PROPUESTA FOR COLUMN ESTPRP VARCHAR(20)
                         NOT NULL DEFAULT '',

    OBSERVACIONES FOR COLUMN OBSREG VARCHAR(120)
                      NOT NULL DEFAULT '',

    VERSION_REGISTRO FOR COLUMN VERREG INTEGER
                         NOT NULL DEFAULT 1,

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

    CONSTRAINT PLPCR_PK PRIMARY KEY (NUMPRP),

    CONSTRAINT PLPCR_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RPLPCR;

RENAME TABLE PLPCR
TO PROPUESTAS_CREDITO
FOR SYSTEM NAME PLPCR;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE PLPCR IS
'PROPUESTAS_CREDITO';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN PLPCR.NUMPRP IS
'Número de propuesta de crédito..';

COMMENT ON COLUMN PLPCR.FECPRP IS
'Fecha de presentación de la propuesta de crédito.';

COMMENT ON COLUMN PLPCR.MOTSOL IS
'Monto solicitado en la propuesta de crédito.';

COMMENT ON COLUMN PLPCR.PLZMES IS
'Plazo solicitado expresado en meses.';

COMMENT ON COLUMN PLPCR.TASPRP IS
'Tasa de interés propuesta para el crédito.';

COMMENT ON COLUMN PLPCR.DICCRT IS
'Dictamen o análisis crediticio de la propuesta.';

COMMENT ON COLUMN PLPCR.ESTPRP IS
'Estado actual de la propuesta de crédito.';

COMMENT ON COLUMN PLPCR.OBSREG IS
'Observaciones adicionales de la propuesta.';

COMMENT ON COLUMN PLPCR.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN PLPCR.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN PLPCR.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN PLPCR.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN PLPCR.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN PLPCR.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE PLPCR IS 'PROPUESTAS_CREDITO';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN PLPCR.NUMPRP  IS 'Número Propuesta';
LABEL ON COLUMN PLPCR.FECPRP  IS 'Fecha Propuesta';
LABEL ON COLUMN PLPCR.MOTSOL   IS 'Monto Solicitado';
LABEL ON COLUMN PLPCR.PLZMES   IS 'Plazo Meses';
LABEL ON COLUMN PLPCR.TASPRP   IS 'Tasa Propuesta';
LABEL ON COLUMN PLPCR.DICCRT   IS 'Dictamen Crédito';
LABEL ON COLUMN PLPCR.ESTPRP  IS 'Estado Propuesta';
LABEL ON COLUMN PLPCR.OBSREG   IS 'Observaciones';
LABEL ON COLUMN PLPCR.VERREG   IS 'Versión Registro';
LABEL ON COLUMN PLPCR.ESTREG   IS 'Estado Registro';
LABEL ON COLUMN PLPCR.USRING   IS 'Usuario Creación';
LABEL ON COLUMN PLPCR.FECING   IS 'Fecha Creación';
LABEL ON COLUMN PLPCR.USRACT   IS 'Usuario Actualiza';
LABEL ON COLUMN PLPCR.FECACT   IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN PLPCR.NUMPRP  TEXT IS 'Número Propuesta';
LABEL ON COLUMN PLPCR.FECPRP  TEXT IS 'Fecha Propuesta';
LABEL ON COLUMN PLPCR.MOTSOL   TEXT IS 'Monto Solicitado';
LABEL ON COLUMN PLPCR.PLZMES   TEXT IS 'Plazo Meses';
LABEL ON COLUMN PLPCR.TASPRP   TEXT IS 'Tasa Propuesta';
LABEL ON COLUMN PLPCR.DICCRT   TEXT IS 'Dictamen Crédito';
LABEL ON COLUMN PLPCR.ESTPRP  TEXT IS 'Estado Propuesta';
LABEL ON COLUMN PLPCR.OBSREG   TEXT IS 'Observaciones';
LABEL ON COLUMN PLPCR.VERREG   TEXT IS 'Versión Registro';
LABEL ON COLUMN PLPCR.ESTREG   TEXT IS 'Estado Registro';
LABEL ON COLUMN PLPCR.USRING   TEXT IS 'Usuario Creación';
LABEL ON COLUMN PLPCR.FECING   TEXT IS 'Fecha Creación';
LABEL ON COLUMN PLPCR.USRACT   TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN PLPCR.FECACT   TEXT IS 'Fecha Actualiza';