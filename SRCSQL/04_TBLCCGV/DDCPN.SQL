--======================================================================
-- Nombre de la Tabla : DDCPN - TRANSACCIONES_COBRO
--
-- DESCRIPCIÓN:
-- Registro de transacciones pendientes de cobro. Mantiene información
-- de operaciones de crédito en estado de cobranza, incluyendo montos,
-- plazos, tasas de interés, estado operacional y datos de morosidad
-- para seguimiento y control de cartera pendiente.
--
-- Objetivo:
-- Centralizar el control de transacciones pendientes de cobro como
-- base para gestión de cartera, análisis de morosidad y reportes
-- de cobranza integral.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Operaciones de crédito pendientes de liquidación del banco.
--
-- Permanencia de Datos:
-- Permanente (histórico de pendientes).
--
-- Uso de los Datos:
-- Gestión de cartera de cobranza, análisis de morosidad, reportes
-- de estado de pendientes y seguimiento de transacciones.
--
-- Restricciones:
-- PK simple: numero_prestamo.
-- FK a DEALS (numero_prestamo).
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría completa en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-09
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE DDCPN (

    NUMERO_PRESTAMO FOR COLUMN NUMPRE VARCHAR(30)
                        NOT NULL,

    FECHA_DESEMBOLSO FOR COLUMN FECDES DATE
                        NOT NULL DEFAULT '0001-01-01',

    FECHA_VENCIMIENTO FOR COLUMN FECVEN DATE
                         NOT NULL DEFAULT '0001-01-01',

    MONTO_ORIGINAL FOR COLUMN MNTORI DECIMAL(18, 2)
                      NOT NULL DEFAULT 0,

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                    NOT NULL DEFAULT 0,

    TASA_INTERES FOR COLUMN TASINT DECIMAL(18, 2)
                    NOT NULL DEFAULT 0,

    PLAZO_MESES FOR COLUMN PLZMES INTEGER
                  NOT NULL DEFAULT 0,

    DIAS_MORA FOR COLUMN DIAMOR INTEGER
                NOT NULL DEFAULT 0,

    ESTADO_OPERACION FOR COLUMN ESTOPE VARCHAR(20)
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

    CONSTRAINT DDCPN_PK PRIMARY KEY (NUMPRE),

    CONSTRAINT DDCPN_DEALS_FK FOREIGN KEY (NUMPRE)
        REFERENCES DEALS (NUMPRE),

    CONSTRAINT DDCPN_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RDDCPN;

RENAME TABLE DDCPN
TO TRANSACCIONES_COBRO
FOR SYSTEM NAME DDCPN;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE DDCPN IS
'TRANSACCIONES_COBRO';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN DDCPN.NUMPRE IS
'Identificador único del préstamo.';

COMMENT ON COLUMN DDCPN.FECDES IS
'Fecha de desembolso de la transacción de crédito.';

COMMENT ON COLUMN DDCPN.FECVEN IS
'Fecha de vencimiento de la obligación de pago.';

COMMENT ON COLUMN DDCPN.MNTORI IS
'Monto original desembolsado de la transacción.';

COMMENT ON COLUMN DDCPN.SLDACT IS
'Saldo actual pendiente de cobro de la transacción.';

COMMENT ON COLUMN DDCPN.TASINT IS
'Tasa de interés aplicada a la transacción pendiente.';

COMMENT ON COLUMN DDCPN.PLZMES IS
'Plazo en meses para cobro de la transacción.';

COMMENT ON COLUMN DDCPN.DIAMOR IS
'Número de días en mora de la transacción pendiente.';

COMMENT ON COLUMN DDCPN.ESTOPE IS
'Estado operacional de la transacción de cobro.';

COMMENT ON COLUMN DDCPN.OBSREG IS
'Observaciones adicionales de la transacción pendiente.';

COMMENT ON COLUMN DDCPN.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN DDCPN.USRING IS
'Usuario que creó el registro de transacción pendiente.';

COMMENT ON COLUMN DDCPN.FECING IS
'Fecha y hora de creación del registro de transacción.';

COMMENT ON COLUMN DDCPN.USRACT IS
'Usuario que realizó la última actualización de la transacción.';

COMMENT ON COLUMN DDCPN.FECACT IS
'Fecha y hora de la última actualización de la transacción.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE DDCPN IS 'TRANSACCIONES_COBRO';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN DDCPN.NUMPRE IS 'Número Préstamo';
LABEL ON COLUMN DDCPN.FECDES IS 'Fecha Desembolso';
LABEL ON COLUMN DDCPN.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN DDCPN.MNTORI IS 'Monto Original';
LABEL ON COLUMN DDCPN.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN DDCPN.TASINT IS 'Tasa Interés';
LABEL ON COLUMN DDCPN.PLZMES IS 'Plazo Meses';
LABEL ON COLUMN DDCPN.DIAMOR IS 'Días Mora';
LABEL ON COLUMN DDCPN.ESTOPE IS 'Estado Operación';
LABEL ON COLUMN DDCPN.OBSREG IS 'Observaciones';
LABEL ON COLUMN DDCPN.ESTREG IS 'Estado Registro';
LABEL ON COLUMN DDCPN.USRING IS 'Usuario Creación';
LABEL ON COLUMN DDCPN.FECING IS 'Fecha Creación';
LABEL ON COLUMN DDCPN.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN DDCPN.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN DDCPN.NUMPRE TEXT IS 'Número Préstamo';
LABEL ON COLUMN DDCPN.FECDES TEXT IS 'Fecha Desembolso';
LABEL ON COLUMN DDCPN.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN DDCPN.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN DDCPN.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN DDCPN.TASINT TEXT IS 'Tasa Interés';
LABEL ON COLUMN DDCPN.PLZMES TEXT IS 'Plazo Meses';
LABEL ON COLUMN DDCPN.DIAMOR TEXT IS 'Días Mora';
LABEL ON COLUMN DDCPN.ESTOPE TEXT IS 'Estado Operación';
LABEL ON COLUMN DDCPN.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN DDCPN.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN DDCPN.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN DDCPN.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN DDCPN.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN DDCPN.FECACT TEXT IS 'Fecha Actualiza';
