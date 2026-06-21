--======================================================================
-- Nombre de la Tabla : DLSDE - DETALLE_DEDUCCIONES
--
-- DESCRIPCIÓN:
-- Detalle histórico de deducciones asociadas a planes de pagos.
-- Registra información de deducciones, montos, plazos, tasas de
-- interés y estado operacional de cada deducción vinculada a una
-- transacción de crédito.
--
-- Objetivo:
-- Centralizar el registro de deducciones para auditoría, control
-- de vencimientos, cálculo de intereses y análisis de planes de
-- pagos.
--
-- Tipo de Tabla:
-- Transaccional (Histórico).
--
-- Origen de los Datos:
-- Sistema de créditos y planes de pagos del banco.
--
-- Permanencia de Datos:
-- Permanente (histórico).
--
-- Uso de los Datos:
-- Auditoría de deducciones, conciliación de planes, cálculo de
-- intereses, reportes de morosidad y análisis de deudas.
--
-- Restricciones:
-- PK compuesta: numero_prestamo, fecha, tipo_registro, secuencia,
--   codigo_deduccion.
-- FK a DEALS (numero_prestamo).
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-09
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE DLSDE (

    NUMERO_PRESTAMO FOR COLUMN NUMPRE VARCHAR(30)
                        NOT NULL,

    FECHA FOR COLUMN FECVAL DATE NOT NULL,

    TIPO_REGISTRO FOR COLUMN TIPREG VARCHAR(20)
                      NOT NULL,

    NUM_SECUENCIA FOR COLUMN NUMSEC INTEGER NOT NULL,

    CODIGO_DEDUCCION FOR COLUMN CODDED VARCHAR(20)
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

    CONSTRAINT DLSDE_PK PRIMARY KEY (NUMPRE,FECVAL,TIPREG,NUMSEC,CODDED),

    CONSTRAINT DLSDE_DEALS_FK FOREIGN KEY (NUMPRE)
        REFERENCES DEALS (NUMPRE),

    CONSTRAINT DLSDE_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RDLSDE;

RENAME TABLE DLSDE
TO DETALLE_DEDUCCIONES
FOR SYSTEM NAME DLSDE;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE DLSDE IS
'DETALLE_DEDUCCIONES';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN DLSDE.NUMPRE IS
'Identificador único del préstamo. PK compuesta, FK a DEALS.';

COMMENT ON COLUMN DLSDE.FECVAL IS
'Fecha de registro de la deducción. Parte de PK compuesta.';

COMMENT ON COLUMN DLSDE.TIPREG IS
'Tipo de registro de deducción. Parte de PK compuesta.';

COMMENT ON COLUMN DLSDE.NUMSEC IS
'Número secuencial de deducción. Parte de PK compuesta.';

COMMENT ON COLUMN DLSDE.CODDED IS
'Código único de deducción. Parte de PK compuesta.';

COMMENT ON COLUMN DLSDE.FECDES IS
'Fecha de desembolso de la deducción.';

COMMENT ON COLUMN DLSDE.FECVEN IS
'Fecha de vencimiento de la deducción.';

COMMENT ON COLUMN DLSDE.MNTORI IS
'Monto original desembolsado de la deducción.';

COMMENT ON COLUMN DLSDE.SLDACT IS
'Saldo actual pendiente de la deducción.';

COMMENT ON COLUMN DLSDE.TASINT IS
'Tasa de interés aplicada a la deducción.';

COMMENT ON COLUMN DLSDE.PLZMES IS
'Plazo en meses para pago de la deducción.';

COMMENT ON COLUMN DLSDE.DIAMOR IS
'Número de días en mora de la deducción.';

COMMENT ON COLUMN DLSDE.ESTOPE IS
'Estado operacional de la deducción.';

COMMENT ON COLUMN DLSDE.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN DLSDE.OBSREG IS
'Observaciones adicionales de la deducción.';

COMMENT ON COLUMN DLSDE.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN DLSDE.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN DLSDE.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN DLSDE.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN DLSDE.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE DLSDE IS 'DETALLE_DEDUCCIONES';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN DLSDE.NUMPRE IS 'Número Préstamo';
LABEL ON COLUMN DLSDE.FECVAL IS 'Fecha Registro';
LABEL ON COLUMN DLSDE.TIPREG IS 'Tipo Registro';
LABEL ON COLUMN DLSDE.NUMSEC IS 'Secuencia';
LABEL ON COLUMN DLSDE.CODDED IS 'Código Deducción';
LABEL ON COLUMN DLSDE.FECDES IS 'Fecha Desembolso';
LABEL ON COLUMN DLSDE.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN DLSDE.MNTORI IS 'Monto Original';
LABEL ON COLUMN DLSDE.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN DLSDE.TASINT IS 'Tasa Interés';
LABEL ON COLUMN DLSDE.PLZMES IS 'Plazo Meses';
LABEL ON COLUMN DLSDE.DIAMOR IS 'Días Mora';
LABEL ON COLUMN DLSDE.ESTOPE IS 'Estado Operación';
LABEL ON COLUMN DLSDE.VERREG IS 'Versión Registro';
LABEL ON COLUMN DLSDE.OBSREG IS 'Observaciones';
LABEL ON COLUMN DLSDE.ESTREG IS 'Estado Registro';
LABEL ON COLUMN DLSDE.USRING IS 'Usuario Creación';
LABEL ON COLUMN DLSDE.FECING IS 'Fecha Creación';
LABEL ON COLUMN DLSDE.USRACT IS 'Usuario Actualiz.';
LABEL ON COLUMN DLSDE.FECACT IS 'Fecha Actualiz.';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN DLSDE.NUMPRE TEXT IS 'Número Préstamo';
LABEL ON COLUMN DLSDE.FECVAL TEXT IS 'Fecha Registro';
LABEL ON COLUMN DLSDE.TIPREG TEXT IS 'Tipo Registro';
LABEL ON COLUMN DLSDE.NUMSEC TEXT IS 'Secuencia';
LABEL ON COLUMN DLSDE.CODDED TEXT IS 'Código Deducción';
LABEL ON COLUMN DLSDE.FECDES TEXT IS 'Fecha Desembolso';
LABEL ON COLUMN DLSDE.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN DLSDE.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN DLSDE.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN DLSDE.TASINT TEXT IS 'Tasa Interés';
LABEL ON COLUMN DLSDE.PLZMES TEXT IS 'Plazo Meses';
LABEL ON COLUMN DLSDE.DIAMOR TEXT IS 'Días Mora';
LABEL ON COLUMN DLSDE.ESTOPE TEXT IS 'Estado Operación';
LABEL ON COLUMN DLSDE.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN DLSDE.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN DLSDE.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN DLSDE.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN DLSDE.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN DLSDE.USRACT TEXT IS 'Usuario Actualiz.';
LABEL ON COLUMN DLSDE.FECACT TEXT IS 'Fecha Actualiz.';

--======================================================================
-- Índices
--======================================================================
-- Índice sobre fecha de registro.
-- Justificación: búsquedas frecuentes por rango de fechas,
-- conciliaciones diarias, reportes de morosidad por período.
CREATE INDEX DLSDE01 ON DLSDE (FECVAL);
