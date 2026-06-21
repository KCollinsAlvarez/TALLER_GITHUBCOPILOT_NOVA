--======================================================================
-- Nombre de la Tabla : LCMST - CARTAS_CREDITO
--
-- DESCRIPCIÓN:
-- Maestro de Cartas de Crédito. Registra las cartas de crédito
-- emitidas por el banco, incluyendo montos, fechas, bancos
-- corresponsales, países de destino y estado de cada operación.
--
-- Objetivo:
-- Centralizar el catálogo de cartas de crédito como referencia
-- principal para operaciones de comercio exterior.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Operaciones de emisión de cartas de crédito y comercio exterior.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referenciado por LCDOC, LCADM, LCCOV, LCDIN, APPRV y LCFEE
-- para gestión de documentos, enmiendas, negociaciones y cobros.
--
-- Restricciones:
-- PK técnica: id BIGINT GENERATED ALWAYS AS IDENTITY.
-- UNIQUE sobre numero_carta_credito (clave de negocio).
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-05
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE LCMST (

    ID_REGISTRO FOR COLUMN IDEREG BIGINT
           GENERATED ALWAYS AS IDENTITY
           NOT NULL,

    NUMERO_CARTA_CREDITO FOR COLUMN NUMCRTCRD VARCHAR(30)
                            NOT NULL,

    FECHA_EMISION FOR COLUMN FECEMI DATE
                      NOT NULL DEFAULT '0001-01-01',

    FECHA_VENCIMIENTO FOR COLUMN FECVEN DATE
                    NOT NULL DEFAULT '0001-01-01',

    MONTO_ORIGINAL FOR COLUMN MNTORI DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                    NOT NULL DEFAULT 0,

    BANCO_CORRESPONSAL FOR COLUMN BCOCOR VARCHAR(80)
                          NOT NULL DEFAULT '',

    PAIS_DESTINO FOR COLUMN PAIDES VARCHAR(80)
                     NOT NULL DEFAULT '',

    ESTADO_CARTA FOR COLUMN ESTCRT VARCHAR(20)
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

    CONSTRAINT LCMST_PK PRIMARY KEY (IDEREG),

    CONSTRAINT UK_LCMST_NUMCRTCRD UNIQUE (NUMCRTCRD),

    CONSTRAINT LCMST_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RLCMST;

RENAME TABLE LCMST
TO CARTAS_CREDITO
FOR SYSTEM NAME LCMST;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE LCMST IS
'CARTAS_CREDITO';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN LCMST.IDEREG IS
'Identificador técnico único.';

COMMENT ON COLUMN LCMST.NUMCRTCRD IS
'Número de carta de crédito.';

COMMENT ON COLUMN LCMST.FECEMI IS
'Fecha de emisión de la carta de crédito.';

COMMENT ON COLUMN LCMST.FECVEN IS
'Fecha de vencimiento de la carta de crédito.';

COMMENT ON COLUMN LCMST.MNTORI IS
'Monto original de la carta de crédito.';

COMMENT ON COLUMN LCMST.SLDACT IS
'Saldo actual disponible en la carta de crédito.';

COMMENT ON COLUMN LCMST.BCOCOR IS
'Banco corresponsal intermediario en la operación.';

COMMENT ON COLUMN LCMST.PAIDES IS
'País de destino de la mercancía o servicio.';

COMMENT ON COLUMN LCMST.ESTCRT IS
'Estado operativo de la carta de crédito.';

COMMENT ON COLUMN LCMST.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN LCMST.OBSREG IS
'Observaciones adicionales de la carta de crédito.';

COMMENT ON COLUMN LCMST.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN LCMST.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN LCMST.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN LCMST.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN LCMST.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE LCMST IS 'CARTAS_CREDITO';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN LCMST.IDEREG  IS 'ID Técnico';
LABEL ON COLUMN LCMST.NUMCRTCRD  IS 'Número Carta Credito';
LABEL ON COLUMN LCMST.FECEMI  IS 'Fecha Emisión';
LABEL ON COLUMN LCMST.FECVEN  IS 'Fecha Vencimiento';
LABEL ON COLUMN LCMST.MNTORI  IS 'Monto Original';
LABEL ON COLUMN LCMST.SLDACT  IS 'Saldo Actual';
LABEL ON COLUMN LCMST.BCOCOR  IS 'Banco Corresponsal';
LABEL ON COLUMN LCMST.PAIDES  IS 'País Destino';
LABEL ON COLUMN LCMST.ESTCRT  IS 'Estado Carta Credito';
LABEL ON COLUMN LCMST.VERREG  IS 'Versión Registro';
LABEL ON COLUMN LCMST.OBSREG  IS 'Observaciones';
LABEL ON COLUMN LCMST.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN LCMST.USRING  IS 'Usuario Creación';
LABEL ON COLUMN LCMST.FECING  IS 'Fecha Creación';
LABEL ON COLUMN LCMST.USRACT  IS 'Usuario Actualiza';
LABEL ON COLUMN LCMST.FECACT  IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN LCMST.IDEREG  TEXT IS 'ID Técnico';
LABEL ON COLUMN LCMST.NUMCRTCRD  TEXT IS 'Número Carta Credito';
LABEL ON COLUMN LCMST.FECEMI  TEXT IS 'Fecha Emisión';
LABEL ON COLUMN LCMST.FECVEN  TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN LCMST.MNTORI  TEXT IS 'Monto Original';
LABEL ON COLUMN LCMST.SLDACT  TEXT IS 'Saldo Actual';
LABEL ON COLUMN LCMST.BCOCOR  TEXT IS 'Banco Corresponsal';
LABEL ON COLUMN LCMST.PAIDES  TEXT IS 'País Destino';
LABEL ON COLUMN LCMST.ESTCRT  TEXT IS 'Estado Carta Credito';
LABEL ON COLUMN LCMST.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN LCMST.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN LCMST.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN LCMST.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN LCMST.FECING  TEXT IS 'Fecha Creación';
LABEL ON COLUMN LCMST.USRACT  TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN LCMST.FECACT  TEXT IS 'Fecha Actualiza';

--======================================================================
-- Índices
--======================================================================
-- Índice sobre clave de negocio numero_carta_credito.
-- Justificación: búsquedas de cartas por número frecuentes;
-- tablas hijas LCDOC, LCADM, LCCOV, LCDIN, APPRV, LCFEE
-- referencian esta columna via FK (RI-004).
CREATE INDEX IX_LCMST_NUMCRTCRD ON LCMST (NUMCRTCRD);