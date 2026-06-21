--======================================================================
-- Nombre de la Tabla : OFMST - CHEQ_CERTIF_GERENCIA
--
-- DESCRIPCIÓN:
-- Maestro de Cheques Certificados y Cheques de Gerencia. Registra
-- los cheques certificados y de gerencia emitidos con información
-- de saldos y estado.
--
-- Objetivo:
-- Centralizar el registro de cheques especiales para control de
-- emisión y seguimiento.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Emisión de cheques certificados y de gerencia.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte para reportes de cheques especiales y conciliación.
--
-- Restricciones:
-- PK técnica sobre codigo_banco, codigo_sucursal, numero_cheque.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-17
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE OFMST (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    CODIGO_SUCURSAL FOR COLUMN CODSUC VARCHAR(20)
                        NOT NULL,

    NUMERO_CHEQUE FOR COLUMN NUMCHQ VARCHAR(30)
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

    CONSTRAINT OFMST_PK PRIMARY KEY (CODBCO, CODSUC, NUMCHQ),

    CONSTRAINT OFMST_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT ROFMST;

RENAME TABLE OFMST
TO CHEQ_CERTIF_GERENCIA
FOR SYSTEM NAME OFMST;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE OFMST IS
'CHEQ_CERTIF_GERENCIA';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN OFMST.CODBCO IS
'Código del banco emisor.';

COMMENT ON COLUMN OFMST.CODSUC IS
'Código de la sucursal emisora.';

COMMENT ON COLUMN OFMST.NUMCHQ IS
'Número del cheque certificado o de gerencia.';

COMMENT ON COLUMN OFMST.FECAPR IS
'Fecha de apertura del cheque.';

COMMENT ON COLUMN OFMST.FECULTTRN IS
'Fecha de la última transacción del cheque.';

COMMENT ON COLUMN OFMST.SLDACT IS
'Saldo actual del cheque.';

COMMENT ON COLUMN OFMST.SLDDSP IS
'Saldo disponible del cheque.';

COMMENT ON COLUMN OFMST.LIMSBR IS
'Límite de sobregiro del cheque.';

COMMENT ON COLUMN OFMST.ESTCTA IS
'Estado del cheque certificado o de gerencia.';

COMMENT ON COLUMN OFMST.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN OFMST.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN OFMST.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN OFMST.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN OFMST.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN OFMST.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN OFMST.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE OFMST IS 'CHEQ_CERTIF_GERENCIA';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN OFMST.CODBCO IS 'Código Banco';
LABEL ON COLUMN OFMST.CODSUC IS 'Código Sucursal';
LABEL ON COLUMN OFMST.NUMCHQ IS 'Número Cheque';
LABEL ON COLUMN OFMST.FECAPR IS 'Fecha Apertura';
LABEL ON COLUMN OFMST.FECULTTRN IS 'Fecha Última Transacción';
LABEL ON COLUMN OFMST.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN OFMST.SLDDSP IS 'Saldo Disponible';
LABEL ON COLUMN OFMST.LIMSBR IS 'Límite Sobregiro';
LABEL ON COLUMN OFMST.ESTCTA IS 'Estado Cuenta';
LABEL ON COLUMN OFMST.VERREG IS 'Versión Registro';
LABEL ON COLUMN OFMST.OBSREG IS 'Observaciones';
LABEL ON COLUMN OFMST.ESTREG IS 'Estado Registro';
LABEL ON COLUMN OFMST.USRING IS 'Usuario Creación';
LABEL ON COLUMN OFMST.FECING IS 'Fecha Creación';
LABEL ON COLUMN OFMST.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN OFMST.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN OFMST.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN OFMST.CODSUC TEXT IS 'Código Sucursal';
LABEL ON COLUMN OFMST.NUMCHQ TEXT IS 'Número Cheque';
LABEL ON COLUMN OFMST.FECAPR TEXT IS 'Fecha Apertura';
LABEL ON COLUMN OFMST.FECULTTRN TEXT IS 'Fecha Última Transacción';
LABEL ON COLUMN OFMST.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN OFMST.SLDDSP TEXT IS 'Saldo Disponible';
LABEL ON COLUMN OFMST.LIMSBR TEXT IS 'Límite Sobregiro';
LABEL ON COLUMN OFMST.ESTCTA TEXT IS 'Estado Cuenta';
LABEL ON COLUMN OFMST.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN OFMST.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN OFMST.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN OFMST.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN OFMST.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN OFMST.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN OFMST.FECACT TEXT IS 'Fecha Actualiza';