--======================================================================
-- Nombre de la Tabla : TTRAN - TRANSACCIONES_DIA
--
-- DESCRIPCIÓN:
-- Archivo Maestro de Transacciones del día. Registra las transacciones
-- diarias del banco, con referencia al movimiento, cuenta contable,
-- cuenta de detalle y cliente.
--
-- Objetivo:
-- Centralizar el archivo maestro de transacciones diarias para control
-- operativo y conciliación.
--
-- Tipo de Tabla:
-- Maestro transaccional.
--
-- Origen de los Datos:
-- Transacciones del día procesadas por el banco.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Base para la gestión diaria de transacciones y validación de
-- registros contables.
--
-- Restricciones:
-- PK simple: id_transaccion_dia.
-- FKs a TRANS, GLMST, ACMST y CUMST.
-- ESTADO_REGISTRO solo acepta A o I.
-- DEBITO_CREDITO solo acepta D o C.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-17
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE TTRAN (

    ID_TRANSACCION_DIA FOR COLUMN IDNTRNDIA BIGINT
            NOT NULL GENERATED ALWAYS AS IDENTITY,

    NUM_REG_RELATIVO FOR COLUMN NUMREGRLT VARCHAR(30)
                                 NOT NULL DEFAULT ' ',

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                    NOT NULL ,

    CODIGO_SUCURSAL FOR COLUMN CODSUC VARCHAR(20)
                       NOT NULL,

    CODIGO_MONEDA FOR COLUMN CODMON VARCHAR(3)
                     NOT NULL,

    CUENTA_CONTABLE FOR COLUMN CTACNT VARCHAR(24)
                       NOT NULL,

    NUMERO_CUENTA FOR COLUMN NUMCTA VARCHAR(24)
                      NOT NULL,

    NUM_CLIENTE FOR COLUMN NUMCLI VARCHAR(30)
                  NOT NULL,

    FECHA_TRANSACCION FOR COLUMN FECTRN DATE
                       NOT NULL DEFAULT '0001-01-01',

    FECHA_VALOR FOR COLUMN FECVAL DATE
                   NOT NULL DEFAULT '0001-01-01',

    HORA_OPERACION FOR COLUMN HOROPE TIME
                      NOT NULL WITH DEFAULT,

    TIPO_MOVIMIENTO FOR COLUMN TIPMOV VARCHAR(20)
                       NOT NULL DEFAULT '',

    DEBITO_CREDITO FOR COLUMN DEBCRT CHAR(1)
                      NOT NULL DEFAULT ' ',

    MONTO_TRANSACCION FOR COLUMN MNTTRN DECIMAL(18, 2)
              NOT NULL DEFAULT 0,

    SALDO_ANTERIOR FOR COLUMN SLDANT DECIMAL(18, 2)
                      NOT NULL DEFAULT 0,

    SALDO_POSTERIOR FOR COLUMN SLDPOS DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    CANAL_ORIGEN FOR COLUMN CNLORI VARCHAR(20)
                     NOT NULL DEFAULT '',

    TERMINAL_ORIGEN FOR COLUMN TERORI VARCHAR(30)
                       NOT NULL DEFAULT '',

    REFERENCIA_EXTERNA FOR COLUMN REFEXT VARCHAR(40)
                          NOT NULL DEFAULT '',

    ESTADO_TRANSACCION FOR COLUMN ESTTRN VARCHAR(20)
                          NOT NULL DEFAULT '',

    VERSION_REGISTRO FOR COLUMN VERREG INTEGER
                         NOT NULL DEFAULT 1,

    OBSERVACIONES FOR COLUMN OBSREG VARCHAR(120)
                      NOT NULL DEFAULT '',

    ESTADO_REGISTRO FOR COLUMN ESTREG CHAR(1)
                        NOT NULL DEFAULT 'A',

    USUARIO_CREACION FOR COLUMN USRING CHAR(18)
                        NOT NULL DEFAULT USER,

    FECHA_INGRESO FOR COLUMN FECING TIMESTAMP
                      NOT NULL WITH DEFAULT,

    USUARIO_ACTUALIZA FOR COLUMN USRACT CHAR(18)
                          NOT NULL DEFAULT USER,

    FECHA_ACTUALIZA FOR COLUMN FECACT TIMESTAMP
                        NOT NULL WITH DEFAULT,

    CONSTRAINT TTRAN_PK PRIMARY KEY 
    (IDNTRNDIA,CODBCO,CODSUC,CODMON,CTACNT,NUMCTA),

    CONSTRAINT FK_TTRAN_TRANS FOREIGN KEY (NUMREGRLT)
        REFERENCES TRANS (NUMREGRLT),

    CONSTRAINT FK_TTRAN_GLMST FOREIGN KEY (CTACNT)
        REFERENCES GLMST (CTACNT),

    CONSTRAINT FK_TTRAN_ACMST FOREIGN KEY (NUMCTA)
        REFERENCES ACMST (NUMCTA),

    CONSTRAINT FK_TTRAN_CUMST FOREIGN KEY (NUMCLI)
        REFERENCES CUMST (NUMCLI),

    CONSTRAINT TTRAN_ESTREG_CST CHECK (ESTREG IN ('A', 'I')),
    CONSTRAINT TTRAN_DEBCRT_CST CHECK (DEBCRT IN ('D', 'C'))

) RCDFMT RTTRAN;

