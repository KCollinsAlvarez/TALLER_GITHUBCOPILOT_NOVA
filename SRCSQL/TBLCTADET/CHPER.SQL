--======================================================================
-- Nombre de la Tabla : CHPER - PERSONALIZ_CHEQUERAS
--
-- DESCRIPCIÓN:
-- Almacena información de personalización y configuración de
-- chequeras asociadas a cuentas de detalle. Incluye datos de
-- control de saldos, límites de sobregiro y estado de chequeras.
--
-- Objetivo:
-- Mantener el control de personalización, estado y saldos de
-- chequeras vinculadas a cuentas corrientes y de ahorro.
--
-- Tipo de Tabla:
-- Transaccional
--
-- Origen de los Datos:
-- Sistema de Gestión de Cuentas (Module de Chequeras)
--
-- Permanencia de Datos:
-- Permanente
--
-- Uso de los Datos:
-- Consultas de estado de chequeras, validación de límites de
-- sobregiro, reportes de saldos y disponibilidad de fondos.
--
-- Restricciones:
-- Relación 1:N con CHMST (Maestro de Chequeras).
-- Clave compuesta por Banco, Sucursal y Número de Cuenta.
-- Estado de cuenta debe ser coherente con CHMST.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-07
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CHPER (
    CODIGO_BANCO FOR COLUMN CODBCO SMALLINT
                        NOT NULL,
    CODIGO_SUCURSAL FOR COLUMN CODSUC VARCHAR(20)
                        NOT NULL,
    NUMERO_CUENTA FOR COLUMN NUMCTA VARCHAR(24)
                        NOT NULL,
    FECHA_APERTURA FOR COLUMN FECAPE DATE
                        NOT NULL DEFAULT '0001-01-01',
    FECHA_ULT_TRANS FOR COLUMN FECUTLTRN DATE
                        NOT NULL DEFAULT '0001-01-01',
    SALDO_ACTUAL FOR COLUMN SALACT DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,
    SALDO_DISPONIBLE FOR COLUMN SALDIS DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,
    LIMITE_SOBREGIRO FOR COLUMN LIMSOB DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,
    ESTADO_CUENTA FOR COLUMN ESTCTA VARCHAR(20)
                        NOT NULL DEFAULT ' ',
    VERSION_REGISTRO FOR COLUMN VEREG INTEGER
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

    CONSTRAINT CHPER_PK PRIMARY KEY (CODBCO, CODSUC, NUMCTA),

    CONSTRAINT CHPER_CHMST_FK FOREIGN KEY (NUMCTA)
        REFERENCES CHMST (NUMCTA),

    CONSTRAINT CHPER_ESTREG_CST CHECK (ESTREG IN ('A','I'))

) RCDFMT RCHPER;

RENAME TABLE CHPER
TO PERSONALIZ_CHEQUERAS
FOR SYSTEM NAME CHPER;

COMMENT ON TABLE CHPER IS
'PERSONALIZ_CHEQUERAS';

