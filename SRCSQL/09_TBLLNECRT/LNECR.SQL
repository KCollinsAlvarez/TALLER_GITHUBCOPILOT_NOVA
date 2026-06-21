--======================================================================
-- Nombre de la Tabla : LNECR - LINEAS_CREDITO
--
-- DESCRIPCIÓN:
-- Maestro de Líneas de Crédito. Registra las líneas de crédito
-- aprobadas para clientes del banco, incluyendo montos aprobados,
-- utilizados, disponibles y fechas de vigencia de cada línea.
--
-- Objetivo:
-- Centralizar el catálogo de líneas de crédito disponibles para
-- clientes como referencia de operaciones crediticias.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Operaciones de aprobación de líneas de crédito a clientes.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referenciado en operaciones crediticias para validar montos
-- disponibles y vigencia de líneas aprobadas.
--
-- Restricciones:
-- PK compuesta: NUM_CLIENTE, numero_linea.
-- UNIQUE sobre numero_linea (clave de negocio).
-- FK a CUMST.NUM_CLIENTE (referencia a clientes).
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-06
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE LNECR (

    NUM_CLIENTE FOR COLUMN NUMCLI VARCHAR(30)
                   NOT NULL,

    NUMERO_LINEA FOR COLUMN NUMLNE VARCHAR(30)
                     NOT NULL,

    FECHA_APROBACION FOR COLUMN FECAPR DATE
                         NOT NULL DEFAULT '0001-01-01',

    FECHA_VENCIMIENTO FOR COLUMN FECVEN DATE
                          NOT NULL DEFAULT '0001-01-01',

    MONTO_APROBADO FOR COLUMN MONAPR DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    MONTO_UTILIZADO FOR COLUMN MONUTL DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,

    MONTO_DISPONIBLE FOR COLUMN MONDIS DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,

    ESTADO_LINEA FOR COLUMN ESTLNE VARCHAR(20)
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

    CONSTRAINT LNECR_PK PRIMARY KEY (NUMCLI, NUMLNE),

    CONSTRAINT UK_LNECR_NUMLNE UNIQUE (NUMLNE),

    CONSTRAINT LNECR_CUMST_FK FOREIGN KEY (NUMCLI)
        REFERENCES CUMST (NUMCLI),

    CONSTRAINT LNECR_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RLNECR;

RENAME TABLE LNECR
TO LINEAS_CREDITO
FOR SYSTEM NAME LNECR;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE LNECR IS
'LINEAS_CREDITO';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN LNECR.NUMCLI IS
'Identificador del cliente. ';

COMMENT ON COLUMN LNECR.NUMLNE IS
'Número de línea de crédito.';

COMMENT ON COLUMN LNECR.FECAPR IS
'Fecha de aprobación de la línea de crédito.';

COMMENT ON COLUMN LNECR.FECVEN IS
'Fecha de vencimiento de la línea de crédito.';

COMMENT ON COLUMN LNECR.MONAPR IS
'Monto total aprobado en la línea de crédito.';

COMMENT ON COLUMN LNECR.MONUTL IS
'Monto utilizado o desembolsado de la línea.';

COMMENT ON COLUMN LNECR.MONDIS IS
'Monto disponible para utilizar en la línea.';

COMMENT ON COLUMN LNECR.ESTLNE IS
'Estado operativo de la línea de crédito.';

COMMENT ON COLUMN LNECR.OBSREG IS
'Observaciones adicionales de la línea de crédito.';

COMMENT ON COLUMN LNECR.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN LNECR.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN LNECR.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN LNECR.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN LNECR.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN LNECR.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE LNECR IS 'LINEAS_CREDITO';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN LNECR.NUMCLI  IS 'ID Cliente';
LABEL ON COLUMN LNECR.NUMLNE  IS 'Número Línea';
LABEL ON COLUMN LNECR.FECAPR  IS 'Fecha Aprobación';
LABEL ON COLUMN LNECR.FECVEN  IS 'Fecha Vencimiento';
LABEL ON COLUMN LNECR.MONAPR  IS 'Monto Aprobado';
LABEL ON COLUMN LNECR.MONUTL  IS 'Monto Utilizado';
LABEL ON COLUMN LNECR.MONDIS  IS 'Monto Disponible';
LABEL ON COLUMN LNECR.ESTLNE  IS 'Estado Línea';
LABEL ON COLUMN LNECR.OBSREG  IS 'Observaciones';
LABEL ON COLUMN LNECR.VERREG  IS 'Versión Registro';
LABEL ON COLUMN LNECR.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN LNECR.USRING  IS 'Usuario Creación';
LABEL ON COLUMN LNECR.FECING  IS 'Fecha Creación';
LABEL ON COLUMN LNECR.USRACT  IS 'Usuario Actualiza';
LABEL ON COLUMN LNECR.FECACT  IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN LNECR.NUMCLI  TEXT IS 'ID Cliente';
LABEL ON COLUMN LNECR.NUMLNE  TEXT IS 'Número Línea';
LABEL ON COLUMN LNECR.FECAPR  TEXT IS 'Fecha Aprobación';
LABEL ON COLUMN LNECR.FECVEN  TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN LNECR.MONAPR  TEXT IS 'Monto Aprobado';
LABEL ON COLUMN LNECR.MONUTL  TEXT IS 'Monto Utilizado';
LABEL ON COLUMN LNECR.MONDIS  TEXT IS 'Monto Disponible';
LABEL ON COLUMN LNECR.ESTLNE  TEXT IS 'Estado Línea';
LABEL ON COLUMN LNECR.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN LNECR.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN LNECR.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN LNECR.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN LNECR.FECING  TEXT IS 'Fecha Creación';
LABEL ON COLUMN LNECR.USRACT  TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN LNECR.FECACT  TEXT IS 'Fecha Actualiza';

--======================================================================
-- Índices
--======================================================================
-- Índice sobre FK NUM_CLIENTE.
-- Justificación: búsquedas de líneas por cliente frecuentes.
CREATE INDEX IX_LNECR_NUMCLI ON LNECR (NUMCLI);