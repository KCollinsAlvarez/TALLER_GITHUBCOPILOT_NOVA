--======================================================================
-- Nombre de la Tabla : CNTRLMSG - MENSAJES_ESTADO_CTA
--
-- DESCRIPCIÓN:
-- Mensajes a ser impresos en estados de cuenta. Controla los textos
-- y mensajes vinculados a los estados de cuenta.
--
-- Objetivo:
-- Mantener el catálogo de mensajes por banco para estados de cuenta.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Parámetros de reporte y comunicación.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte para reportes de estados de cuenta y mensajería.
--
-- Restricciones:
-- PK sobre código de banco.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-19
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CNTRLMSG (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0) NOT NULL,

    FECHA_APERTURA FOR COLUMN FECAPR DATE
                        NOT NULL DEFAULT '0001-01-01',

    FEC_ULTIMA_TRANS FOR COLUMN FECULTTRN DATE
                                NOT NULL DEFAULT '0001-01-01',

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                     NOT NULL DEFAULT 0,

    SALDO_DISPONIBLE FOR COLUMN SLDDIP DECIMAL(18, 2)
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

    CONSTRAINT CNTRLMSG_PK PRIMARY KEY (CODBCO),

    CONSTRAINT CNTRLMSG_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCNTRLMSG;

RENAME TABLE CNTRLMSG
TO MENSAJES_ESTADO_CTA
FOR SYSTEM NAME CNTRLMSG;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CNTRLMSG IS
'MENSAJES_ESTADO_CTA';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CNTRLMSG.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN CNTRLMSG.FECAPR IS
'Fecha de apertura del registro.';

COMMENT ON COLUMN CNTRLMSG.FECULTTRN IS
'Fecha de la última transacción registrada.';

COMMENT ON COLUMN CNTRLMSG.SLDACT IS
'Saldo actual asociado al mensaje.';

COMMENT ON COLUMN CNTRLMSG.SLDDIP IS
'Saldo disponible asociado al mensaje.';

COMMENT ON COLUMN CNTRLMSG.LIMSBR IS
'Límite de sobregiro asociado al mensaje.';

COMMENT ON COLUMN CNTRLMSG.ESTCTA IS
'Estado de cuenta asociado al mensaje.';

COMMENT ON COLUMN CNTRLMSG.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN CNTRLMSG.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN CNTRLMSG.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN CNTRLMSG.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN CNTRLMSG.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN CNTRLMSG.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN CNTRLMSG.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CNTRLMSG IS 'MENSAJES_ESTADO_CTA';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CNTRLMSG.CODBCO IS 'Código Banco';
LABEL ON COLUMN CNTRLMSG.FECAPR IS 'Fecha Apertura';
LABEL ON COLUMN CNTRLMSG.FECULTTRN IS 'Fecha Última Transacción';
LABEL ON COLUMN CNTRLMSG.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN CNTRLMSG.SLDDIP IS 'Saldo Disponible';
LABEL ON COLUMN CNTRLMSG.LIMSBR IS 'Límite Sobregiro';
LABEL ON COLUMN CNTRLMSG.ESTCTA IS 'Estado Cuenta';
LABEL ON COLUMN CNTRLMSG.VERREG IS 'Versión Registro';
LABEL ON COLUMN CNTRLMSG.OBSREG IS 'Observaciones';
LABEL ON COLUMN CNTRLMSG.ESTREG IS 'Estado Registro';
LABEL ON COLUMN CNTRLMSG.USRING IS 'Usuario Creación';
LABEL ON COLUMN CNTRLMSG.FECING IS 'Fecha Creación';
LABEL ON COLUMN CNTRLMSG.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLMSG.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CNTRLMSG.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN CNTRLMSG.FECAPR TEXT IS 'Fecha Apertura';
LABEL ON COLUMN CNTRLMSG.FECULTTRN TEXT IS 'Fecha Última Transacción';
LABEL ON COLUMN CNTRLMSG.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN CNTRLMSG.SLDDIP TEXT IS 'Saldo Disponible';
LABEL ON COLUMN CNTRLMSG.LIMSBR TEXT IS 'Límite Sobregiro';
LABEL ON COLUMN CNTRLMSG.ESTCTA TEXT IS 'Estado Cuenta';
LABEL ON COLUMN CNTRLMSG.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN CNTRLMSG.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN CNTRLMSG.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN CNTRLMSG.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN CNTRLMSG.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN CNTRLMSG.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLMSG.FECACT TEXT IS 'Fecha Actualiza';