--======================================================================
-- Comentarios
--======================================================================
COMMENT ON COLUMN CHPER.CODBCO IS
'Código único del Banco emisor de la chequera.';
COMMENT ON COLUMN CHPER.CODSUC IS
'Código de la Sucursal donde se gestiona la chequera.';
COMMENT ON COLUMN CHPER.NUMCTA IS
'Número único de la cuenta de detalle a la que pertenece
la chequera.';
COMMENT ON COLUMN CHPER.FECAPE IS
'Fecha en la que se abrió o activó la chequera en el sistema.';
COMMENT ON COLUMN CHPER.FECUTLTRN IS
'Fecha de la última transacción registrada para la chequera.';
COMMENT ON COLUMN CHPER.SALACT IS
'Saldo actual disponible en la chequera, expresado en
la moneda de la cuenta.';
COMMENT ON COLUMN CHPER.SALDIS IS
'Saldo disponible para girar considerando los límites
de sobregiro.';
COMMENT ON COLUMN CHPER.LIMSOB IS
'Límite máximo de sobregiro permitido para la chequera.';
COMMENT ON COLUMN CHPER.ESTCTA IS
'Estado actual de la chequera: ACTIVO, INACTIVO,
BLOQUEADO, CANCELADO.';
COMMENT ON COLUMN CHPER.VEREG IS
'Número de versión del registro para control de cambios
y auditoría.';
COMMENT ON COLUMN CHPER.OBSREG IS
'Observaciones o comentarios adicionales relacionados
con la chequera.';
COMMENT ON COLUMN CHPER.ESTREG IS
'Estado del registro en el sistema: A (Activo),
I (Inactivo).';
COMMENT ON COLUMN CHPER.USRING IS
'Identificador del usuario que creó el registro';
COMMENT ON COLUMN CHPER.FECING IS
'Fecha y hora en que se ingresó el registro';
COMMENT ON COLUMN CHPER.USRACT IS
'Identificador del usuario que realizó la última
actualización del registro';
COMMENT ON COLUMN CHPER.FECACT IS
'Fecha y hora de la última actualización del registro';

--======================================================================
-- Labels
--======================================================================
LABEL ON TABLE CHPER IS 'PERSONALIZ_CHEQUERAS';

LABEL ON COLUMN CHPER.CODBCO IS 'Código Banco';
LABEL ON COLUMN CHPER.CODSUC IS 'Código Sucursal';
LABEL ON COLUMN CHPER.NUMCTA IS 'Número Cuenta';
LABEL ON COLUMN CHPER.FECAPE IS 'Fecha Apertura';
LABEL ON COLUMN CHPER.FECUTLTRN IS 'Fecha Última Trans';
LABEL ON COLUMN CHPER.SALACT IS 'Saldo Actual';
LABEL ON COLUMN CHPER.SALDIS IS 'Saldo Disponible';
LABEL ON COLUMN CHPER.LIMSOB IS 'Límite Sobregiro';
LABEL ON COLUMN CHPER.ESTCTA IS 'Estado Cuenta';
LABEL ON COLUMN CHPER.VEREG IS 'Versión Registro';
LABEL ON COLUMN CHPER.OBSREG IS 'Observaciones';
LABEL ON COLUMN CHPER.ESTREG IS 'Estado Registro';
LABEL ON COLUMN CHPER.USRING IS 'Usuario Ingreso';
LABEL ON COLUMN CHPER.FECING IS 'Fecha Ingreso';
LABEL ON COLUMN CHPER.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN CHPER.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS
--======================================================================
LABEL ON COLUMN CHPER.CODBCO TEXT IS 'Código del Banco';
LABEL ON COLUMN CHPER.CODSUC TEXT IS 'Código de la Sucursal';
LABEL ON COLUMN CHPER.NUMCTA TEXT IS 'Número de la Cuenta';
LABEL ON COLUMN CHPER.FECAPE TEXT IS 'Fecha de Apertura';
LABEL ON COLUMN CHPER.FECUTLTRN TEXT IS 'Fecha Última Trans';
LABEL ON COLUMN CHPER.SALACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN CHPER.SALDIS TEXT IS 'Saldo Disponible';
LABEL ON COLUMN CHPER.LIMSOB TEXT IS 'Límite de Sobregiro';
LABEL ON COLUMN CHPER.ESTCTA TEXT IS 'Estado de la Cuenta';
LABEL ON COLUMN CHPER.VEREG TEXT IS 'Versión de Registro';
LABEL ON COLUMN CHPER.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN CHPER.ESTREG TEXT IS 'Estado del Registro';
LABEL ON COLUMN CHPER.USRING TEXT IS 'Usuario de Ingreso';
LABEL ON COLUMN CHPER.FECING TEXT IS 'Fecha de Ingreso';
LABEL ON COLUMN CHPER.USRACT TEXT IS 'Usuario de Actualización';
LABEL ON COLUMN CHPER.FECACT TEXT IS 'Fecha de Actualización';