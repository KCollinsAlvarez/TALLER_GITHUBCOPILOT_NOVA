--======================================================================
-- Nombre de la Tabla : IFDTL - PATRIM_PERSON_JUR
--
-- DESCRIPCIÓN:
-- Detalle de Declaración Patrimonial de Personas Jurídicas. Registra
-- el detalle patrimonial de personas jurídicas incluyendo información
-- de propuestas, montos, plazos, tasas y dictamen de crédito por
-- línea y cuenta contable.
--
-- Objetivo:
-- Centralizar el detalle de declaraciones patrimoniales de personas
-- jurídicas para análisis de propuestas de crédito.
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
-- Referenciada desde IFMST para gestión de detalles patrimoniales
-- de personas jurídicas.
--
-- Restricciones:
-- PK técnica sobre id_cliente, ANIDEC, mes, formato_balance,
-- codigo_linea y codigo_cuenta.
-- FK a IFMST (id_cliente).
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-16
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE IFDTL (

    NUM_CLIENTE FOR COLUMN NUMCLI VARCHAR(30)
                   NOT NULL,

    ANIO_DECLARACION FOR COLUMN ANIDEC INTEGER
              NOT NULL,

    MES_DECLARACION FOR COLUMN MESDEC INTEGER
            NOT NULL,

    FORMATO_BALANCE FOR COLUMN FORBAL VARCHAR(50)
                        NOT NULL,

    CODIGO_LINEA FOR COLUMN CODLNE VARCHAR(20)
                     NOT NULL,

    CODIGO_CUENTA FOR COLUMN CODCTA VARCHAR(20)
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

    CONSTRAINT IFDTL_PK PRIMARY KEY
    (NUMCLI, ANIDEC, MESDEC, FORBAL, CODLNE, CODCTA),

    CONSTRAINT FK_IFDTL_IFMST FOREIGN KEY
    (NUMCLI, ANIDEC, MESDEC, FORBAL)
        REFERENCES IFMST (NUMCLI, ANIFIZ, MESFIZ, FORBAL),

    CONSTRAINT IFDTL_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RIFDTL;

RENAME TABLE IFDTL
TO PATRIM_PERSON_JUR
FOR SYSTEM NAME IFDTL;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE IFDTL IS
'PATRIM_PERSON_JUR';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN IFDTL.NUMCLI IS
'Identificación del cliente.';

COMMENT ON COLUMN IFDTL.ANIDEC IS
'Año de la declaración patrimonial.';

COMMENT ON COLUMN IFDTL.MESDEC IS
'Mes de la declaración patrimonial.';

COMMENT ON COLUMN IFDTL.FORBAL IS
'Formato del balance patrimonial.';

COMMENT ON COLUMN IFDTL.CODLNE IS
'Código de línea contable.';

COMMENT ON COLUMN IFDTL.CODCTA IS
'Código de cuenta contable.';

COMMENT ON COLUMN IFDTL.FECPRP IS
'Fecha de la propuesta.';

COMMENT ON COLUMN IFDTL.MNTSOL IS
'Monto solicitado en la propuesta.';

COMMENT ON COLUMN IFDTL.PLZMES IS
'Plazo en meses de la propuesta.';

COMMENT ON COLUMN IFDTL.TASPRP IS
'Tasa propuesta para la propuesta.';

COMMENT ON COLUMN IFDTL.DICCRT IS
'Dictamen de crédito de la propuesta.';

COMMENT ON COLUMN IFDTL.ESTPRP IS
'Estado de la propuesta patrimonial.';

COMMENT ON COLUMN IFDTL.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN IFDTL.OBSREG IS
'Observaciones adicionales del patrimonio.';

COMMENT ON COLUMN IFDTL.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN IFDTL.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN IFDTL.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN IFDTL.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN IFDTL.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE IFDTL IS 'PATRIM_PERSON_JUR';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN IFDTL.NUMCLI IS 'ID Cliente';
LABEL ON COLUMN IFDTL.ANIDEC IS 'Año declaración';
LABEL ON COLUMN IFDTL.MESDEC IS 'Mes declaración';
LABEL ON COLUMN IFDTL.FORBAL IS 'Formato Balance';
LABEL ON COLUMN IFDTL.CODLNE IS 'Código Línea';
LABEL ON COLUMN IFDTL.CODCTA IS 'Código Cuenta';
LABEL ON COLUMN IFDTL.FECPRP IS 'Fecha Propuesta';
LABEL ON COLUMN IFDTL.MNTSOL IS 'Monto Solicitado';
LABEL ON COLUMN IFDTL.PLZMES IS 'Plazo Meses';
LABEL ON COLUMN IFDTL.TASPRP IS 'Tasa Propuesta';
LABEL ON COLUMN IFDTL.DICCRT IS 'Dictamen Crédito';
LABEL ON COLUMN IFDTL.ESTPRP IS 'Estado Propuesta';
LABEL ON COLUMN IFDTL.VERREG IS 'Versión Registro';
LABEL ON COLUMN IFDTL.OBSREG IS 'Observaciones';
LABEL ON COLUMN IFDTL.ESTREG IS 'Estado Registro';
LABEL ON COLUMN IFDTL.USRING IS 'Usuario Creación';
LABEL ON COLUMN IFDTL.FECING IS 'Fecha Creación';
LABEL ON COLUMN IFDTL.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN IFDTL.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN IFDTL.NUMCLI TEXT IS 'ID Cliente';
LABEL ON COLUMN IFDTL.ANIDEC TEXT IS 'Año declaración';
LABEL ON COLUMN IFDTL.MESDEC TEXT IS 'Mes declaración';
LABEL ON COLUMN IFDTL.FORBAL TEXT IS 'Formato Balance';
LABEL ON COLUMN IFDTL.CODLNE TEXT IS 'Código Línea';
LABEL ON COLUMN IFDTL.CODCTA TEXT IS 'Código Cuenta';
LABEL ON COLUMN IFDTL.FECPRP TEXT IS 'Fecha Propuesta';
LABEL ON COLUMN IFDTL.MNTSOL TEXT IS 'Monto Solicitado';
LABEL ON COLUMN IFDTL.PLZMES TEXT IS 'Plazo Meses';
LABEL ON COLUMN IFDTL.TASPRP TEXT IS 'Tasa Propuesta';
LABEL ON COLUMN IFDTL.DICCRT TEXT IS 'Dictamen Crédito';
LABEL ON COLUMN IFDTL.ESTPRP TEXT IS 'Estado Propuesta';
LABEL ON COLUMN IFDTL.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN IFDTL.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN IFDTL.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN IFDTL.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN IFDTL.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN IFDTL.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN IFDTL.FECACT TEXT IS 'Fecha Actualiza';

--======================================================================
-- Índices
--======================================================================
-- Índice sobre fecha de ingreso.
-- Justificación: filtrado cronológico de patrimonios.
CREATE INDEX IX_IFDTL_FECING ON IFDTL (FECING);
