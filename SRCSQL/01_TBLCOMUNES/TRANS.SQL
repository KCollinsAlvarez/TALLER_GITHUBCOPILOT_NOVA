--======================================================================
-- Nombre de la Tabla : TRANS - TRANSACCIONES_HIST
--
-- DESCRIPCIÓN:
-- Archivo histórico de transacciones. Registra todas las
-- transacciones procesadas en el banco, incluyendo información
-- de operación, montos, saldos, canales de origen, cuentas
-- contables y referencias externas para auditoría integral.
--
-- Objetivo:
-- Centralizar el registro completo de transacciones como base
-- para auditoría, conciliación y análisis de movimientos.
--
-- Tipo de Tabla:
-- Transaccional (Histórico de alto volumen).
--
-- Origen de los Datos:
-- Todas las operaciones transaccionales del banco.
--
-- Permanencia de Datos:
-- Permanente (histórico).
--
-- Uso de los Datos:
-- Base para auditoría, conciliación, reportes y análisis
-- transaccional de múltiples perspectivas.
--
-- Restricciones:
-- PK simple: id_transaccion.
-- FKs múltiples a GLMST (cuenta contable), ACMST (cuenta),
--   CUMST (cliente).
-- ESTADO_REGISTRO solo acepta A o I.
-- DEBITO_CREDITO solo acepta D o C.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-06
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE TRANS (

    ID_TRANSACCION FOR COLUMN IDETRN BIGINT
            NOT NULL GENERATED ALWAYS AS IDENTITY,

    NUM_REG_RELATIVO FOR COLUMN NUMREGRLT VARCHAR(30)
                                 NOT NULL DEFAULT '',

    CODIGO_BANCO FOR COLUMN CODBCO SMALLINT
                    NOT NULL DEFAULT 1,

    CODIGO_SUCURSAL FOR COLUMN CODSUC VARCHAR(20)
                       NOT NULL DEFAULT '',

    CODIGO_MONEDA FOR COLUMN CODMON CHAR(3)
                     NOT NULL DEFAULT '',

    CUENTA_CONTABLE FOR COLUMN CTACNT VARCHAR(24)
                       NOT NULL DEFAULT '',

    NUMERO_CUENTA FOR COLUMN NUMCTA VARCHAR(24)
                      NOT NULL DEFAULT '',

    NUM_CLIENTE FOR COLUMN NUMCLI VARCHAR(30)
                  NOT NULL DEFAULT '',

    FECHA_OPERACION FOR COLUMN FECOPE DATE
                       NOT NULL DEFAULT '0001-01-01',

    FECHA_VALOR FOR COLUMN FECVAL DATE
                   NOT NULL DEFAULT '0001-01-01',

    HORA_OPERACION FOR COLUMN HOROPE TIME
                      NOT NULL WITH DEFAULT,

    TIPO_MOVIMIENTO FOR COLUMN TIPMOV VARCHAR(20)
                       NOT NULL DEFAULT '',

    DEBITO_CREDITO FOR COLUMN DEBCRT CHAR(1)
                      NOT NULL DEFAULT ' ',

    MONTO_TRNSACCION FOR COLUMN MNTTRN DECIMAL(18, 2)
              NOT NULL DEFAULT 0,

    SALDO_ANTERIOR FOR COLUMN SLDANT DECIMAL(18, 2)
                      NOT NULL DEFAULT 0,

    SALDO_POSTERIOR FOR COLUMN SLDPOS DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    CANAL_ORIGEN FOR COLUMN CNLORI VARCHAR(20)
                     NOT NULL DEFAULT '',

    TERMINAL_ORIGEN FOR COLUMN TERORG VARCHAR(30)
                       NOT NULL DEFAULT '',

    REFERENCIA_EXTERNA FOR COLUMN REFEXT VARCHAR(40)
                          NOT NULL DEFAULT '',

    ESTADO_TRANSACCION FOR COLUMN ESTTRN VARCHAR(20)
                          NOT NULL DEFAULT '',

    OBSERVACIONES FOR COLUMN OBSREG VARCHAR(120)
                      NOT NULL DEFAULT '',

    VERSION_REGISTRO FOR COLUMN VERREG INTEGER
                         NOT NULL DEFAULT 1,

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

    CONSTRAINT TRANS_PK PRIMARY KEY (IDETRN),

    CONSTRAINT FK_TRANS_GLMST FOREIGN KEY (CTACNT)
        REFERENCES GLMST (CTACNT),

    CONSTRAINT FK_TRANS_ACMST FOREIGN KEY (NUMCTA)
        REFERENCES ACMST (NUMCTA),

    CONSTRAINT FK_TRANS_CUMST FOREIGN KEY (NUMCLI)
        REFERENCES CUMST (NUMCLI),

    CONSTRAINT TRANS_ESTREG_CST CHECK (ESTREG IN ('A', 'I')),
    CONSTRAINT TRANS_DEBCRT_CST CHECK (DEBCRT IN ('D', 'C'))

) RCDFMT RTRANS;

