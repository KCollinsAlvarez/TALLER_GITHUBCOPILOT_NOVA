--======================================================================
-- Nombre de la Tabla : LCCOV - NEG_CARTAS_CREDITO
--
-- DESCRIPCIÓN:
-- Registro de negociaciones de cartas de crédito. Mantiene información
-- de negociación de cartas de crédito, incluyendo fechas, montos,
-- correspondencia bancaria y estado operacional para seguimiento de
-- operaciones de comercio exterior.
--
-- Objetivo:
-- Centralizar el registro de negociaciones de cartas de crédito para
-- auditoría, seguimiento de procesos y gestión integral de operaciones
-- de comercio exterior.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Negociaciones y procesos de cartas de crédito del banco.
--
-- Permanencia de Datos:
-- Permanente (histórico de negociaciones).
--
-- Uso de los Datos:
-- Auditoría de negociaciones, seguimiento de procesos, gestión de
-- operaciones de comercio exterior y análisis de negociaciones.
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

CREATE OR REPLACE TABLE LCCOV (

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

    CONSTRAINT LCCOV_PK PRIMARY KEY (NUMCRTCRD, NUMSEC),

    CONSTRAINT LCCOV_LCMST_FK FOREIGN KEY (NUMCRTCRD)
        REFERENCES LCMST (NUMCRTCRD),

    CONSTRAINT LCCOV_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RLCCOV;

RENAME TABLE LCCOV
TO NEG_CARTAS_CREDITO
FOR SYSTEM NAME LCCOV;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE LCCOV IS
'NEG_CARTAS_CREDITO';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN LCCOV.NUMCRTCRD IS
'Número único de carta de crédito.';

COMMENT ON COLUMN LCCOV.NUMSEC IS
'Número secuencial de negociación.';

COMMENT ON COLUMN LCCOV.FECEMI IS
'Fecha de emisión de la negociación de carta de crédito.';

COMMENT ON COLUMN LCCOV.FECVEN IS
'Fecha de vencimiento de la negociación.';

COMMENT ON COLUMN LCCOV.MNTORI IS
'Monto original de la negociación de carta de crédito.';

COMMENT ON COLUMN LCCOV.SLDACT IS
'Saldo actual de la negociación de carta de crédito.';

COMMENT ON COLUMN LCCOV.BCOCRR IS
'Banco corresponsal relacionado con la negociación.';

COMMENT ON COLUMN LCCOV.PAIDES IS
'País de destino de la operación de negociación.';

COMMENT ON COLUMN LCCOV.ESTCRT IS
'Estado operacional de la negociación de carta de crédito.';

COMMENT ON COLUMN LCCOV.OBSREG IS
'Observaciones adicionales de la negociación.';

COMMENT ON COLUMN LCCOV.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN LCCOV.USRING IS
'Usuario que creó el registro de la negociación.';

COMMENT ON COLUMN LCCOV.FECING IS
'Fecha y hora de creación del registro de la negociación.';

COMMENT ON COLUMN LCCOV.USRACT IS
'Usuario que realizó la última actualización de la negociación.';

COMMENT ON COLUMN LCCOV.FECACT IS
'Fecha y hora de la última actualización de la negociación.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE LCCOV IS 'NEG_CARTAS_CREDITO';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN LCCOV.NUMCRTCRD IS 'Número Carta Crédito';
LABEL ON COLUMN LCCOV.NUMSEC IS 'Secuencia';
LABEL ON COLUMN LCCOV.FECEMI IS 'Fecha Emisión';
LABEL ON COLUMN LCCOV.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN LCCOV.MNTORI IS 'Monto Original';
LABEL ON COLUMN LCCOV.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN LCCOV.BCOCRR IS 'Banco Corresponsal';
LABEL ON COLUMN LCCOV.PAIDES IS 'País Destino';
LABEL ON COLUMN LCCOV.ESTCRT IS 'Estado Carta';
LABEL ON COLUMN LCCOV.OBSREG IS 'Observaciones';
LABEL ON COLUMN LCCOV.ESTREG IS 'Estado Registro';
LABEL ON COLUMN LCCOV.USRING IS 'Usuario Creación';
LABEL ON COLUMN LCCOV.FECING IS 'Fecha Creación';
LABEL ON COLUMN LCCOV.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN LCCOV.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN LCCOV.NUMCRTCRD TEXT IS 'Número Carta Crédito';
LABEL ON COLUMN LCCOV.NUMSEC TEXT IS 'Secuencia';
LABEL ON COLUMN LCCOV.FECEMI TEXT IS 'Fecha Emisión';
LABEL ON COLUMN LCCOV.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN LCCOV.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN LCCOV.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN LCCOV.BCOCRR TEXT IS 'Banco Corresponsal';
LABEL ON COLUMN LCCOV.PAIDES TEXT IS 'País Destino';
LABEL ON COLUMN LCCOV.ESTCRT TEXT IS 'Estado Carta';
LABEL ON COLUMN LCCOV.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN LCCOV.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN LCCOV.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN LCCOV.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN LCCOV.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN LCCOV.FECACT TEXT IS 'Fecha Actualiza';