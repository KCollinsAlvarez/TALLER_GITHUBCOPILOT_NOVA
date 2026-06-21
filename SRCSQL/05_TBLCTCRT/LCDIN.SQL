--======================================================================
-- Nombre de la Tabla : LCDIN - DOCS_RECIBIDOS_CTCD
--
-- DESCRIPCIÓN:
-- Registro de documentos recibidos en cartas de crédito. Mantiene
-- información de documentación recibida de cartas de crédito, incluyendo
-- fechas, montos, correspondencia bancaria y estado operacional para
-- seguimiento de operaciones de comercio exterior.
--
-- Objetivo:
-- Centralizar el registro de documentos recibidos en cartas de crédito
-- para auditoría, seguimiento de documentación y gestión integral de
-- operaciones de comercio exterior.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Documentos recibidos en cartas de crédito del banco.
--
-- Permanencia de Datos:
-- Permanente (histórico de documentos).
--
-- Uso de los Datos:
-- Auditoría de documentación, seguimiento de recepción, gestión de
-- operaciones de comercio exterior y análisis de documentos.
--
-- Restricciones:
-- PK compuesta: numero_carta_credito, secuencia.
-- FK a LCMST (numero_carta_credito).
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría completa en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-13
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE LCDIN (

    NUMERO_CARTA_CREDITO FOR COLUMN NUMCRTCRD VARCHAR(30)
                            NOT NULL,

    NUMERO_SECUENCIA FOR COLUMN NUMSEC INTEGER
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

    CONSTRAINT LCDIN_PK PRIMARY KEY (NUMCRTCRD, NUMSEC),

    CONSTRAINT LCDIN_LCMST_FK FOREIGN KEY (NUMCRTCRD)
        REFERENCES LCMST (NUMCRTCRD),

    CONSTRAINT LCDIN_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RLCDIN;

RENAME TABLE LCDIN
TO DOCS_RECIBIDOS_CTCD
FOR SYSTEM NAME LCDIN;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE LCDIN IS
'DOCS_RECIBIDOS_CTCD';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN LCDIN.NUMCRTCRD IS
'Número único de carta de crédito. PK compuesta, FK a LCMST.';

COMMENT ON COLUMN LCDIN.NUMSEC IS
'Número secuencial del documento. Parte de PK compuesta.';

COMMENT ON COLUMN LCDIN.FECEMI IS
'Fecha de emisión del documento de carta de crédito.';

COMMENT ON COLUMN LCDIN.FECVEN IS
'Fecha de vencimiento del documento.';

COMMENT ON COLUMN LCDIN.MNTORI IS
'Monto original del documento de carta de crédito.';

COMMENT ON COLUMN LCDIN.SLDACT IS
'Saldo actual del documento de carta de crédito.';

COMMENT ON COLUMN LCDIN.BCOCRR IS
'Banco corresponsal relacionado con el documento.';

COMMENT ON COLUMN LCDIN.PAIDES IS
'País de destino de la operación de documento.';

COMMENT ON COLUMN LCDIN.ESTCRT IS
'Estado operacional del documento de carta de crédito.';

COMMENT ON COLUMN LCDIN.OBSREG IS
'Observaciones adicionales del documento.';

COMMENT ON COLUMN LCDIN.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN LCDIN.USRING IS
'Usuario que creó el registro del documento.';

COMMENT ON COLUMN LCDIN.FECING IS
'Fecha y hora de creación del registro del documento.';

COMMENT ON COLUMN LCDIN.USRACT IS
'Usuario que realizó la última actualización del documento.';

COMMENT ON COLUMN LCDIN.FECACT IS
'Fecha y hora de la última actualización del documento.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE LCDIN IS 'DOCS_RECIBIDOS_CTCD';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN LCDIN.NUMCRTCRD IS 'Número Carta Crédito';
LABEL ON COLUMN LCDIN.NUMSEC IS 'Secuencia';
LABEL ON COLUMN LCDIN.FECEMI IS 'Fecha Emisión';
LABEL ON COLUMN LCDIN.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN LCDIN.MNTORI IS 'Monto Original';
LABEL ON COLUMN LCDIN.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN LCDIN.BCOCRR IS 'Banco Corresponsal';
LABEL ON COLUMN LCDIN.PAIDES IS 'País Destino';
LABEL ON COLUMN LCDIN.ESTCRT IS 'Estado Carta';
LABEL ON COLUMN LCDIN.OBSREG IS 'Observaciones';
LABEL ON COLUMN LCDIN.ESTREG IS 'Estado Registro';
LABEL ON COLUMN LCDIN.USRING IS 'Usuario Creación';
LABEL ON COLUMN LCDIN.FECING IS 'Fecha Creación';
LABEL ON COLUMN LCDIN.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN LCDIN.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN LCDIN.NUMCRTCRD TEXT IS 'Número Carta Crédito';
LABEL ON COLUMN LCDIN.NUMSEC TEXT IS 'Secuencia';
LABEL ON COLUMN LCDIN.FECEMI TEXT IS 'Fecha Emisión';
LABEL ON COLUMN LCDIN.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN LCDIN.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN LCDIN.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN LCDIN.BCOCRR TEXT IS 'Banco Corresponsal';
LABEL ON COLUMN LCDIN.PAIDES TEXT IS 'País Destino';
LABEL ON COLUMN LCDIN.ESTCRT TEXT IS 'Estado Carta';
LABEL ON COLUMN LCDIN.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN LCDIN.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN LCDIN.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN LCDIN.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN LCDIN.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN LCDIN.FECACT TEXT IS 'Fecha Actualiza';