RENAME TABLE TTRAN
TO TRANSACCIONES_DIA
FOR SYSTEM NAME TTRAN;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE TTRAN IS
'TRANSACCIONES_DIA';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN TTRAN.IDNTRNDIA IS
'Identificador técnico único de la transacción del día.';

COMMENT ON COLUMN TTRAN.NUMREGRLT IS
'Número de registro relativo asociado a la transacción.';

COMMENT ON COLUMN TTRAN.CODBCO IS
'Código del banco de la transacción.';

COMMENT ON COLUMN TTRAN.CODSUC IS
'Código de la sucursal de la transacción.';

COMMENT ON COLUMN TTRAN.CODMON IS
'Código de moneda de la transacción.';

COMMENT ON COLUMN TTRAN.CTACNT IS
'Cuenta contable de la transacción.';

COMMENT ON COLUMN TTRAN.NUMCTA IS
'Número de cuenta de detalle de la transacción.';

COMMENT ON COLUMN TTRAN.NUMCLI IS
'Identificación del cliente asociado.';

COMMENT ON COLUMN TTRAN.FECTRN IS
'Fecha de la transacción.';

COMMENT ON COLUMN TTRAN.FECVAL IS
'Fecha de valor de la transacción.';

COMMENT ON COLUMN TTRAN.HOROPE IS
'Hora de operación.';

COMMENT ON COLUMN TTRAN.TIPMOV IS
'Tipo de movimiento.';

COMMENT ON COLUMN TTRAN.DEBCRT IS
'Indicador de débito/ crédito.';

COMMENT ON COLUMN TTRAN.MNTTRN IS
'Monto de la transacción.';

COMMENT ON COLUMN TTRAN.SLDANT IS
'Saldo anterior a la transacción.';

COMMENT ON COLUMN TTRAN.SLDPOS IS
'Saldo posterior a la transacción.';

COMMENT ON COLUMN TTRAN.CNLORI IS
'Canal de origen de la transacción.';

COMMENT ON COLUMN TTRAN.TERORI IS
'Terminal de origen.';

COMMENT ON COLUMN TTRAN.REFEXT IS
'Referencia externa de la transacción.';

COMMENT ON COLUMN TTRAN.ESTTRN IS
'Estado de la transacción.';

COMMENT ON COLUMN TTRAN.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN TTRAN.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN TTRAN.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN TTRAN.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN TTRAN.FECING IS
'Fecha y hora de creación.';

