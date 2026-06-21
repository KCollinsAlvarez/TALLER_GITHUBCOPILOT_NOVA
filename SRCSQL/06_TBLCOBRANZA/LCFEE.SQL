--======================================================================
-- Nombre de la Tabla : LCFEE - CNTRL_COBRO_COMISION
--
-- DESCRIPCIÓN:
-- Control de Cobro de Comisiones en Cartas de Crédito. Registra
-- comisiones por servicios de cartas de crédito, incluyendo montos,
-- fechas de recepción y vencimiento, y estado operativo de cada
-- comisión.
--
-- Objetivo:
-- Centralizar el control de comisiones por servicio en cartas de
-- crédito para operaciones de comercio exterior.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Operaciones de comisiones relacionadas con cartas de crédito.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referenciada desde LCMST para gestión de comisiones cobradas
-- en operaciones de cartas de crédito.
--
-- Restricciones:
-- PK técnica sobre numero_carta_credito y codigo_de_comision.
-- FK a LCMST (numero_carta_credito).
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-16
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE LCFEE (

    NUMERO_CARTA_CREDITO FOR COLUMN NUMCRTCRD VARCHAR(30)
                            NOT NULL,

    CODIGO_DE_COMISION FOR COLUMN CODCMS VARCHAR(20)
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

    CONSTRAINT LCFEE_PK PRIMARY KEY (NUMCRTCRD, CODCMS),

    CONSTRAINT FK_LCFEE_LCMST FOREIGN KEY (NUMCRTCRD)
        REFERENCES LCMST (NUMCRTCRD),

    CONSTRAINT LCFEE_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RLCFEE;

RENAME TABLE LCFEE
TO CNTRL_COBRO_COMISION
FOR SYSTEM NAME LCFEE;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE LCFEE IS
'CNTRL_COBRO_COMISION';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN LCFEE.NUMCRTCRD IS
'Número de carta de crédito asociada.';

COMMENT ON COLUMN LCFEE.CODCMS IS
'Código de comisión por servicio.';

COMMENT ON COLUMN LCFEE.FECREC IS
'Fecha de recepción de la comisión.';

COMMENT ON COLUMN LCFEE.FECVEN IS
'Fecha de vencimiento de la comisión.';

COMMENT ON COLUMN LCFEE.MNTORI IS
'Monto original de la comisión.';

COMMENT ON COLUMN LCFEE.SLDPEN IS
'Saldo pendiente de comisión.';

COMMENT ON COLUMN LCFEE.TIPDOC IS
'Tipo de documento de comisión.';

COMMENT ON COLUMN LCFEE.ESTOPE IS
'Estado operativo de la comisión.';

COMMENT ON COLUMN LCFEE.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN LCFEE.OBSREG IS
'Observaciones adicionales de la comisión.';

COMMENT ON COLUMN LCFEE.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN LCFEE.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN LCFEE.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN LCFEE.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN LCFEE.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE LCFEE IS 'CNTRL_COBRO_COMISION';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN LCFEE.NUMCRTCRD IS 'Número Carta Credito';
LABEL ON COLUMN LCFEE.CODCMS IS 'Código Comisión';
LABEL ON COLUMN LCFEE.FECREC IS 'Fecha Recepción';
LABEL ON COLUMN LCFEE.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN LCFEE.MNTORI IS 'Monto Original';
LABEL ON COLUMN LCFEE.SLDPEN IS 'Saldo Pendiente';
LABEL ON COLUMN LCFEE.TIPDOC IS 'Tipo Documento';
LABEL ON COLUMN LCFEE.ESTOPE IS 'Estado Operación';
LABEL ON COLUMN LCFEE.VERREG IS 'Versión Registro';
LABEL ON COLUMN LCFEE.OBSREG IS 'Observaciones';
LABEL ON COLUMN LCFEE.ESTREG IS 'Estado Registro';
LABEL ON COLUMN LCFEE.USRING IS 'Usuario Creación';
LABEL ON COLUMN LCFEE.FECING IS 'Fecha Creación';
LABEL ON COLUMN LCFEE.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN LCFEE.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN LCFEE.NUMCRTCRD TEXT IS 'Número Carta Credito';
LABEL ON COLUMN LCFEE.CODCMS TEXT IS 'Código Comisión';
LABEL ON COLUMN LCFEE.FECREC TEXT IS 'Fecha Recepción';
LABEL ON COLUMN LCFEE.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN LCFEE.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN LCFEE.SLDPEN TEXT IS 'Saldo Pendiente';
LABEL ON COLUMN LCFEE.TIPDOC TEXT IS 'Tipo Documento';
LABEL ON COLUMN LCFEE.ESTOPE TEXT IS 'Estado Operación';
LABEL ON COLUMN LCFEE.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN LCFEE.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN LCFEE.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN LCFEE.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN LCFEE.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN LCFEE.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN LCFEE.FECACT TEXT IS 'Fecha Actualiza';

--======================================================================
-- Índices
--======================================================================
-- Índice sobre fecha de ingreso.
-- Justificación: ordenamiento y filtrado cronológico de comisiones.
CREATE INDEX IX_LCFEE_FECING ON LCFEE (FECING);
