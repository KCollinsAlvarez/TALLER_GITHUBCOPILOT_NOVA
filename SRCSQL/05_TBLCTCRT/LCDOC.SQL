--======================================================================
-- Nombre de la Tabla : LCDOC - DOCS_CARTAS_CREDITO
--
-- DESCRIPCIÓN:
-- Registro de documentos asociados a cartas de crédito. Mantiene
-- información de documentación, emisión, vencimiento, montos,
-- correspondencia bancaria y estado operacional de cada documento
-- vinculado a una operación de carta de crédito.
--
-- Objetivo:
-- Centralizar la gestión de documentación de cartas de crédito para
-- seguimiento, validación de vencimientos, conciliación y auditoría
-- integral de operaciones de comercio exterior.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Operaciones de cartas de crédito y documentación asociada del banco.
--
-- Permanencia de Datos:
-- Permanente (histórico de documentos).
--
-- Uso de los Datos:
-- Gestión de documentación, auditoría de cartas de crédito, análisis
-- de vencimientos y reportes de operaciones de comercio exterior.
--
-- Restricciones:
-- PK compuesta: numero_carta_credito, tipo_registro, codigo_banco,
--   codigo_documento, numero_linea.
-- FK a LCMST (numero_carta_credito).
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría completa en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-11
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE LCDOC (

    NUMERO_CARTA_CREDITO FOR COLUMN NUMCRTCRD VARCHAR(30)
                            NOT NULL,

    TIPO_REGISTRO FOR COLUMN TIPREG VARCHAR(20)
                      NOT NULL,

    CODIGO_BANCO FOR COLUMN CODBCO SMALLINT
                    NOT NULL,

    CODIGO_DOCUMENTO FOR COLUMN CODDOC VARCHAR(20)
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

    PAIS_DESTINO FOR COLUMN PAIDES VARCHAR(80)
                    NOT NULL DEFAULT '',

    ESTADO_CARTA FOR COLUMN ESTCRT VARCHAR(20)
                    NOT NULL DEFAULT '',

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

    CONSTRAINT LCDOC_PK PRIMARY KEY (NUMCRTCRD,TIPREG,CODBCO,
                                     CODDOC,NUMLNE),

    CONSTRAINT LCDOC_LCMST_FK FOREIGN KEY (NUMCRTCRD)
        REFERENCES LCMST (NUMCRTCRD),

    CONSTRAINT LCDOC_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RLCDOC;

RENAME TABLE LCDOC
TO DOCS_CARTAS_CREDITO
FOR SYSTEM NAME LCDOC;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE LCDOC IS
'DOCS_CARTAS_CREDITO';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN LCDOC.NUMCRTCRD IS
'Número único de carta de crédito.';

COMMENT ON COLUMN LCDOC.TIPREG IS
'Tipo de registro de documento.';

COMMENT ON COLUMN LCDOC.CODBCO IS
'Código del banco corresponsal.';

COMMENT ON COLUMN LCDOC.CODDOC IS
'Código único del documento.';

COMMENT ON COLUMN LCDOC.NUMLNE IS
'Número de línea del documento.';

COMMENT ON COLUMN LCDOC.FECEMI IS
'Fecha de emisión del documento de carta de crédito.';

COMMENT ON COLUMN LCDOC.FECVEN IS
'Fecha de vencimiento del documento de carta de crédito.';

COMMENT ON COLUMN LCDOC.MNTORI IS
'Monto original del documento de carta de crédito.';

COMMENT ON COLUMN LCDOC.SLDACT IS
'Saldo actual del documento de carta de crédito.';

COMMENT ON COLUMN LCDOC.BCOCRR IS
'Banco corresponsal relacionado con la carta de crédito.';

COMMENT ON COLUMN LCDOC.PAIDES IS
'País de destino de la operación de carta de crédito.';

COMMENT ON COLUMN LCDOC.ESTCRT IS
'Estado operacional de la carta de crédito.';

COMMENT ON COLUMN LCDOC.OBSREG IS
'Observaciones adicionales del documento.';

COMMENT ON COLUMN LCDOC.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN LCDOC.USRING IS
'Usuario que creó el registro del documento.';

COMMENT ON COLUMN LCDOC.FECING IS
'Fecha y hora de creación del registro del documento.';

COMMENT ON COLUMN LCDOC.USRACT IS
'Usuario que realizó la última actualización del documento.';

COMMENT ON COLUMN LCDOC.FECACT IS
'Fecha y hora de la última actualización del documento.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE LCDOC IS 'DOCS_CARTAS_CREDITO';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN LCDOC.NUMCRTCRD IS 'Número Carta Crédito';
LABEL ON COLUMN LCDOC.TIPREG IS 'Tipo Registro';
LABEL ON COLUMN LCDOC.CODBCO IS 'Código Banco';
LABEL ON COLUMN LCDOC.CODDOC IS 'Código Documento';
LABEL ON COLUMN LCDOC.NUMLNE IS 'Número Línea';
LABEL ON COLUMN LCDOC.FECEMI IS 'Fecha Emisión';
LABEL ON COLUMN LCDOC.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN LCDOC.MNTORI IS 'Monto Original';
LABEL ON COLUMN LCDOC.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN LCDOC.BCOCRR IS 'Banco Corresponsal';
LABEL ON COLUMN LCDOC.PAIDES IS 'País Destino';
LABEL ON COLUMN LCDOC.ESTCRT IS 'Estado Carta';
LABEL ON COLUMN LCDOC.OBSREG IS 'Observaciones';
LABEL ON COLUMN LCDOC.ESTREG IS 'Estado Registro';
LABEL ON COLUMN LCDOC.USRING IS 'Usuario Creación';
LABEL ON COLUMN LCDOC.FECING IS 'Fecha Creación';
LABEL ON COLUMN LCDOC.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN LCDOC.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN LCDOC.NUMCRTCRD TEXT IS 'Número Carta Crédito';
LABEL ON COLUMN LCDOC.TIPREG TEXT IS 'Tipo Registro';
LABEL ON COLUMN LCDOC.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN LCDOC.CODDOC TEXT IS 'Código Documento';
LABEL ON COLUMN LCDOC.NUMLNE TEXT IS 'Número Línea';
LABEL ON COLUMN LCDOC.FECEMI TEXT IS 'Fecha Emisión';
LABEL ON COLUMN LCDOC.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN LCDOC.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN LCDOC.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN LCDOC.BCOCRR TEXT IS 'Banco Corresponsal';
LABEL ON COLUMN LCDOC.PAIDES TEXT IS 'País Destino';
LABEL ON COLUMN LCDOC.ESTCRT TEXT IS 'Estado Carta';
LABEL ON COLUMN LCDOC.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN LCDOC.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN LCDOC.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN LCDOC.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN LCDOC.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN LCDOC.FECACT TEXT IS 'Fecha Actualiza';
