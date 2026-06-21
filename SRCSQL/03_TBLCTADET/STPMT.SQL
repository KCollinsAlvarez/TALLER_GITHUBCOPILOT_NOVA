--======================================================================
-- Nombre de la Tabla : STPMT - ORDENES_NO_PAGO_CHEQ
--
-- DESCRIPCIÓN:
-- Archivo de Órdenes de No Pago de Cheques. Registra las instrucciones
-- emitidas para bloquear el pago de cheques específicos vinculados a
-- una cuenta de detalle.
--
-- Objetivo:
-- Controlar y gestionar las órdenes de no pago emitidas sobre cheques,
-- permitiendo la trazabilidad por banco, sucursal, moneda, cuenta
-- contable, cuenta y secuencia de la orden.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Sistemas operativos bancarios; módulo de Cuentas de Detalle y
-- Chequeras.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte al proceso de validación de cheques en cámara de
-- compensación; consulta operativa de órdenes vigentes; control
-- de bloqueos por cuenta.
--
-- Restricciones:
-- PK compuesta de 6 campos (clave natural de negocio).
-- FK a ACMST.NUMERO_CUENTA (UNIQUE).
-- ESTADO_REGISTRO solo A o I
-- Campos de auditoría estándar en español aplicados.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-06
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE STPMT (

    CODIGO_BANCO FOR COLUMN CODBCO SMALLINT
                     NOT NULL,

    CODIGO_SUCURSAL FOR COLUMN CODSUC VARCHAR(20)
                        NOT NULL,

    CODIGO_MONEDA FOR COLUMN CODMON CHAR(3)
                      NOT NULL,

    CUENTA_CONTABLE FOR COLUMN CTACON VARCHAR(24)
                        NOT NULL,

    NUMERO_CUENTA FOR COLUMN NUMCTA VARCHAR(24)
                      NOT NULL,

    NUM_SECUENCIA FOR COLUMN NUMSEC INTEGER
                      NOT NULL,

    FECHA_APERTURA FOR COLUMN FECAPE DATE
                       NOT NULL DEFAULT '0001-01-01',

    FECHA_ULT_TRANSAC FOR COLUMN FECULTTRN DATE
                          NOT NULL DEFAULT '0001-01-01',

    SALDO_ACTUAL FOR COLUMN SALACT DECIMAL(18, 2)
                     NOT NULL DEFAULT 0,

    SALDO_DISPONIBLE FOR COLUMN SALDIS DECIMAL(18, 2)
                         NOT NULL DEFAULT 0,

    LIMITE_SOBREGIRO FOR COLUMN LIMSOB DECIMAL(18, 2)
                         NOT NULL DEFAULT 0,

    ESTADO_CUENTA FOR COLUMN ESTCTA CHAR(1)
                      NOT NULL DEFAULT 'A',

    VERSION_REGISTRO FOR COLUMN VERREG INTEGER
                         NOT NULL DEFAULT 1,

    OBSERVACIONES FOR COLUMN OBSREG VARCHAR(120)
                      NOT NULL DEFAULT '',

    ESTADO_REGISTRO FOR COLUMN ESTREG CHAR(20)
                        NOT NULL DEFAULT ' ',

    USUARIO_INGRESO FOR COLUMN USRING CHAR(18)
                        NOT NULL DEFAULT USER,

    FECHA_INGRESO FOR COLUMN FECING TIMESTAMP
                      NOT NULL WITH DEFAULT,

    USUARIO_ACTUALIZA FOR COLUMN USRACT CHAR(18)
                          NOT NULL DEFAULT USER,

    FECHA_ACTUALIZA FOR COLUMN FECACT TIMESTAMP
                        NOT NULL WITH DEFAULT,

    CONSTRAINT STPMT_PK PRIMARY KEY (
        CODBCO,CODSUC,
        CODMON,CTACON,
        NUMCTA,NUMSEC
    ),

    CONSTRAINT STPMT_ACMST_FK FOREIGN KEY (NUMCTA)
        REFERENCES ACMST (NUMCTA),

    CONSTRAINT STPMT_ESTREG_CST CHECK (ESTREG IN ('A','I'))

) RCDFMT RSTPMT;

RENAME TABLE STPMT
TO ORDENES_NO_PAGO_CHQ
FOR SYSTEM NAME STPMT;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE STPMT IS
'ORDENES_NO_PAGO_CHEQ';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN STPMT.CODBCO IS
'Código del banco emisor de la orden de no pago.';

COMMENT ON COLUMN STPMT.CODSUC IS
'Código de la sucursal donde se origina la orden de no pago.';

COMMENT ON COLUMN STPMT.CODMON IS
'Código de la moneda asociada a la cuenta sobre la que recae la
orden.';

COMMENT ON COLUMN STPMT.CTACON IS
'Cuenta contable del plan de cuentas GL vinculada a la cuenta de
detalle objeto de la orden de no pago.';

COMMENT ON COLUMN STPMT.NUMCTA IS
'Número de cuenta de detalle sobre la que se emite la orden de
no pago. FK a ACMST.NUMERO_CUENTA.';

COMMENT ON COLUMN STPMT.NUMSEC IS
'Número de secuencia de la orden de no pago dentro de la cuenta.
Permite múltiples órdenes activas para la misma cuenta.';