RENAME TABLE TRANS
TO TRANSACCIONES_HIST
FOR SYSTEM NAME TRANS;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE TRANS IS
'TRANSACCIONES_HIST';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN TRANS.IDETRN IS
'Identificador único de transacción.';

COMMENT ON COLUMN TRANS.NUMREGRLT IS
'Número de registro relativo de la transacción.';

COMMENT ON COLUMN TRANS.CODBCO IS
'Código del banco que procesa la transacción.';

COMMENT ON COLUMN TRANS.CODSUC IS
'Código de la sucursal originaria.';

COMMENT ON COLUMN TRANS.CODMON IS
'Código de moneda de la transacción.';

COMMENT ON COLUMN TRANS.CTACNT IS
'Cuenta contable afectada por la transacción.';

COMMENT ON COLUMN TRANS.NUMCTA IS
'Número de cuenta de detalle.';

COMMENT ON COLUMN TRANS.NUMCLI IS
'Identificador del cliente de la transacción.';

COMMENT ON COLUMN TRANS.FECOPE IS
'Fecha de operación de la transacción.';

COMMENT ON COLUMN TRANS.FECVAL IS
'Fecha de valor para cálculo de intereses.';

COMMENT ON COLUMN TRANS.HOROPE IS
'Hora exacta de operación.';

COMMENT ON COLUMN TRANS.TIPMOV IS
'Tipo de movimiento realizado.';

COMMENT ON COLUMN TRANS.DEBCRT IS
'Indicador: D=Débito, C=Crédito.';

COMMENT ON COLUMN TRANS.MNTTRN IS
'Monto de la transacción.';

COMMENT ON COLUMN TRANS.SLDANT IS
'Saldo anterior a la transacción.';

COMMENT ON COLUMN TRANS.SLDPOS IS
'Saldo posterior a la transacción.';

COMMENT ON COLUMN TRANS.CNLORI IS
'Canal de origen de la transacción.';

COMMENT ON COLUMN TRANS.TERORG IS
'Terminal desde la cual se originó.';

COMMENT ON COLUMN TRANS.REFEXT IS
'Referencia externa de la transacción.';

COMMENT ON COLUMN TRANS.ESTTRN IS
'Estado actual de la transacción.';

COMMENT ON COLUMN TRANS.OBSREG IS
'Observaciones adicionales de la transacción.';

