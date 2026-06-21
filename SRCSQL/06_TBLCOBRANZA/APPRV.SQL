--======================================================================
-- Nombre de la Tabla : APPRV - COBRANZAS_APROBACION
--
-- DESCRIPCIÓN:
-- Cobranzas pendientes de Aprobación. Registra operaciones de
-- cobranza documentaria que requieren aprobación, incluyendo montos,
-- fechas de recepción y vencimiento, y estado operativo de cada
-- documento.
--
-- Objetivo:
-- Centralizar el control de cobranzas en espera de aprobación para
-- operaciones de comercio exterior.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Operaciones de cobranzas documentarias de cartas de crédito.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referenciada desde LCMST para gestión de cobranzas pendientes
-- de aprobación en operaciones de comercio exterior.
--
-- Restricciones:
-- PK técnica sobre numero_carta_credito y tipo_registro.
-- FK a LCMST (numero_carta_credito).
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-16
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE APPRV (

    NUMERO_CARTA_CREDITO FOR COLUMN NUMCRTCRD VARCHAR(30)
                            NOT NULL,

    TIPO_REGISTRO FOR COLUMN TIPREG VARCHAR(20)
                      NOT NULL,

    FECHA_RECEPCION FOR COLUMN FECREC DATE
                        NOT NULL DEFAULT '0001-01-01',

    FECHA_VENCIMIENTO FOR COLUMN FECVEN DATE
                    NOT NULL DEFAULT '0001-01-01',

    MONTO_ORIGINAL FOR COLUMN MNTORI DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    SALDO_PENDIENTE FOR COLUMN SLDPEN DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    TIPO_DOCUMENTO FOR COLUMN TIPDOC VARCHAR(20)
                       NOT NULL DEFAULT '',

    ESTADO_OPERACION FOR COLUMN ESTOPE VARCHAR(20)
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

    CONSTRAINT APPRV_PK PRIMARY KEY (NUMCRTCRD, TIPREG),

    CONSTRAINT FK_APPRV_LCMST FOREIGN KEY (NUMCRTCRD)
        REFERENCES LCMST (NUMCRTCRD),

    CONSTRAINT APPRV_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RAPPRV;

RENAME TABLE APPRV
TO COBRANZAS_APROBACION
FOR SYSTEM NAME APPRV;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE APPRV IS
'COBRANZAS_APROBACION';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN APPRV.NUMCRTCRD IS
'Número de carta de crédito asociada.';

COMMENT ON COLUMN APPRV.TIPREG IS
'Tipo de registro de cobranza.';

COMMENT ON COLUMN APPRV.FECREC IS
'Fecha de recepción del documento de cobranza.';

COMMENT ON COLUMN APPRV.FECVEN IS
'Fecha de vencimiento de la cobranza.';

COMMENT ON COLUMN APPRV.MNTORI IS
'Monto original de la cobranza.';

COMMENT ON COLUMN APPRV.SLDPEN IS
'Saldo pendiente de cobranza.';

COMMENT ON COLUMN APPRV.TIPDOC IS
'Tipo de documento en cobranza.';

COMMENT ON COLUMN APPRV.ESTOPE IS
'Estado operativo de la cobranza.';

COMMENT ON COLUMN APPRV.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN APPRV.OBSREG IS
'Observaciones adicionales de la cobranza.';

COMMENT ON COLUMN APPRV.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN APPRV.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN APPRV.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN APPRV.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN APPRV.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE APPRV IS 'COBRANZAS_APROBACION';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN APPRV.NUMCRTCRD IS 'Número Carta Credito';
LABEL ON COLUMN APPRV.TIPREG IS 'Tipo Registro';
LABEL ON COLUMN APPRV.FECREC IS 'Fecha Recepción';
LABEL ON COLUMN APPRV.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN APPRV.MNTORI IS 'Monto Original';
LABEL ON COLUMN APPRV.SLDPEN IS 'Saldo Pendiente';
LABEL ON COLUMN APPRV.TIPDOC IS 'Tipo Documento';
LABEL ON COLUMN APPRV.ESTOPE IS 'Estado Operación';
LABEL ON COLUMN APPRV.VERREG IS 'Versión Registro';
LABEL ON COLUMN APPRV.OBSREG IS 'Observaciones';
LABEL ON COLUMN APPRV.ESTREG IS 'Estado Registro';
LABEL ON COLUMN APPRV.USRING IS 'Usuario Creación';
LABEL ON COLUMN APPRV.FECING IS 'Fecha Creación';
LABEL ON COLUMN APPRV.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN APPRV.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN APPRV.NUMCRTCRD TEXT IS 'Número Carta Credito';
LABEL ON COLUMN APPRV.TIPREG TEXT IS 'Tipo Registro';
LABEL ON COLUMN APPRV.FECREC TEXT IS 'Fecha Recepción';
LABEL ON COLUMN APPRV.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN APPRV.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN APPRV.SLDPEN TEXT IS 'Saldo Pendiente';
LABEL ON COLUMN APPRV.TIPDOC TEXT IS 'Tipo Documento';
LABEL ON COLUMN APPRV.ESTOPE TEXT IS 'Estado Operación';
LABEL ON COLUMN APPRV.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN APPRV.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN APPRV.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN APPRV.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN APPRV.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN APPRV.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN APPRV.FECACT TEXT IS 'Fecha Actualiza';

--======================================================================
-- Índices
--======================================================================
-- Índice sobre fecha de ingreso.
-- Justificación: ordenamiento y filtrado cronológico de cobranzas.
CREATE INDEX IX_APPRV_FECING ON APPRV (FECING);