COMMENT ON COLUMN TTRAN.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN TTRAN.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE TTRAN IS 'TRANSACCIONES_DIA';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN TTRAN.IDNTRNDIA IS 'ID Transacción Día';
LABEL ON COLUMN TTRAN.NUMREGRLT IS 'Número Registro Rel.';
LABEL ON COLUMN TTRAN.CODBCO IS 'Código Banco';
LABEL ON COLUMN TTRAN.CODSUC IS 'Código Sucursal';
LABEL ON COLUMN TTRAN.CODMON IS 'Código Moneda';
LABEL ON COLUMN TTRAN.CTACNT IS 'Cuenta Contable';
LABEL ON COLUMN TTRAN.NUMCTA IS 'Número Cuenta';
LABEL ON COLUMN TTRAN.NUMCLI IS 'ID Cliente';
LABEL ON COLUMN TTRAN.FECTRN IS 'Fecha Transacción';
LABEL ON COLUMN TTRAN.FECVAL IS 'Fecha Valor';
LABEL ON COLUMN TTRAN.HOROPE IS 'Hora Operación';
LABEL ON COLUMN TTRAN.TIPMOV IS 'Tipo Movimiento';
LABEL ON COLUMN TTRAN.DEBCRT IS 'Débito/Crédito';
LABEL ON COLUMN TTRAN.MNTTRN IS 'Monto Transacción';
LABEL ON COLUMN TTRAN.SLDANT IS 'Saldo Anterior';
LABEL ON COLUMN TTRAN.SLDPOS IS 'Saldo Posterior';
LABEL ON COLUMN TTRAN.CNLORI IS 'Canal Origen';
LABEL ON COLUMN TTRAN.TERORI IS 'Terminal Origen';
LABEL ON COLUMN TTRAN.REFEXT IS 'Referencia Externa';
LABEL ON COLUMN TTRAN.ESTTRN IS 'Estado Transacción';
LABEL ON COLUMN TTRAN.VERREG IS 'Versión Registro';
LABEL ON COLUMN TTRAN.OBSREG IS 'Observaciones';
LABEL ON COLUMN TTRAN.ESTREG IS 'Estado Registro';
LABEL ON COLUMN TTRAN.USRING IS 'Usuario Creación';
LABEL ON COLUMN TTRAN.FECING IS 'Fecha Creación';
LABEL ON COLUMN TTRAN.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN TTRAN.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN TTRAN.IDNTRNDIA TEXT IS 'ID Transacción Día';
LABEL ON COLUMN TTRAN.NUMREGRLT TEXT IS 'Número Registro Rel.';
LABEL ON COLUMN TTRAN.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN TTRAN.CODSUC TEXT IS 'Código Sucursal';
LABEL ON COLUMN TTRAN.CODMON TEXT IS 'Código Moneda';
LABEL ON COLUMN TTRAN.CTACNT TEXT IS 'Cuenta Contable';
LABEL ON COLUMN TTRAN.NUMCTA TEXT IS 'Número Cuenta';
LABEL ON COLUMN TTRAN.NUMCLI TEXT IS 'ID Cliente';
LABEL ON COLUMN TTRAN.FECTRN TEXT IS 'Fecha Transacción';
LABEL ON COLUMN TTRAN.FECVAL TEXT IS 'Fecha Valor';
LABEL ON COLUMN TTRAN.HOROPE TEXT IS 'Hora Operación';
LABEL ON COLUMN TTRAN.TIPMOV TEXT IS 'Tipo Movimiento';
LABEL ON COLUMN TTRAN.DEBCRT TEXT IS 'Débito/Crédito';
LABEL ON COLUMN TTRAN.MNTTRN TEXT IS 'Monto Transacción';
LABEL ON COLUMN TTRAN.SLDANT TEXT IS 'Saldo Anterior';
LABEL ON COLUMN TTRAN.SLDPOS TEXT IS 'Saldo Posterior';
LABEL ON COLUMN TTRAN.CNLORI TEXT IS 'Canal Origen';
LABEL ON COLUMN TTRAN.TERORI TEXT IS 'Terminal Origen';
LABEL ON COLUMN TTRAN.REFEXT TEXT IS 'Referencia Externa';
LABEL ON COLUMN TTRAN.ESTTRN TEXT IS 'Estado Transacción';
LABEL ON COLUMN TTRAN.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN TTRAN.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN TTRAN.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN TTRAN.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN TTRAN.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN TTRAN.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN TTRAN.FECACT TEXT IS 'Fecha Actualiza';