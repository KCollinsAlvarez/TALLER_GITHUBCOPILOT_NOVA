--======================================================================
-- Nombre de la Tabla : DPMST - DOCUM_PATRIMONIAL
--
-- DESCRIPCIÓN:
-- Cabecera de la Declaración Patrimonial de Personas Naturales.
-- Registra la información de propuestas de crédito documentadas
-- en función de la declaración patrimonial de clientes naturales,
-- incluyendo montos solicitados, plazos, tasas y dictamenes.
--
-- Objetivo:
-- Centralizar el catálogo de declaraciones patrimoniales como
-- referencia para evaluación crediticia de personas naturales.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Solicitudes crediticias con declaraciones patrimoniales.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referenciado por DPDTL (Detalle de Declaración Patrimonial)
-- para registro de detalles de bienes y patrimonio.
--
-- Restricciones:
-- PK compuesta: id_cliente, secuencia.
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-06
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE DPMST (

    NUM_CLIENTE FOR COLUMN NUMCLI VARCHAR(30)
                   NOT NULL,

    NUM_SECUENCIA FOR COLUMN NUMSEC INTEGER
                  NOT NULL,

    FECHA_PROPUESTA FOR COLUMN FECPRP DATE
                        NOT NULL DEFAULT '0001-01-01',

    MONTO_SOLICITADO FOR COLUMN MONSOL DECIMAL(18, 2)
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

    CONSTRAINT DPMST_PK PRIMARY KEY (NUMCLI, NUMSEC),

    CONSTRAINT DPMST_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RDPMST;

RENAME TABLE DPMST
TO DOCUM_PATRIMONIAL
FOR SYSTEM NAME DPMST;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE DPMST IS
'DOCUM_PATRIMONIAL';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN DPMST.NUMCLI IS
'Identificador del cliente.';

COMMENT ON COLUMN DPMST.NUMSEC IS
'Secuencia de la declaración patrimonial.';

COMMENT ON COLUMN DPMST.FECPRP IS
'Fecha de presentación de la declaración patrimonial.';

COMMENT ON COLUMN DPMST.MONSOL IS
'Monto solicitado basado en la declaración patrimonial.';

COMMENT ON COLUMN DPMST.PLZMES IS
'Plazo solicitado expresado en meses.';

COMMENT ON COLUMN DPMST.TASPRP IS
'Tasa de interés propuesta para el crédito.';

COMMENT ON COLUMN DPMST.DICCRT IS
'Dictamen o análisis de la declaración patrimonial.';

COMMENT ON COLUMN DPMST.ESTPRP IS
'Estado de la propuesta patrimonial.';

COMMENT ON COLUMN DPMST.OBSREG IS
'Observaciones adicionales de la declaración.';

COMMENT ON COLUMN DPMST.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN DPMST.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN DPMST.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN DPMST.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN DPMST.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN DPMST.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE DPMST IS 'DOCUM_PATRIMONIAL';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN DPMST.NUMCLI  IS 'ID Cliente';
LABEL ON COLUMN DPMST.NUMSEC  IS 'Secuencia';
LABEL ON COLUMN DPMST.FECPRP  IS 'Fecha Propuesta';
LABEL ON COLUMN DPMST.MONSOL  IS 'Monto Solicitado';
LABEL ON COLUMN DPMST.PLZMES  IS 'Plazo Meses';
LABEL ON COLUMN DPMST.TASPRP  IS 'Tasa Propuesta';
LABEL ON COLUMN DPMST.DICCRT  IS 'Dictamen Crédito';
LABEL ON COLUMN DPMST.ESTPRP  IS 'Estado Propuesta';
LABEL ON COLUMN DPMST.OBSREG  IS 'Observaciones';
LABEL ON COLUMN DPMST.VERREG  IS 'Versión Registro';
LABEL ON COLUMN DPMST.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN DPMST.USRING  IS 'Usuario Creación';
LABEL ON COLUMN DPMST.FECING  IS 'Fecha Creación';
LABEL ON COLUMN DPMST.USRACT  IS 'Usuario Actualiza';
LABEL ON COLUMN DPMST.FECACT  IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN DPMST.NUMCLI  TEXT IS 'ID Cliente';
LABEL ON COLUMN DPMST.NUMSEC  TEXT IS 'Secuencia';
LABEL ON COLUMN DPMST.FECPRP  TEXT IS 'Fecha Propuesta';
LABEL ON COLUMN DPMST.MONSOL  TEXT IS 'Monto Solicitado';
LABEL ON COLUMN DPMST.PLZMES  TEXT IS 'Plazo Meses';
LABEL ON COLUMN DPMST.TASPRP  TEXT IS 'Tasa Propuesta';
LABEL ON COLUMN DPMST.DICCRT  TEXT IS 'Dictamen Crédito';
LABEL ON COLUMN DPMST.ESTPRP  TEXT IS 'Estado Propuesta';
LABEL ON COLUMN DPMST.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN DPMST.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN DPMST.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN DPMST.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN DPMST.FECING  TEXT IS 'Fecha Creación';
LABEL ON COLUMN DPMST.USRACT  TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN DPMST.FECACT  TEXT IS 'Fecha Actualiza';