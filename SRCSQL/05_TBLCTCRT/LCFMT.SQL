
--======================================================================
-- Nombre de la Tabla : LCFMT - FORMATOS_CARTA_CRT
--
-- DESCRIPCIÓN:
-- Formatos de Cartas de Crédito. Registra líneas de texto de cada
-- formato de documento.
--
-- Objetivo:
-- Mantener la definición detallada de formato para cartas de crédito.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Formatos de emisión de cartas de crédito.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Generación y presentación de documentos de crédito.
--
-- Restricciones:
-- PK sobre documento, secuencia de texto y número de línea.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-19
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE LCFMT (

    CODIGO_DOCUMENTO FOR COLUMN CODDOC VARCHAR(20)
                             NOT NULL,

    SECUENCIA_DE_TEXTO FOR COLUMN SECTXT VARCHAR(50)
                                  NOT NULL,

    NUMERO_LINEA FOR COLUMN NUMLNE VARCHAR(30)
                           NOT NULL,

    FECHA_EMISION FOR COLUMN FECEMI DATE
                        NOT NULL DEFAULT '0001-01-01',

    FECHA_VENCIMIENTO FOR COLUMN FECVEN DATE
                         NOT NULL DEFAULT '0001-01-01',

    MONTO_ORIGINAL FOR COLUMN MNTORI DECIMAL(18, 2)
                         NOT NULL DEFAULT 0,

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                     NOT NULL DEFAULT 0,

    BANCO_CORRESPONSAL FOR COLUMN BCOCRR VARCHAR(80)
                              NOT NULL DEFAULT '',

    PAIS_DESTINO FOR COLUMN PAIDST VARCHAR(80)
                         NOT NULL DEFAULT '',

    ESTADO_CARTA FOR COLUMN ESTCAR VARCHAR(20)
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

    CONSTRAINT LCFMT_PK PRIMARY KEY (CODDOC, SECTXT, NUMLNE),

    CONSTRAINT LCFMT_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RLCFMT;

RENAME TABLE LCFMT
TO FORMATOS_CARTA_CRT
FOR SYSTEM NAME LCFMT;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE LCFMT IS
'FORMATOS_CARTA_CRT';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN LCFMT.CODDOC IS
'Código del documento.';

COMMENT ON COLUMN LCFMT.SECTXT IS
'Secuencia de texto del formato.';

COMMENT ON COLUMN LCFMT.NUMLNE IS
'Número de línea del formato.';

COMMENT ON COLUMN LCFMT.FECEMI IS
'Fecha de emisión.';

COMMENT ON COLUMN LCFMT.FECVEN IS
'Fecha de vencimiento.';

COMMENT ON COLUMN LCFMT.MNTORI IS
'Monto original de la operación.';

COMMENT ON COLUMN LCFMT.SLDACT IS
'Saldo actual de la operación.';

COMMENT ON COLUMN LCFMT.BCOCRR IS
'Banco corresponsal.';

COMMENT ON COLUMN LCFMT.PAIDST IS
'País de destino.';

COMMENT ON COLUMN LCFMT.ESTCAR IS
'Estado de la carta.';

COMMENT ON COLUMN LCFMT.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN LCFMT.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN LCFMT.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN LCFMT.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN LCFMT.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN LCFMT.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN LCFMT.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE LCFMT IS 'FORMATOS_CARTA_CRT';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN LCFMT.CODDOC IS 'Código Documento';
LABEL ON COLUMN LCFMT.SECTXT IS 'Secuencia Texto';
LABEL ON COLUMN LCFMT.NUMLNE IS 'Número Línea';
LABEL ON COLUMN LCFMT.FECEMI IS 'Fecha Emisión';
LABEL ON COLUMN LCFMT.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN LCFMT.MNTORI IS 'Monto Original';
LABEL ON COLUMN LCFMT.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN LCFMT.BCOCRR IS 'Banco Corresponsal';
LABEL ON COLUMN LCFMT.PAIDST IS 'País Destino';
LABEL ON COLUMN LCFMT.ESTCAR IS 'Estado Carta';
LABEL ON COLUMN LCFMT.VERREG IS 'Versión Registro';
LABEL ON COLUMN LCFMT.OBSREG IS 'Observaciones';
LABEL ON COLUMN LCFMT.ESTREG IS 'Estado Registro';
LABEL ON COLUMN LCFMT.USRING IS 'Usuario Creación';
LABEL ON COLUMN LCFMT.FECING IS 'Fecha Creación';
LABEL ON COLUMN LCFMT.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN LCFMT.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN LCFMT.CODDOC TEXT IS 'Código Documento';
LABEL ON COLUMN LCFMT.SECTXT TEXT IS 'Secuencia Texto';
LABEL ON COLUMN LCFMT.NUMLNE TEXT IS 'Número Línea';
LABEL ON COLUMN LCFMT.FECEMI TEXT IS 'Fecha Emisión';
LABEL ON COLUMN LCFMT.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN LCFMT.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN LCFMT.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN LCFMT.BCOCRR TEXT IS 'Banco Corresponsal';
LABEL ON COLUMN LCFMT.PAIDST TEXT IS 'País Destino';
LABEL ON COLUMN LCFMT.ESTCAR TEXT IS 'Estado Carta';
LABEL ON COLUMN LCFMT.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN LCFMT.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN LCFMT.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN LCFMT.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN LCFMT.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN LCFMT.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN LCFMT.FECACT TEXT IS 'Fecha Actualiza';