COMMENT ON COLUMN STPMT.FECAPE IS
'Fecha de apertura o inicio de vigencia de la orden de no pago.';

COMMENT ON COLUMN STPMT.FECULTTRN IS
'Fecha de la última transacción registrada sobre esta orden.';

COMMENT ON COLUMN STPMT.SALACT IS
'Saldo actual de la cuenta al momento de registrar la orden.';

COMMENT ON COLUMN STPMT.SALDIS IS
'Saldo disponible de la cuenta al momento de registrar la orden.';

COMMENT ON COLUMN STPMT.LIMSOB IS
'Límite de sobregiro autorizado para la cuenta objeto de la
orden.';

COMMENT ON COLUMN STPMT.ESTCTA IS
'Estado de la cuenta asociada.';

COMMENT ON COLUMN STPMT.VERREG IS
'Versión del registro para control de cambios concurrentes.';

COMMENT ON COLUMN STPMT.OBSREG IS
'Observaciones adicionales o notas operativas sobre la orden.';

COMMENT ON COLUMN STPMT.ESTREG IS
'Estado del registro lógico. Valores válidos:
A=Activo, I=Inactivo.';

COMMENT ON COLUMN STPMT.USRING IS
'Usuario del sistema que creó el registro';

COMMENT ON COLUMN STPMT.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN STPMT.USRACT IS
'Usuario del sistema que realizó la última actualización';

COMMENT ON COLUMN STPMT.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE STPMT IS 'ORDENES_NO_PAGO_CHEQ';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN STPMT.CODBCO  IS 'Código Banco';
LABEL ON COLUMN STPMT.CODSUC  IS 'Código Sucursal';
LABEL ON COLUMN STPMT.CODMON  IS 'Código Moneda';
LABEL ON COLUMN STPMT.CTACON  IS 'Cuenta Contable';
LABEL ON COLUMN STPMT.NUMCTA  IS 'Número Cuenta';
LABEL ON COLUMN STPMT.NUMSEC  IS 'Secuencia';
LABEL ON COLUMN STPMT.FECAPE  IS 'Fecha Apertura';
LABEL ON COLUMN STPMT.FECULTTRN  IS 'Última Transacción';
LABEL ON COLUMN STPMT.SALACT  IS 'Saldo Actual';
LABEL ON COLUMN STPMT.SALDIS  IS 'Saldo Disponible';
LABEL ON COLUMN STPMT.LIMSOB  IS 'Límite Sobregiro';
LABEL ON COLUMN STPMT.ESTCTA  IS 'Estado Cuenta';
LABEL ON COLUMN STPMT.VERREG  IS 'Versión Registro';
LABEL ON COLUMN STPMT.OBSREG  IS 'Observaciones';
LABEL ON COLUMN STPMT.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN STPMT.USRING  IS 'Usuario Creación';
LABEL ON COLUMN STPMT.FECING  IS 'Fecha Creación';
LABEL ON COLUMN STPMT.USRACT  IS 'Usuario Actualización';
LABEL ON COLUMN STPMT.FECACT  IS 'Fecha Actualización';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN STPMT.CODBCO  TEXT IS 'Código del Banco';
LABEL ON COLUMN STPMT.CODSUC  TEXT IS 'Código de Sucursal';
LABEL ON COLUMN STPMT.CODMON  TEXT IS 'Código de Moneda';
LABEL ON COLUMN STPMT.CTACON  TEXT IS 'Cuenta Contable GL';
LABEL ON COLUMN STPMT.NUMCTA  TEXT IS 'Número de Cuenta';
LABEL ON COLUMN STPMT.NUMSEC  TEXT IS 'Número de Secuencia';
LABEL ON COLUMN STPMT.FECAPE  TEXT IS 'Fecha de Apertura';
LABEL ON COLUMN STPMT.FECULTTRN  TEXT IS 'Fecha Última Transacción';
LABEL ON COLUMN STPMT.SALACT  TEXT IS 'Saldo Actual';
LABEL ON COLUMN STPMT.SALDIS  TEXT IS 'Saldo Disponible';
LABEL ON COLUMN STPMT.LIMSOB  TEXT IS 'Límite de Sobregiro';
LABEL ON COLUMN STPMT.ESTCTA  TEXT IS 'Estado de la Cuenta';
LABEL ON COLUMN STPMT.VERREG  TEXT IS 'Versión del Registro';
LABEL ON COLUMN STPMT.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN STPMT.ESTREG  TEXT IS 'Estado del Registro';
LABEL ON COLUMN STPMT.USRING  TEXT IS 'Usuario creación';
LABEL ON COLUMN STPMT.FECING  TEXT IS 'Fecha creación';
LABEL ON COLUMN STPMT.USRACT  TEXT IS 'Usuario actualización';
LABEL ON COLUMN STPMT.FECACT  TEXT IS 'Fecha actualización';

--======================================================================
-- Índices
--======================================================================
-- FK sobre ACMST.NUMERO_CUENTA  búsqueda frecuente por cuenta
CREATE INDEX IX_ACMST_NUMCTA ON STPMT (NUMCTA);

-- Búsqueda operativa frecuente por banco y sucursal
CREATE INDEX IX_ACMST_CODBCO_CODSUC  ON STPMT (CODBCO, CODSUC);
