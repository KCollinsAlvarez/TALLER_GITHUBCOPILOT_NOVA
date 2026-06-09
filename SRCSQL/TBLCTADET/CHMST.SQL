--======================================================================
-- Nombre de la Tabla : CHMST - MAESTRO_CHEQUERAS
--
-- DESCRIPCIÓN:
-- Maestro de Chequeras. Registra el catálogo de chequeras
-- emitidas para cuentas del banco, incluyendo información de
-- banco, sucursal, moneda, cuenta, número inicial de cheque,
-- saldos y disponibilidades.
--
-- Objetivo:
-- Centralizar el catálogo de chequeras como referencia para
-- control de emisión y seguimiento de cheques por cuenta.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Operaciones de emisión y control de chequeras asociadas a
-- cuentas de clientes.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referencia para procesos de control de cheques, cálculo de
-- saldos y validación de cuentas chequeriles.
--
-- Restricciones:
-- PK compuesta: codigo_banco, codigo_sucursal, codigo_moneda,
--   numero_cuenta, cheque_inicial.
-- FK a ACMST.numero_cuenta (referencia a maestro de cuentas).
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-06
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CHMST (

    CODIGO_BANCO FOR COLUMN CODBCO SMALLINT
                     NOT NULL,

    CODIGO_SUCURSAL FOR COLUMN CODSUC VARCHAR(20)
                        NOT NULL,

    CODIGO_MONEDA FOR COLUMN CODMON CHAR(3)
                      NOT NULL,

    NUMERO_CUENTA FOR COLUMN NUMCTA VARCHAR(24)
                      NOT NULL,

    CHEQUE_INICIAL FOR COLUMN CHQINI VARCHAR(50)
                       NOT NULL,

    FECHA_APERTURA FOR COLUMN FECAPR DATE
                       NOT NULL DEFAULT '0001-01-01',

    FECHA_ULTIMA_TRANS FOR COLUMN FECUTLTRN DATE
                            NOT NULL DEFAULT '0001-01-01',

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                    NOT NULL DEFAULT 0,

    SALDO_DISPONIBLE FOR COLUMN SLDDSP DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,

    LIMITE_SOBREGIRO FOR COLUMN LIMSBR DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,

    ESTADO_CUENTA FOR COLUMN ESTCTA VARCHAR(20)
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

    CONSTRAINT CHMST_PK PRIMARY KEY (CODBCO, CODSUC, CODMON, NUMCTA,
        CHQINI),

    CONSTRAINT UK_CHMST_NUMCTA UNIQUE (NUMCTA),

    CONSTRAINT CHMST_ACMST_FK FOREIGN KEY (NUMCTA)
        REFERENCES ACMST (NUMCTA),

    CONSTRAINT CHMST_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCHMST;

RENAME TABLE CHMST
TO MAESTRO_CHEQUERAS
FOR SYSTEM NAME CHMST;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CHMST IS
'MAESTRO_CHEQUERAS';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CHMST.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN CHMST.CODSUC IS
'Código de la sucursal.';

COMMENT ON COLUMN CHMST.CODMON IS
'Código de moneda.';

COMMENT ON COLUMN CHMST.NUMCTA IS
'Número de cuenta.';

COMMENT ON COLUMN CHMST.CHQINI IS
'Número inicial de cheque.';

COMMENT ON COLUMN CHMST.FECAPR IS
'Fecha de apertura de la chequera.';

COMMENT ON COLUMN CHMST.FECUTLTRN IS
'Fecha de la última transacción con la chequera.';

COMMENT ON COLUMN CHMST.SLDACT IS
'Saldo actual de la cuenta con chequera.';

COMMENT ON COLUMN CHMST.SLDDSP IS
'Saldo disponible para operaciones con cheques.';

COMMENT ON COLUMN CHMST.LIMSBR IS
'Límite de sobregiro autorizado para la chequera.';

COMMENT ON COLUMN CHMST.ESTCTA IS
'Estado operativo de la chequera.';

COMMENT ON COLUMN CHMST.OBSREG IS
'Observaciones adicionales de la chequera.';

COMMENT ON COLUMN CHMST.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN CHMST.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN CHMST.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN CHMST.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN CHMST.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN CHMST.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CHMST IS 'MAESTRO_CHEQUERAS';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CHMST.CODBCO  IS 'Código Banco';
LABEL ON COLUMN CHMST.CODSUC  IS 'Código Sucursal';
LABEL ON COLUMN CHMST.CODMON  IS 'Código Moneda';
LABEL ON COLUMN CHMST.NUMCTA  IS 'Número Cuenta';
LABEL ON COLUMN CHMST.CHQINI  IS 'Cheque Inicial';
LABEL ON COLUMN CHMST.FECAPR  IS 'Fecha Apertura';
LABEL ON COLUMN CHMST.FECUTLTRN  IS 'Fecha Ult. Trans.';
LABEL ON COLUMN CHMST.SLDACT  IS 'Saldo Actual';
LABEL ON COLUMN CHMST.SLDDSP  IS 'Saldo Disponible';
LABEL ON COLUMN CHMST.LIMSBR  IS 'Límite Sobregiro';
LABEL ON COLUMN CHMST.ESTCTA  IS 'Estado Cuenta';
LABEL ON COLUMN CHMST.OBSREG  IS 'Observaciones';
LABEL ON COLUMN CHMST.VERREG  IS 'Versión Registro';
LABEL ON COLUMN CHMST.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN CHMST.USRING  IS 'Usuario Creación';
LABEL ON COLUMN CHMST.FECING  IS 'Fecha Creación';
LABEL ON COLUMN CHMST.USRACT  IS 'Usuario Actualiza';
LABEL ON COLUMN CHMST.FECACT  IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CHMST.CODBCO  TEXT IS 'Código Banco';
LABEL ON COLUMN CHMST.CODSUC  TEXT IS 'Código Sucursal';
LABEL ON COLUMN CHMST.CODMON  TEXT IS 'Código Moneda';
LABEL ON COLUMN CHMST.NUMCTA  TEXT IS 'Número Cuenta';
LABEL ON COLUMN CHMST.CHQINI  TEXT IS 'Cheque Inicial';
LABEL ON COLUMN CHMST.FECAPR  TEXT IS 'Fecha Apertura';
LABEL ON COLUMN CHMST.FECUTLTRN  TEXT IS 'Fecha Ult. Trans.';
LABEL ON COLUMN CHMST.SLDACT  TEXT IS 'Saldo Actual';
LABEL ON COLUMN CHMST.SLDDSP  TEXT IS 'Saldo Disponible';
LABEL ON COLUMN CHMST.LIMSBR  TEXT IS 'Límite Sobregiro';
LABEL ON COLUMN CHMST.ESTCTA  TEXT IS 'Estado Cuenta';
LABEL ON COLUMN CHMST.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN CHMST.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN CHMST.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN CHMST.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN CHMST.FECING  TEXT IS 'Fecha Creación';
LABEL ON COLUMN CHMST.USRACT  TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN CHMST.FECACT  TEXT IS 'Fecha Actualiza';