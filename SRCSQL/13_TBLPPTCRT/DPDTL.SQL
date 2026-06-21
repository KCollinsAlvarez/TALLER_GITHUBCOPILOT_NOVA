--======================================================================
-- Nombre de la Tabla : DPDTL - PATRIMON_PERSON_NAT
--
-- DESCRIPCIÓN:
-- Detalle de la Declaración Patrimonial de Personas Naturales. Registra
-- el detalle de la declaración patrimonial incluyendo información de
-- propuestas, montos, plazos, tasas y dictamen de crédito.
--
-- Objetivo:
-- Centralizar el detalle de declaraciones patrimoniales de personas
-- naturales para análisis de propuestas de crédito.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Operaciones de propuestas de crédito y análisis patrimonial.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referenciada desde DPMST para gestión de detalles patrimoniales
-- de personas naturales.
--
-- Restricciones:
-- PK técnica sobre id_cliente, secuencia y tipo_registro.
-- FK a DPMST (id_cliente).
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-16
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE DPDTL (

    NUM_CLIENTE FOR COLUMN NUMCLI VARCHAR(30)
                   NOT NULL,

    NUMERO_SECUENCIA FOR COLUMN NUMSEC INT
                   NOT NULL,

    TIPO_REGISTRO FOR COLUMN TIPREG VARCHAR(20)
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

    CONSTRAINT DPDTL_PK PRIMARY KEY (NUMCLI, NUMSEC, TIPREG),

    CONSTRAINT FK_DPDTL_DPMST FOREIGN KEY (NUMCLI)
        REFERENCES DPMST (NUMCLI),

    CONSTRAINT DPDTL_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RDPDTL;

RENAME TABLE DPDTL
TO PATRIMON_PERSON_NAT
FOR SYSTEM NAME DPDTL;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE DPDTL IS
'PATRIMON_PERSON_NAT';

--======================================================================
-- Comentarios de Columnas
--======================================================================

COMMENT ON COLUMN DPDTL.NUMCLI IS
'Identificación del cliente.';

COMMENT ON COLUMN DPDTL.NUMSEC IS
'Secuencia de la declaración patrimonial.';

COMMENT ON COLUMN DPDTL.TIPREG IS
'Tipo de registro de la declaración.';

COMMENT ON COLUMN DPDTL.FECPRP IS
'Fecha de la propuesta.';

COMMENT ON COLUMN DPDTL.MNTSOL IS
'Monto solicitado en la propuesta.';

COMMENT ON COLUMN DPDTL.PLZMES IS
'Plazo en meses de la propuesta.';

COMMENT ON COLUMN DPDTL.TASPRP IS
'Tasa propuesta para la propuesta.';

COMMENT ON COLUMN DPDTL.DICCRT IS
'Dictamen de crédito de la propuesta.';

COMMENT ON COLUMN DPDTL.ESTPRP IS
'Estado de la propuesta patrimonial.';

COMMENT ON COLUMN DPDTL.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN DPDTL.OBSREG IS
'Observaciones adicionales del patrimonio.';

COMMENT ON COLUMN DPDTL.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN DPDTL.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN DPDTL.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN DPDTL.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN DPDTL.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE DPDTL IS 'PATRIMON_PERSON_NAT';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN DPDTL.NUMCLI IS 'ID Cliente';
LABEL ON COLUMN DPDTL.NUMSEC IS 'Secuencia';
LABEL ON COLUMN DPDTL.TIPREG IS 'Tipo Registro';
LABEL ON COLUMN DPDTL.FECPRP IS 'Fecha Propuesta';
LABEL ON COLUMN DPDTL.MNTSOL IS 'Monto Solicitado';
LABEL ON COLUMN DPDTL.PLZMES IS 'Plazo Meses';
LABEL ON COLUMN DPDTL.TASPRP IS 'Tasa Propuesta';
LABEL ON COLUMN DPDTL.DICCRT IS 'Dictamen Crédito';
LABEL ON COLUMN DPDTL.ESTPRP IS 'Estado Propuesta';
LABEL ON COLUMN DPDTL.VERREG IS 'Versión Registro';
LABEL ON COLUMN DPDTL.OBSREG IS 'Observaciones';
LABEL ON COLUMN DPDTL.ESTREG IS 'Estado Registro';
LABEL ON COLUMN DPDTL.USRING IS 'Usuario Creación';
LABEL ON COLUMN DPDTL.FECING IS 'Fecha Creación';
LABEL ON COLUMN DPDTL.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN DPDTL.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN DPDTL.NUMCLI TEXT IS 'ID Cliente';
LABEL ON COLUMN DPDTL.NUMSEC TEXT IS 'Secuencia';
LABEL ON COLUMN DPDTL.TIPREG TEXT IS 'Tipo Registro';
LABEL ON COLUMN DPDTL.FECPRP TEXT IS 'Fecha Propuesta';
LABEL ON COLUMN DPDTL.MNTSOL TEXT IS 'Monto Solicitado';
LABEL ON COLUMN DPDTL.PLZMES TEXT IS 'Plazo Meses';
LABEL ON COLUMN DPDTL.TASPRP TEXT IS 'Tasa Propuesta';
LABEL ON COLUMN DPDTL.DICCRT TEXT IS 'Dictamen Crédito';
LABEL ON COLUMN DPDTL.ESTPRP TEXT IS 'Estado Propuesta';
LABEL ON COLUMN DPDTL.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN DPDTL.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN DPDTL.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN DPDTL.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN DPDTL.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN DPDTL.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN DPDTL.FECACT TEXT IS 'Fecha Actualiza';

--======================================================================
-- Índices
--======================================================================
-- Índice sobre claves naturales id_cliente y secuencia.
-- Justificación: búsquedas frecuentes por cliente.
CREATE INDEX IX_DPDTL_NUMCLI_NUMSEC ON DPDTL (NUMCLI, NUMSEC);

-- Índice sobre fecha de ingreso.
-- Justificación: filtrado cronológico de patrimonios.
CREATE INDEX IX_DPDTL_FECING ON DPDTL (FECING);
