--======================================================================
-- Nombre de la Tabla : DLITP - MAESTRO_DEDUCCIONES
--
-- DESCRIPCIÓN:
-- Maestro de deducciones asociadas a planes de crédito. Registra
-- información de deducciones vinculadas a préstamos, incluyendo
-- montos, plazos, tasas de interés y estado operacional de cada
-- deducción en el catálogo corporativo.
--
-- Objetivo:
-- Mantener catálogo centralizado de deducciones para consulta,
-- validación de operaciones y control de deducciones disponibles
-- en planes de pagos.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Definición de productos y políticas de deducciones del banco.
--
-- Permanencia de Datos:
-- Permanente (catálogo).
--
-- Uso de los Datos:
-- Consulta de deducciones, validación de operaciones, reportes
-- de catálogo de deducciones disponibles.
--
-- Restricciones:
-- PK compuesta: numero_prestamo, codigo_deduccion.
-- FK a DEALS (numero_prestamo).
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría de creación únicamente (tabla maestro).
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-09
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE DLITP (

    NUMERO_PRESTAMO FOR COLUMN NUMPRE VARCHAR(30)
                        NOT NULL,

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

    OBSERVACIONES FOR COLUMN OBSREG VARCHAR(120)
                     NOT NULL DEFAULT '',

    ESTADO_REGISTRO FOR COLUMN ESTREG CHAR(1)
                       NOT NULL DEFAULT 'A',

    USUARIO_INGRESO FOR COLUMN USRING CHAR(18)
                       NOT NULL DEFAULT USER,

    FECHA_INGRESO FOR COLUMN FECING TIMESTAMP
                     NOT NULL WITH DEFAULT,

    CONSTRAINT DLITP_PK PRIMARY KEY (NUMPRE, CODDED),

    CONSTRAINT DLITP_DEALS_FK FOREIGN KEY (NUMPRE)
        REFERENCES DEALS (NUMPRE),

    CONSTRAINT DLITP_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RDLITP;

RENAME TABLE DLITP
TO MAESTRO_DEDUCCIONES
FOR SYSTEM NAME DLITP;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE DLITP IS
'MAESTRO_DEDUCCIONES';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN DLITP.NUMPRE IS
'Identificador único del préstamo.';

COMMENT ON COLUMN DLITP.CODDED IS
'Código único de deducción.';

COMMENT ON COLUMN DLITP.FECDES IS
'Fecha de desembolso de la deducción.';

COMMENT ON COLUMN DLITP.FECVEN IS
'Fecha de vencimiento de la deducción.';

COMMENT ON COLUMN DLITP.MNTORI IS
'Monto original desembolsado de la deducción.';

COMMENT ON COLUMN DLITP.SLDACT IS
'Saldo actual pendiente de la deducción.';

COMMENT ON COLUMN DLITP.TASINT IS
'Tasa de interés aplicada a la deducción.';

COMMENT ON COLUMN DLITP.PLZMES IS
'Plazo en meses para pago de la deducción.';

COMMENT ON COLUMN DLITP.DIAMOR IS
'Número de días en mora de la deducción.';

COMMENT ON COLUMN DLITP.ESTOPE IS
'Estado operacional de la deducción.';

COMMENT ON COLUMN DLITP.OBSREG IS
'Observaciones adicionales de la deducción.';

COMMENT ON COLUMN DLITP.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN DLITP.USRING IS
'Usuario que creó el registro maestro.';

COMMENT ON COLUMN DLITP.FECING IS
'Fecha y hora de creación del registro maestro.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE DLITP IS 'MAESTRO_DEDUCCIONES';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN DLITP.NUMPRE IS 'Número Préstamo';
LABEL ON COLUMN DLITP.CODDED IS 'Código Deducción';
LABEL ON COLUMN DLITP.FECDES IS 'Fecha Desembolso';
LABEL ON COLUMN DLITP.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN DLITP.MNTORI IS 'Monto Original';
LABEL ON COLUMN DLITP.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN DLITP.TASINT IS 'Tasa Interés';
LABEL ON COLUMN DLITP.PLZMES IS 'Plazo Meses';
LABEL ON COLUMN DLITP.DIAMOR IS 'Días Mora';
LABEL ON COLUMN DLITP.ESTOPE IS 'Estado Operación';
LABEL ON COLUMN DLITP.OBSREG IS 'Observaciones';
LABEL ON COLUMN DLITP.ESTREG IS 'Estado Registro';
LABEL ON COLUMN DLITP.USRING IS 'Usuario Creación';
LABEL ON COLUMN DLITP.FECING IS 'Fecha Creación';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN DLITP.NUMPRE TEXT IS 'Número Préstamo';
LABEL ON COLUMN DLITP.CODDED TEXT IS 'Código Deducción';
LABEL ON COLUMN DLITP.FECDES TEXT IS 'Fecha Desembolso';
LABEL ON COLUMN DLITP.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN DLITP.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN DLITP.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN DLITP.TASINT TEXT IS 'Tasa Interés';
LABEL ON COLUMN DLITP.PLZMES TEXT IS 'Plazo Meses';
LABEL ON COLUMN DLITP.DIAMOR TEXT IS 'Días Mora';
LABEL ON COLUMN DLITP.ESTOPE TEXT IS 'Estado Operación';
LABEL ON COLUMN DLITP.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN DLITP.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN DLITP.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN DLITP.FECING TEXT IS 'Fecha Creación';
