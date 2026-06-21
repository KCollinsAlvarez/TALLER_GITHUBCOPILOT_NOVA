--======================================================================
-- Nombre de la Tabla : CNTRLDLS - TASAS_CONTROL_PRESTA
--
-- DESCRIPCIÓN:
-- Tabla de Tasas para control de Préstamos. Registra tasas y parámetros
-- de préstamos por banco, tabla y tipo de producto.
--
-- Objetivo:
-- Mantener el catálogo de tasas aplicado a préstamos y su control.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Definición de políticas crediticias y tarifas.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Cálculo de tasas y evaluación de préstamos.
--
-- Restricciones:
-- PK sobre banco, número de tabla y tipo de producto.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-19
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CNTRLDLS (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    NUMERO_TABLA FOR COLUMN NUMTAB VARCHAR(30)
                      NOT NULL,

    TIPO_PRODUCTO FOR COLUMN TIPPRD VARCHAR(20)
                         NOT NULL,

    FECHA_DESEMBOLSO FOR COLUMN FECDSM DATE
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

    CONSTRAINT CNTRLDLS_PK PRIMARY KEY (CODBCO, NUMTAB, TIPPRD),

    CONSTRAINT CNTRLDLS_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCNTRLDLS;

RENAME TABLE CNTRLDLS
TO TASAS_CONTROL_PRESTA
FOR SYSTEM NAME CNTRLDLS;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CNTRLDLS IS
'TASAS_CONTROL_PRESTA';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CNTRLDLS.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN CNTRLDLS.NUMTAB IS
'Número de tabla de tasas.';

COMMENT ON COLUMN CNTRLDLS.TIPPRD IS
'Tipo de producto.';

COMMENT ON COLUMN CNTRLDLS.FECDSM IS
'Fecha de desembolso.';

COMMENT ON COLUMN CNTRLDLS.FECVEN IS
'Fecha de vencimiento.';

COMMENT ON COLUMN CNTRLDLS.MNTORI IS
'Monto original de la operación.';

COMMENT ON COLUMN CNTRLDLS.SLDACT IS
'Saldo actual de la operación.';

COMMENT ON COLUMN CNTRLDLS.TASINT IS
'Tasa de interés aplicada.';

COMMENT ON COLUMN CNTRLDLS.PLZMES IS
'Plazo en meses de la operación.';

COMMENT ON COLUMN CNTRLDLS.DIAMOR IS
'Días de mora de la operación.';

COMMENT ON COLUMN CNTRLDLS.ESTOPE IS
'Estado de la operación.';

COMMENT ON COLUMN CNTRLDLS.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN CNTRLDLS.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN CNTRLDLS.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN CNTRLDLS.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN CNTRLDLS.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN CNTRLDLS.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN CNTRLDLS.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CNTRLDLS IS 'TASAS_CONTROL_PRESTA';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CNTRLDLS.CODBCO IS 'Código Banco';
LABEL ON COLUMN CNTRLDLS.NUMTAB IS 'Número Tabla';
LABEL ON COLUMN CNTRLDLS.TIPPRD IS 'Tipo Producto';
LABEL ON COLUMN CNTRLDLS.FECDSM IS 'Fecha Desembolso';
LABEL ON COLUMN CNTRLDLS.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN CNTRLDLS.MNTORI IS 'Monto Original';
LABEL ON COLUMN CNTRLDLS.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN CNTRLDLS.TASINT IS 'Tasa Interés';
LABEL ON COLUMN CNTRLDLS.PLZMES IS 'Plazo Meses';
LABEL ON COLUMN CNTRLDLS.DIAMOR IS 'Días Mora';
LABEL ON COLUMN CNTRLDLS.ESTOPE IS 'Estado Operación';
LABEL ON COLUMN CNTRLDLS.VERREG IS 'Versión Registro';
LABEL ON COLUMN CNTRLDLS.OBSREG IS 'Observaciones';
LABEL ON COLUMN CNTRLDLS.ESTREG IS 'Estado Registro';
LABEL ON COLUMN CNTRLDLS.USRING IS 'Usuario Creación';
LABEL ON COLUMN CNTRLDLS.FECING IS 'Fecha Creación';
LABEL ON COLUMN CNTRLDLS.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLDLS.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CNTRLDLS.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN CNTRLDLS.NUMTAB TEXT IS 'Número Tabla';
LABEL ON COLUMN CNTRLDLS.TIPPRD TEXT IS 'Tipo Producto';
LABEL ON COLUMN CNTRLDLS.FECDSM TEXT IS 'Fecha Desembolso';
LABEL ON COLUMN CNTRLDLS.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN CNTRLDLS.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN CNTRLDLS.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN CNTRLDLS.TASINT TEXT IS 'Tasa Interés';
LABEL ON COLUMN CNTRLDLS.PLZMES TEXT IS 'Plazo Meses';
LABEL ON COLUMN CNTRLDLS.DIAMOR TEXT IS 'Días Mora';
LABEL ON COLUMN CNTRLDLS.ESTOPE TEXT IS 'Estado Operación';
LABEL ON COLUMN CNTRLDLS.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN CNTRLDLS.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN CNTRLDLS.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN CNTRLDLS.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN CNTRLDLS.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN CNTRLDLS.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLDLS.FECACT TEXT IS 'Fecha Actualiza';