--======================================================================
-- Nombre de la Tabla : PLGRT - PROPUESTA_GARANTIAS
--
-- DESCRIPCIÓN:
-- Garantías asociadas a las propuestas de crédito. Registra las
-- garantías específicas que respaldan cada propuesta, incluyendo
-- secuencia, montos, plazos, tasas y estado de cada garantía.
--
-- Objetivo:
-- Centralizar el catálogo de garantías en propuestas de crédito para
-- gestión de lineamientos de crédito y análisis de riesgos.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Operaciones de propuestas de crédito y análisis de garantías.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referenciada desde PLPCR para gestión de garantías
-- en propuestas de crédito.
--
-- Restricciones:
-- PK técnica sobre numero_propuesta y secuencia.
-- FK a PLPCR (numero_propuesta).
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-16
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE PLGRT (

    NUMERO_PROPUESTA FOR COLUMN NUMPRP VARCHAR(30)
                         NOT NULL,

    NUMERO_SECUENCIA FOR COLUMN NUMSEC INTEGER
                   NOT NULL,

    FECHA_PROPUESTA FOR COLUMN FECPRP DATE
                        NOT NULL DEFAULT '0001-01-01',

    MONTO_SOLICITADO FOR COLUMN MNTSOL DECIMAL(18, 2)
                         NOT NULL DEFAULT 0,

    PLAZO_MESES FOR COLUMN PLZMES INTEGER
                    NOT NULL DEFAULT 0,

    TASA_PROPUESTA FOR COLUMN TASPRP DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    DICTAMEN_CREDITO FOR COLUMN DICCRT VARCHAR(120)
                          NOT NULL DEFAULT '',

    ESTADO_PROPUESTA FOR COLUMN ESTPRP VARCHAR(20)
                         NOT NULL DEFAULT '',

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

    CONSTRAINT PLGRT_PK PRIMARY KEY (NUMPRP, NUMSEC),

    CONSTRAINT FK_PLGRT_PLPCR FOREIGN KEY (NUMPRP)
        REFERENCES PLPCR (NUMPRP),

    CONSTRAINT PLGRT_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RPLGRT;

RENAME TABLE PLGRT
TO PROPUESTA_GARANTIAS
FOR SYSTEM NAME PLGRT;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE PLGRT IS
'PROPUESTA_GARANTIAS';

--======================================================================
-- Comentarios de Columnas
--======================================================================

COMMENT ON COLUMN PLGRT.NUMPRP IS
'Número de propuesta de crédito.';

COMMENT ON COLUMN PLGRT.NUMSEC IS
'Secuencia de la garantía en la propuesta.';

COMMENT ON COLUMN PLGRT.FECPRP IS
'Fecha de la propuesta.';

COMMENT ON COLUMN PLGRT.MNTSOL IS
'Monto solicitado para la garantía.';

COMMENT ON COLUMN PLGRT.PLZMES IS
'Plazo en meses de la garantía.';

COMMENT ON COLUMN PLGRT.TASPRP IS
'Tasa propuesta para la garantía.';

COMMENT ON COLUMN PLGRT.DICCRT IS
'Dictamen de crédito para la garantía.';

COMMENT ON COLUMN PLGRT.ESTPRP IS
'Estado de la propuesta de garantía.';

COMMENT ON COLUMN PLGRT.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN PLGRT.OBSREG IS
'Observaciones adicionales de la garantía.';

COMMENT ON COLUMN PLGRT.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN PLGRT.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN PLGRT.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN PLGRT.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN PLGRT.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE PLGRT IS 'PROPUESTA_GARANTIAS';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN PLGRT.NUMPRP IS 'Número Propuesta';
LABEL ON COLUMN PLGRT.NUMSEC IS 'Secuencia';
LABEL ON COLUMN PLGRT.FECPRP IS 'Fecha Propuesta';
LABEL ON COLUMN PLGRT.MNTSOL IS 'Monto Solicitado';
LABEL ON COLUMN PLGRT.PLZMES IS 'Plazo Meses';
LABEL ON COLUMN PLGRT.TASPRP IS 'Tasa Propuesta';
LABEL ON COLUMN PLGRT.DICCRT IS 'Dictamen Crédito';
LABEL ON COLUMN PLGRT.ESTPRP IS 'Estado Propuesta';
LABEL ON COLUMN PLGRT.VERREG IS 'Versión Registro';
LABEL ON COLUMN PLGRT.OBSREG IS 'Observaciones';
LABEL ON COLUMN PLGRT.ESTREG IS 'Estado Registro';
LABEL ON COLUMN PLGRT.USRING IS 'Usuario Creación';
LABEL ON COLUMN PLGRT.FECING IS 'Fecha Creación';
LABEL ON COLUMN PLGRT.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN PLGRT.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN PLGRT.NUMPRP TEXT IS 'Número Propuesta';
LABEL ON COLUMN PLGRT.NUMSEC TEXT IS 'Secuencia';
LABEL ON COLUMN PLGRT.FECPRP TEXT IS 'Fecha Propuesta';
LABEL ON COLUMN PLGRT.MNTSOL TEXT IS 'Monto Solicitado';
LABEL ON COLUMN PLGRT.PLZMES TEXT IS 'Plazo Meses';
LABEL ON COLUMN PLGRT.TASPRP TEXT IS 'Tasa Propuesta';
LABEL ON COLUMN PLGRT.DICCRT TEXT IS 'Dictamen Crédito';
LABEL ON COLUMN PLGRT.ESTPRP TEXT IS 'Estado Propuesta';
LABEL ON COLUMN PLGRT.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN PLGRT.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN PLGRT.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN PLGRT.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN PLGRT.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN PLGRT.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN PLGRT.FECACT TEXT IS 'Fecha Actualiza';

--======================================================================
-- Índices
--======================================================================
-- Índice sobre fecha de ingreso.
-- Justificación: ordenamiento y filtrado cronológico de garantías.
CREATE INDEX IX_PLGRT_FECING ON PLGRT (FECING);
