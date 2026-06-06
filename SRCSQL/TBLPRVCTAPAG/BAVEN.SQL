--======================================================================
-- Nombre de la Tabla : BAVEN - MAESTRO_PROVEEDORES
--
-- DESCRIPCIÓN:
-- Maestro de Proveedores. Registra la información general de
-- los proveedores de servicios y suministros del banco,
-- incluyendo datos de contacto, montos y fechas de operación.
--
-- Objetivo:
-- Centralizar el catálogo de proveedores como referencia
-- para operaciones de cuentas por pagar y pagos a terceros.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Administración de compras, tesorería y cuentas por pagar.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referenciado por BAPRC (Cuentas por Pagar) para validación
-- de proveedores y registro de operaciones.
--
-- Restricciones:
-- PK simple: numero_proveedor.
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-05
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE BAVEN (

    NUMERO_PROVEEDOR FOR COLUMN NUMPROV VARCHAR(30)
                         NOT NULL,

    NUM_IDENTIFICACION FOR COLUMN NUMIDE VARCHAR(30)
                              NOT NULL DEFAULT '',

    RAZON_SOCIAL FOR COLUMN RAZSOC VARCHAR(80)
                     NOT NULL DEFAULT '',

    EMAIL_PROVEEDOR FOR COLUMN EMLPROV VARCHAR(80)
              NOT NULL DEFAULT '',

    TELEFONO_PROVEEDOR FOR COLUMN TELPROV VARCHAR(80)
                NOT NULL DEFAULT '',

    MONTO_ORIGINAL FOR COLUMN MONTOG DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    SALDO_PENDIENTE FOR COLUMN SLDPDE DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,

    FECHA_EMISION FOR COLUMN FECEMI DATE
                      NOT NULL DEFAULT '0001-01-01',

    FECHA_VENCIMIENTO FOR COLUMN FECVEN DATE
                          NOT NULL DEFAULT '0001-01-01',

    ESTADO_CXP FOR COLUMN ESTCXP VARCHAR(20)
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

    CONSTRAINT BAVEN_PK PRIMARY KEY (NUMPROV),

    CONSTRAINT BAVEN_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RBAVEN;

RENAME TABLE BAVEN
TO MAESTRO_PROVEEDORES
FOR SYSTEM NAME BAVEN;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE BAVEN IS
'MAESTRO_PROVEEDORES';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN BAVEN.NUMPROV IS
'Número del proveedor. PK de la tabla.';

COMMENT ON COLUMN BAVEN.NUMIDE IS
'Número de identificación del proveedor.';

COMMENT ON COLUMN BAVEN.RAZSOC IS
'Razón social del proveedor.';

COMMENT ON COLUMN BAVEN.EMLPROV IS
'Email de contacto del proveedor.';

COMMENT ON COLUMN BAVEN.TELPROV IS
'Teléfono de contacto del proveedor.';

COMMENT ON COLUMN BAVEN.MONTOG IS
'Monto original de la transacción con el proveedor.';

COMMENT ON COLUMN BAVEN.SLDPDE IS
'Saldo pendiente de pago al proveedor.';

COMMENT ON COLUMN BAVEN.FECEMI IS
'Fecha de emisión del documento.';

COMMENT ON COLUMN BAVEN.FECVEN IS
'Fecha de vencimiento del documento.';

COMMENT ON COLUMN BAVEN.ESTCXP IS
'Estado de la cuenta por pagar con el proveedor.';

COMMENT ON COLUMN BAVEN.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN BAVEN.OBSREG IS
'Observaciones adicionales del proveedor.';

COMMENT ON COLUMN BAVEN.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN BAVEN.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN BAVEN.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN BAVEN.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN BAVEN.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE BAVEN IS 'MAESTRO_PROVEEDORES';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN BAVEN.NUMPROV  IS 'Número Proveedor';
LABEL ON COLUMN BAVEN.NUMIDE   IS 'Número Identificación';
LABEL ON COLUMN BAVEN.RAZSOC   IS 'Razón Social';
LABEL ON COLUMN BAVEN.EMLPROV  IS 'Email';
LABEL ON COLUMN BAVEN.TELPROV  IS 'Teléfono';
LABEL ON COLUMN BAVEN.MONTOG   IS 'Monto Original';
LABEL ON COLUMN BAVEN.SLDPDE   IS 'Saldo Pendiente';
LABEL ON COLUMN BAVEN.FECEMI   IS 'Fecha Emisión';
LABEL ON COLUMN BAVEN.FECVEN   IS 'Fecha Vencimiento';
LABEL ON COLUMN BAVEN.ESTCXP   IS 'Estado CXP';
LABEL ON COLUMN BAVEN.VERREG   IS 'Versión Registro';
LABEL ON COLUMN BAVEN.OBSREG   IS 'Observaciones';
LABEL ON COLUMN BAVEN.ESTREG   IS 'Estado Registro';
LABEL ON COLUMN BAVEN.USRING   IS 'Usuario Creación';
LABEL ON COLUMN BAVEN.FECING   IS 'Fecha Creación';
LABEL ON COLUMN BAVEN.USRACT   IS 'Usuario Actualiza';
LABEL ON COLUMN BAVEN.FECACT   IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN BAVEN.NUMPROV  TEXT IS 'Número Proveedor';
LABEL ON COLUMN BAVEN.NUMIDE   TEXT IS 'Número Identificación';
LABEL ON COLUMN BAVEN.RAZSOC   TEXT IS 'Razón Social';
LABEL ON COLUMN BAVEN.EMLPROV  TEXT IS 'Email';
LABEL ON COLUMN BAVEN.TELPROV  TEXT IS 'Teléfono';
LABEL ON COLUMN BAVEN.MONTOG   TEXT IS 'Monto Original';
LABEL ON COLUMN BAVEN.SLDPDE   TEXT IS 'Saldo Pendiente';
LABEL ON COLUMN BAVEN.FECEMI   TEXT IS 'Fecha Emisión';
LABEL ON COLUMN BAVEN.FECVEN   TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN BAVEN.ESTCXP   TEXT IS 'Estado CXP';
LABEL ON COLUMN BAVEN.VERREG   TEXT IS 'Versión Registro';
LABEL ON COLUMN BAVEN.OBSREG   TEXT IS 'Observaciones';
LABEL ON COLUMN BAVEN.ESTREG   TEXT IS 'Estado Registro';
LABEL ON COLUMN BAVEN.USRING   TEXT IS 'Usuario Creación';
LABEL ON COLUMN BAVEN.FECING   TEXT IS 'Fecha Creación';
LABEL ON COLUMN BAVEN.USRACT   TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN BAVEN.FECACT   TEXT IS 'Fecha Actualiza';