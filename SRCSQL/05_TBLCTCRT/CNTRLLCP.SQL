--======================================================================
-- Nombre de la Tabla : CNTRLLCP - CONTROL_CARTAS_CREDI
--
-- DESCRIPCIÓN:
-- Archivo de Control de Cartas de Crédito. Registra parámetros de control
-- por banco y configuración de cartas.
--
-- Objetivo:
-- Mantener los parámetros de control para cartas de crédito.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Configuración del módulo de cartas de crédito.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Consulta y control de parámetros de proceso.
--
-- Restricciones:
-- PK sobre banco y parámetro.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-19
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CNTRLLCP (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    LCR_PARAMETRO FOR COLUMN LCRPARM VARCHAR(20)
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

    CONSTRAINT CNTRLLCP_PK PRIMARY KEY (CODBCO, LCRPARM),

    CONSTRAINT CNTRLLCP_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCNTRLLCP;

RENAME TABLE CNTRLLCP
TO CONTROL_CARTAS_CREDI
FOR SYSTEM NAME CNTRLLCP;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CNTRLLCP IS
'CONTROL_CARTAS_CREDI';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CNTRLLCP.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN CNTRLLCP.LCRPARM IS
'Parámetro de control de carta de crédito.';

COMMENT ON COLUMN CNTRLLCP.FECEMI IS
'Fecha de emisión.';

COMMENT ON COLUMN CNTRLLCP.FECVEN IS
'Fecha de vencimiento.';

COMMENT ON COLUMN CNTRLLCP.MNTORI IS
'Monto original de la operación.';

COMMENT ON COLUMN CNTRLLCP.SLDACT IS
'Saldo actual de la operación.';

COMMENT ON COLUMN CNTRLLCP.BCOCRR IS
'Banco corresponsal.';

COMMENT ON COLUMN CNTRLLCP.PAIDST IS
'País de destino.';

COMMENT ON COLUMN CNTRLLCP.ESTCAR IS
'Estado de la carta.';

COMMENT ON COLUMN CNTRLLCP.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN CNTRLLCP.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN CNTRLLCP.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN CNTRLLCP.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN CNTRLLCP.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN CNTRLLCP.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN CNTRLLCP.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CNTRLLCP IS 'CONTROL_CARTAS_CREDI';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CNTRLLCP.CODBCO IS 'Código Banco';
LABEL ON COLUMN CNTRLLCP.LCRPARM IS 'Parámetro';
LABEL ON COLUMN CNTRLLCP.FECEMI IS 'Fecha Emisión';
LABEL ON COLUMN CNTRLLCP.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN CNTRLLCP.MNTORI IS 'Monto Original';
LABEL ON COLUMN CNTRLLCP.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN CNTRLLCP.BCOCRR IS 'Banco Corresponsal';
LABEL ON COLUMN CNTRLLCP.PAIDST IS 'País Destino';
LABEL ON COLUMN CNTRLLCP.ESTCAR IS 'Estado Carta';
LABEL ON COLUMN CNTRLLCP.VERREG IS 'Versión Registro';
LABEL ON COLUMN CNTRLLCP.OBSREG IS 'Observaciones';
LABEL ON COLUMN CNTRLLCP.ESTREG IS 'Estado Registro';
LABEL ON COLUMN CNTRLLCP.USRING IS 'Usuario Creación';
LABEL ON COLUMN CNTRLLCP.FECING IS 'Fecha Creación';
LABEL ON COLUMN CNTRLLCP.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLLCP.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CNTRLLCP.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN CNTRLLCP.LCRPARM TEXT IS 'Parámetro';
LABEL ON COLUMN CNTRLLCP.FECEMI TEXT IS 'Fecha Emisión';
LABEL ON COLUMN CNTRLLCP.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN CNTRLLCP.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN CNTRLLCP.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN CNTRLLCP.BCOCRR TEXT IS 'Banco Corresponsal';
LABEL ON COLUMN CNTRLLCP.PAIDST TEXT IS 'País Destino';
LABEL ON COLUMN CNTRLLCP.ESTCAR TEXT IS 'Estado Carta';
LABEL ON COLUMN CNTRLLCP.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN CNTRLLCP.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN CNTRLLCP.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN CNTRLLCP.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN CNTRLLCP.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN CNTRLLCP.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLLCP.FECACT TEXT IS 'Fecha Actualiza';
