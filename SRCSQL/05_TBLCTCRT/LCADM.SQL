--======================================================================
-- Nombre de la Tabla : LCADM - ENMIENDAS_CARTAS_CC
--
-- DESCRIPCIÓN:
-- Registro de enmiendas a cartas de crédito. Mantiene información
-- de modificaciones realizadas a cartas de crédito, incluyendo
-- enmienda, fechas, montos, correspondencia bancaria y estado para
-- seguimiento de cambios en operaciones de comercio exterior.
--
-- Objetivo:
-- Centralizar el registro de enmiendas a cartas de crédito para
-- auditoría, seguimiento de cambios y gestión integral de operaciones
-- de comercio exterior.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Enmiendas y modificaciones a cartas de crédito del banco.
--
-- Permanencia de Datos:
-- Permanente (histórico de enmiendas).
--
-- Uso de los Datos:
-- Auditoría de enmiendas, seguimiento de cambios, gestión de
-- operaciones de comercio exterior y análisis de modificaciones.
--
-- Restricciones:
-- PK compuesta: numero_carta_credito, numero_enmienda.
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

CREATE OR REPLACE TABLE LCADM (

    NUMERO_CARTA_CREDITO FOR COLUMN  NUMCRTCRD VARCHAR(30)
                            NOT NULL,

    NUMERO_ENMIENDA FOR COLUMN NUMENM VARCHAR(30) NOT NULL,

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

    ESTADO_CARTA FOR COLUMN ESTCTA VARCHAR(20)
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

    CONSTRAINT LCADM_PK PRIMARY KEY (NUMCRTCRD, NUMENM),

    CONSTRAINT LCADM_LCMST_FK FOREIGN KEY ( NUMCRTCRD)
        REFERENCES LCMST ( NUMCRTCRD),

    CONSTRAINT LCADM_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RLCADM;

RENAME TABLE LCADM
TO ENMIENDAS_CARTAS_CC
FOR SYSTEM NAME LCADM;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE LCADM IS
'ENMIENDAS_CARTAS_CC';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN LCADM.NUMCRTCRD IS
'Número único de carta de crédito.';

COMMENT ON COLUMN LCADM.NUMENM IS
'Número único de enmienda.';

COMMENT ON COLUMN LCADM.FECEMI IS
'Fecha de emisión de la enmienda a carta de crédito.';

COMMENT ON COLUMN LCADM.FECVEN IS
'Fecha de vencimiento de la enmienda.';

COMMENT ON COLUMN LCADM.MNTORI IS
'Monto original de la enmienda a carta de crédito.';

COMMENT ON COLUMN LCADM.SLDACT IS
'Saldo actual de la enmienda a carta de crédito.';

COMMENT ON COLUMN LCADM.BCOCRR IS
'Banco corresponsal relacionado con la enmienda.';

COMMENT ON COLUMN LCADM.PAIDES IS
'País de destino de la operación de enmienda.';

COMMENT ON COLUMN LCADM.ESTCTA IS
'Estado operacional de la enmienda de carta de crédito.';

COMMENT ON COLUMN LCADM.OBSREG IS
'Observaciones adicionales de la enmienda.';

COMMENT ON COLUMN LCADM.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN LCADM.USRING IS
'Usuario que creó el registro de la enmienda.';

COMMENT ON COLUMN LCADM.FECING IS
'Fecha y hora de creación del registro de la enmienda.';

COMMENT ON COLUMN LCADM.USRACT IS
'Usuario que realizó la última actualización de la enmienda.';

COMMENT ON COLUMN LCADM.FECACT IS
'Fecha y hora de la última actualización de la enmienda.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE LCADM IS 'ENMIENDAS_CARTAS_CC';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN LCADM.NUMCRTCRD IS 'Número Carta Crédito';
LABEL ON COLUMN LCADM.NUMENM IS 'Número Enmienda';
LABEL ON COLUMN LCADM.FECEMI IS 'Fecha Emisión';
LABEL ON COLUMN LCADM.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN LCADM.MNTORI IS 'Monto Original';
LABEL ON COLUMN LCADM.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN LCADM.BCOCRR IS 'Banco Corresponsal';
LABEL ON COLUMN LCADM.PAIDES IS 'País Destino';
LABEL ON COLUMN LCADM.ESTCTA IS 'Estado Carta';
LABEL ON COLUMN LCADM.OBSREG IS 'Observaciones';
LABEL ON COLUMN LCADM.ESTREG IS 'Estado Registro';
LABEL ON COLUMN LCADM.USRING IS 'Usuario Creación';
LABEL ON COLUMN LCADM.FECING IS 'Fecha Creación';
LABEL ON COLUMN LCADM.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN LCADM.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN LCADM.NUMCRTCRD TEXT IS 'Número Carta Crédito';
LABEL ON COLUMN LCADM.NUMENM TEXT IS 'Número Enmienda';
LABEL ON COLUMN LCADM.FECEMI TEXT IS 'Fecha Emisión';
LABEL ON COLUMN LCADM.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN LCADM.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN LCADM.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN LCADM.BCOCRR TEXT IS 'Banco Corresponsal';
LABEL ON COLUMN LCADM.PAIDES TEXT IS 'País Destino';
LABEL ON COLUMN LCADM.ESTCTA TEXT IS 'Estado Carta';
LABEL ON COLUMN LCADM.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN LCADM.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN LCADM.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN LCADM.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN LCADM.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN LCADM.FECACT TEXT IS 'Fecha Actualiza';