COMMENT ON COLUMN TRANS.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN TRANS.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN TRANS.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN TRANS.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN TRANS.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN TRANS.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE TRANS IS 'TRANSACCIONES_HIST';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN TRANS.IDETRN  IS 'ID Transacción';
LABEL ON COLUMN TRANS.NUMREGRLT  IS 'Número Registro Rel.';
LABEL ON COLUMN TRANS.CODBCO   IS 'Código Banco';
LABEL ON COLUMN TRANS.CODSUC   IS 'Código Sucursal';
LABEL ON COLUMN TRANS.CODMON   IS 'Código Moneda';
LABEL ON COLUMN TRANS.CTACNT   IS 'Cuenta Contable';
LABEL ON COLUMN TRANS.NUMCTA   IS 'Número Cuenta';
LABEL ON COLUMN TRANS.NUMCLI   IS 'ID Cliente';
LABEL ON COLUMN TRANS.FECOPE   IS 'Fecha Operación';
LABEL ON COLUMN TRANS.FECVAL   IS 'Fecha Valor';
LABEL ON COLUMN TRANS.HOROPE   IS 'Hora Operación';
LABEL ON COLUMN TRANS.TIPMOV   IS 'Tipo Movimiento';
LABEL ON COLUMN TRANS.DEBCRT   IS 'Débito/Crédito';
LABEL ON COLUMN TRANS.MNTTRN    IS 'Monto';
LABEL ON COLUMN TRANS.SLDANT   IS 'Saldo Anterior';
LABEL ON COLUMN TRANS.SLDPOS   IS 'Saldo Posterior';
LABEL ON COLUMN TRANS.CNLORI   IS 'Canal Origen';
LABEL ON COLUMN TRANS.TERORG   IS 'Terminal Origen';
LABEL ON COLUMN TRANS.REFEXT   IS 'Referencia Externa';
LABEL ON COLUMN TRANS.ESTTRN   IS 'Estado Transacción';
LABEL ON COLUMN TRANS.OBSREG   IS 'Observaciones';
LABEL ON COLUMN TRANS.VERREG   IS 'Versión Registro';
LABEL ON COLUMN TRANS.ESTREG   IS 'Estado Registro';
LABEL ON COLUMN TRANS.USRING   IS 'Usuario Creación';
LABEL ON COLUMN TRANS.FECING   IS 'Fecha Creación';
LABEL ON COLUMN TRANS.USRACT   IS 'Usuario Actualiz.';
LABEL ON COLUMN TRANS.FECACT   IS 'Fecha Actualiz.';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN TRANS.IDETRN  TEXT IS 'ID Transacción';
LABEL ON COLUMN TRANS.NUMREGRLT  TEXT IS 'Número Registro Rel.';
LABEL ON COLUMN TRANS.CODBCO   TEXT IS 'Código Banco';
LABEL ON COLUMN TRANS.CODSUC   TEXT IS 'Código Sucursal';
LABEL ON COLUMN TRANS.CODMON   TEXT IS 'Código Moneda';
LABEL ON COLUMN TRANS.CTACNT   TEXT IS 'Cuenta Contable';
LABEL ON COLUMN TRANS.NUMCTA   TEXT IS 'Número Cuenta';
LABEL ON COLUMN TRANS.NUMCLI   TEXT IS 'ID Cliente';
LABEL ON COLUMN TRANS.FECOPE   TEXT IS 'Fecha Operación';
LABEL ON COLUMN TRANS.FECVAL   TEXT IS 'Fecha Valor';
LABEL ON COLUMN TRANS.HOROPE   TEXT IS 'Hora Operación';
LABEL ON COLUMN TRANS.TIPMOV   TEXT IS 'Tipo Movimiento';
LABEL ON COLUMN TRANS.DEBCRT   TEXT IS 'Débito/Crédito';
LABEL ON COLUMN TRANS.MNTTRN    TEXT IS 'Monto';
LABEL ON COLUMN TRANS.SLDANT   TEXT IS 'Saldo Anterior';
LABEL ON COLUMN TRANS.SLDPOS   TEXT IS 'Saldo Posterior';
LABEL ON COLUMN TRANS.CNLORI   TEXT IS 'Canal Origen';
LABEL ON COLUMN TRANS.TERORG   TEXT IS 'Terminal Origen';
LABEL ON COLUMN TRANS.REFEXT   TEXT IS 'Referencia Externa';
LABEL ON COLUMN TRANS.ESTTRN   TEXT IS 'Estado Transacción';
LABEL ON COLUMN TRANS.OBSREG   TEXT IS 'Observaciones';
LABEL ON COLUMN TRANS.VERREG   TEXT IS 'Versión Registro';
LABEL ON COLUMN TRANS.ESTREG   TEXT IS 'Estado Registro';
LABEL ON COLUMN TRANS.USRING   TEXT IS 'Usuario Creación';
LABEL ON COLUMN TRANS.FECING   TEXT IS 'Fecha Creación';
LABEL ON COLUMN TRANS.USRACT   TEXT IS 'Usuario Actualiz.';
LABEL ON COLUMN TRANS.FECACT   TEXT IS 'Fecha Actualiz.';

--======================================================================
-- Índices
--======================================================================
-- Índice sobre numero_registro_relativo.
-- Justificación: campo único de negocio, búsquedas frecuentes
-- para recuperar transacciones por identificador relativo.
CREATE INDEX IX_TRANS_NUMREGRLT ON TRANS (NUMREGRLT);