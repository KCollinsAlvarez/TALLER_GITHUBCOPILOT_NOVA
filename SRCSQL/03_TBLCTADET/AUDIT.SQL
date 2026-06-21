--======================================================================
-- Nombre de la Tabla : AUDIT - DET_DIARIO_TRANS_CAJ
--
-- DESCRIPCIÓN:
-- Detalle diario de transacciones de caja. Registra los movimientos
-- de caja por banco, sucursal, cajero y moneda.
--
-- Objetivo:
-- Documentar y auditar las transacciones diarias de caja.
--
-- Tipo de Tabla:
-- Detalle diario.
--
-- Origen de los Datos:
-- Operaciones de caja en sucursales.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Auditoría, conciliación y reporte de operaciones de caja.
--
-- Restricciones:
-- PK sobre banco, sucursal, cajero, moneda y referencia.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-17
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE AUDIT (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    CODIGO_SUCURSAL FOR COLUMN CODSUC VARCHAR(20)
                        NOT NULL,

    CODIGO_CAJERO FOR COLUMN CODCAJ VARCHAR(20)
                       NOT NULL,

    CODIGO_MONEDA FOR COLUMN CODMON VARCHAR(20)
                       NOT NULL,

    NUM_REFERENCIA FOR COLUMN NUMREF VARCHAR(50)
                      NOT NULL,

    FECHA_APERTURA FOR COLUMN FECAPR DATE
                        NOT NULL DEFAULT '0001-01-01',

    FEC_ULTIMA_TRANS FOR COLUMN FECULTTRN DATE
                        NOT NULL DEFAULT '0001-01-01',

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                     NOT NULL DEFAULT 0,

    SALDO_DISPONIBLE FOR COLUMN SLDDSP DECIMAL(18, 2)
                         NOT NULL DEFAULT 0,

    LIMITE_SOBREGIRO FOR COLUMN LIMSBR DECIMAL(18, 2)
                         NOT NULL DEFAULT 0,

    ESTADO_CUENTA FOR COLUMN ESTCTA VARCHAR(20)
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

    CONSTRAINT AUDIT_PK PRIMARY KEY 
    (CODBCO, CODSUC, CODCAJ, CODMON, NUMREF),

    CONSTRAINT AUDIT_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RAUDIT;

RENAME TABLE AUDIT
TO DET_DIARIO_TRANS_CAJ
FOR SYSTEM NAME AUDIT;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE AUDIT IS
'DET_DIARIO_TRANS_CAJ';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN AUDIT.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN AUDIT.CODSUC IS
'Código de la sucursal.';

COMMENT ON COLUMN AUDIT.CODCAJ IS
'Código del cajero.';

COMMENT ON COLUMN AUDIT.CODMON IS
'Código de la moneda.';

COMMENT ON COLUMN AUDIT.NUMREF IS
'Referencia de la transacción de caja.';

COMMENT ON COLUMN AUDIT.FECAPR IS
'Fecha de apertura del registro.';

COMMENT ON COLUMN AUDIT.FECULTTRN IS
'Fecha de la última transacción registrada.';

COMMENT ON COLUMN AUDIT.SLDACT IS
'Saldo actual de la operación.';

COMMENT ON COLUMN AUDIT.SLDDSP IS
'Saldo disponible de la operación.';

COMMENT ON COLUMN AUDIT.LIMSBR IS
'Límite de sobregiro de la operación.';

COMMENT ON COLUMN AUDIT.ESTCTA IS
'Estado de cuenta para la transacción.';

COMMENT ON COLUMN AUDIT.VERREG IS
'Ve rsión del registro para control de cambios.';

COMMENT ON COLUMN AUDIT.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN AUDIT.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN AUDIT.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN AUDIT.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN AUDIT.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN AUDIT.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE AUDIT IS 'DET_DIARIO_TRANS_CAJ';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN AUDIT.CODBCO IS 'Código Banco';
LABEL ON COLUMN AUDIT.CODSUC IS 'Código Sucursal';
LABEL ON COLUMN AUDIT.CODCAJ IS 'Código Cajero';
LABEL ON COLUMN AUDIT.CODMON IS 'Código Moneda';
LABEL ON COLUMN AUDIT.NUMREF IS 'Referencia';
LABEL ON COLUMN AUDIT.FECAPR IS 'Fecha Apertura';
LABEL ON COLUMN AUDIT.FECULTTRN IS 'Fecha Última Transacción';
LABEL ON COLUMN AUDIT.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN AUDIT.SLDDSP IS 'Saldo Disponible';
LABEL ON COLUMN AUDIT.LIMSBR IS 'Límite Sobregiro';
LABEL ON COLUMN AUDIT.ESTCTA IS 'Estado Cuenta';
LABEL ON COLUMN AUDIT.VERREG IS 'Versión Registro';
LABEL ON COLUMN AUDIT.OBSREG IS 'Observaciones';
LABEL ON COLUMN AUDIT.ESTREG IS 'Estado Registro';
LABEL ON COLUMN AUDIT.USRING IS 'Usuario Creación';
LABEL ON COLUMN AUDIT.FECING IS 'Fecha Creación';
LABEL ON COLUMN AUDIT.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN AUDIT.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN AUDIT.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN AUDIT.CODSUC TEXT IS 'Código Sucursal';
LABEL ON COLUMN AUDIT.CODCAJ TEXT IS 'Código Cajero';
LABEL ON COLUMN AUDIT.CODMON TEXT IS 'Código Moneda';
LABEL ON COLUMN AUDIT.NUMREF TEXT IS 'Referencia';
LABEL ON COLUMN AUDIT.FECAPR TEXT IS 'Fecha Apertura';
LABEL ON COLUMN AUDIT.FECULTTRN TEXT IS 'Fecha Última Transacción';
LABEL ON COLUMN AUDIT.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN AUDIT.SLDDSP TEXT IS 'Saldo Disponible';
LABEL ON COLUMN AUDIT.LIMSBR TEXT IS 'Límite Sobregiro';
LABEL ON COLUMN AUDIT.ESTCTA TEXT IS 'Estado Cuenta';
LABEL ON COLUMN AUDIT.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN AUDIT.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN AUDIT.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN AUDIT.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN AUDIT.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN AUDIT.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN AUDIT.FECACT TEXT IS 'Fecha Actualiza';