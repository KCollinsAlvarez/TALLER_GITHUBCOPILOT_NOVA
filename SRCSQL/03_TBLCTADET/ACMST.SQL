--======================================================================
-- Nombre de la Tabla : ACMST - MAESTRO_CUENTAS
--
-- DESCRIPCIÓN:
-- Archivo Maestro de Cuentas de Detalle. Registra las cuentas
-- bancarias de detalle, incluyendo saldos, límites de sobregiro
-- y estado de cada cuenta del banco.
--
-- Objetivo:
-- Centralizar el catálogo de cuentas de detalle como referencia
-- principal para operaciones transaccionales.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Operaciones de apertura de cuentas y gestión de transacciones.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referenciado por STPMT, PBTRN, RCLNB, CHMST, CMRIN, TRANS
-- y TTRAN para validación y registro de operaciones de cuentas.
--
-- Restricciones:
-- PK técnica: id BIGINT GENERATED ALWAYS AS IDENTITY.
-- UNIQUE sobre numero_cuenta (clave de negocio).
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-05
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE ACMST (

    ID_REGISTRO FOR COLUMN IDEREG BIGINT
           GENERATED ALWAYS AS IDENTITY
           NOT NULL,

    NUMERO_CUENTA FOR COLUMN NUMCTA VARCHAR(24)
                      NOT NULL,

    FECHA_APERTURA FOR COLUMN FECAPR DATE
                       NOT NULL DEFAULT '0001-01-01',

    FECH_ULTIMA_TRANS FOR COLUMN FECULMTRN DATE
                        NOT NULL DEFAULT '0001-01-01',

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                    NOT NULL DEFAULT 0,

    SALDO_DISPONIBLE FOR COLUMN SLDDSP DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,

    LIMITE_SOBREGIRO FOR COLUMN LMSBRG DECIMAL(18, 2)
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

    CONSTRAINT ACMST_PK PRIMARY KEY (IDEREG),

    CONSTRAINT UK_ACMST_NUMCTA UNIQUE (NUMCTA),

    CONSTRAINT ACMST_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RACMST;

RENAME TABLE ACMST
TO MAESTRO_CUENTAS
FOR SYSTEM NAME ACMST;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE ACMST IS
'MAESTRO_CUENTAS';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN ACMST.IDEREG IS
'Identificador técnico único.';

COMMENT ON COLUMN ACMST.NUMCTA IS
'Número de cuenta de detalle.';

COMMENT ON COLUMN ACMST.FECAPR IS
'Fecha de apertura de la cuenta.';

COMMENT ON COLUMN ACMST.FECULMTRN IS
'Fecha de la última transacción en la cuenta.';

COMMENT ON COLUMN ACMST.SLDACT IS
'Saldo actual de la cuenta.';

COMMENT ON COLUMN ACMST.SLDDSP IS
'Saldo disponible para operaciones.';

COMMENT ON COLUMN ACMST.LMSBRG IS
'Límite de sobregiro autorizado para la cuenta.';

COMMENT ON COLUMN ACMST.ESTCTA IS
'Estado operativo de la cuenta.';

COMMENT ON COLUMN ACMST.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN ACMST.OBSREG IS
'Observaciones adicionales de la cuenta.';

COMMENT ON COLUMN ACMST.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN ACMST.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN ACMST.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN ACMST.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN ACMST.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE ACMST IS 'MAESTRO_CUENTAS';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN ACMST.IDEREG  IS 'ID Técnico';
LABEL ON COLUMN ACMST.NUMCTA  IS 'Número Cuenta';
LABEL ON COLUMN ACMST.FECAPR  IS 'Fecha Apertura';
LABEL ON COLUMN ACMST.FECULMTRN  IS 'Fecha Ult. Trans.';
LABEL ON COLUMN ACMST.SLDACT  IS 'Saldo Actual';
LABEL ON COLUMN ACMST.SLDDSP  IS 'Saldo Disponible';
LABEL ON COLUMN ACMST.LMSBRG  IS 'Límite Sobregiro';
LABEL ON COLUMN ACMST.ESTCTA  IS 'Estado Cuenta';
LABEL ON COLUMN ACMST.VERREG  IS 'Versión Registro';
LABEL ON COLUMN ACMST.OBSREG  IS 'Observaciones';
LABEL ON COLUMN ACMST.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN ACMST.USRING  IS 'Usuario Creación';
LABEL ON COLUMN ACMST.FECING  IS 'Fecha Creación';
LABEL ON COLUMN ACMST.USRACT  IS 'Usuario Actualiza';
LABEL ON COLUMN ACMST.FECACT  IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN ACMST.IDEREG  TEXT IS 'ID Técnico';
LABEL ON COLUMN ACMST.NUMCTA  TEXT IS 'Número Cuenta';
LABEL ON COLUMN ACMST.FECAPR  TEXT IS 'Fecha Apertura';
LABEL ON COLUMN ACMST.FECULMTRN  TEXT IS 'Fecha Ult. Trans.';
LABEL ON COLUMN ACMST.SLDACT  TEXT IS 'Saldo Actual';
LABEL ON COLUMN ACMST.SLDDSP  TEXT IS 'Saldo Disponible';
LABEL ON COLUMN ACMST.LMSBRG  TEXT IS 'Límite Sobregiro';
LABEL ON COLUMN ACMST.ESTCTA  TEXT IS 'Estado Cuenta';
LABEL ON COLUMN ACMST.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN ACMST.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN ACMST.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN ACMST.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN ACMST.FECING  TEXT IS 'Fecha Creación';
LABEL ON COLUMN ACMST.USRACT  TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN ACMST.FECACT  TEXT IS 'Fecha Actualiza';