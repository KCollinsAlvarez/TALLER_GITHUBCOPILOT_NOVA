--======================================================================
-- Nombre de la Tabla : GLBLN - BALANCES_GENERALES
--
-- DESCRIPCIÓN:
-- Balances Generales. Registra los balances generales por banco,
-- sucursal y moneda, incluyendo información de cuentas contables,
-- descripción, naturaleza, nivel y saldo actual.
--
-- Objetivo:
-- Centralizar el catálogo de balances generales para operaciones
-- contables y reportes financieros consolidados.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Operaciones contables y procesamiento de fin de día.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referenciada para generación de estados financieros, balances
-- consolidados y reportes de auditoría.
--
-- Restricciones:
-- PK técnica sobre codigo_banco, codigo_sucursal, codigo_moneda
-- y cuenta_contable.
-- FK a GLMST (cuenta_contable).
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-16
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE GLBLN (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    CODIGO_SUCURSAL FOR COLUMN CODSUC VARCHAR(20)
                        NOT NULL,

    CODIGO_MONEDA FOR COLUMN CODMON VARCHAR(3)
                      NOT NULL,

    CUENTA_CONTABLE FOR COLUMN CTACNT VARCHAR(24)
                        NOT NULL,

    DESCRIPCION_CUENTA FOR COLUMN DESCTA VARCHAR(120)
                           NOT NULL DEFAULT '',

    NATURALEZA_CUENTA FOR COLUMN NATCTA VARCHAR(20)
                          NOT NULL DEFAULT '',

    NIVEL_CUENTA FOR COLUMN NIVCTA VARCHAR(50)
                     NOT NULL DEFAULT '',

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                     NOT NULL DEFAULT 0,

    FECHA_PROCESO_SISTEM FOR COLUMN FECPRO TIMESTAMP
                              NOT NULL WITH DEFAULT,

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

    CONSTRAINT GLBLN_PK PRIMARY KEY (CODBCO, CODSUC, CODMON, CTACNT),

    CONSTRAINT FK_GLBLN_GLMST FOREIGN KEY (CTACNT)
        REFERENCES GLMST (CTACNT),

    CONSTRAINT GLBLN_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RGLBLN;

RENAME TABLE GLBLN
TO BALANCES_GENERALES
FOR SYSTEM NAME GLBLN;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE GLBLN IS
'BALANCES_GENERALES';

--======================================================================
-- Comentarios de Columnas
--======================================================================

COMMENT ON COLUMN GLBLN.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN GLBLN.CODSUC IS
'Código de la sucursal.';

COMMENT ON COLUMN GLBLN.CODMON IS
'Código de la moneda.';

COMMENT ON COLUMN GLBLN.CTACNT IS
'Cuenta contable del balance.';

COMMENT ON COLUMN GLBLN.DESCTA IS
'Descripción de la cuenta contable.';

COMMENT ON COLUMN GLBLN.NATCTA IS
'Naturaleza de la cuenta (debe/haber).';

COMMENT ON COLUMN GLBLN.NIVCTA IS
'Nivel jerárquico de la cuenta.';

COMMENT ON COLUMN GLBLN.SLDACT IS
'Saldo actual del balance.';

COMMENT ON COLUMN GLBLN.FECPRO IS
'Fecha y hora del proceso del sistema.';

COMMENT ON COLUMN GLBLN.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN GLBLN.OBSREG IS
'Observaciones adicionales del balance.';

COMMENT ON COLUMN GLBLN.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN GLBLN.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN GLBLN.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN GLBLN.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN GLBLN.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE GLBLN IS 'BALANCES_GENERALES';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN GLBLN.CODBCO IS 'Código Banco';
LABEL ON COLUMN GLBLN.CODSUC IS 'Código Sucursal';
LABEL ON COLUMN GLBLN.CODMON IS 'Código Moneda';
LABEL ON COLUMN GLBLN.CTACNT IS 'Cuenta Contable';
LABEL ON COLUMN GLBLN.DESCTA IS 'Descripción Cuenta';
LABEL ON COLUMN GLBLN.NATCTA IS 'Naturaleza Cuenta';
LABEL ON COLUMN GLBLN.NIVCTA IS 'Nivel Cuenta';
LABEL ON COLUMN GLBLN.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN GLBLN.FECPRO IS 'Fecha Proceso';
LABEL ON COLUMN GLBLN.VERREG IS 'Versión Registro';
LABEL ON COLUMN GLBLN.OBSREG IS 'Observaciones';
LABEL ON COLUMN GLBLN.ESTREG IS 'Estado Registro';
LABEL ON COLUMN GLBLN.USRING IS 'Usuario Creación';
LABEL ON COLUMN GLBLN.FECING IS 'Fecha Creación';
LABEL ON COLUMN GLBLN.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN GLBLN.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN GLBLN.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN GLBLN.CODSUC TEXT IS 'Código Sucursal';
LABEL ON COLUMN GLBLN.CODMON TEXT IS 'Código Moneda';
LABEL ON COLUMN GLBLN.CTACNT TEXT IS 'Cuenta Contable';
LABEL ON COLUMN GLBLN.DESCTA TEXT IS 'Descripción Cuenta';
LABEL ON COLUMN GLBLN.NATCTA TEXT IS 'Naturaleza Cuenta';
LABEL ON COLUMN GLBLN.NIVCTA TEXT IS 'Nivel Cuenta';
LABEL ON COLUMN GLBLN.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN GLBLN.FECPRO TEXT IS 'Fecha Proceso';
LABEL ON COLUMN GLBLN.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN GLBLN.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN GLBLN.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN GLBLN.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN GLBLN.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN GLBLN.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN GLBLN.FECACT TEXT IS 'Fecha Actualiza';

--======================================================================
-- Índices
--======================================================================
-- Índice sobre claves naturales codigo_banco y codigo_sucursal.
-- Justificación: búsquedas frecuentes por banco y sucursal.
CREATE INDEX IX_GLBLN_CODBCO_CODSUC ON GLBLN (CODBCO, CODSUC);

-- Índice sobre fecha de proceso.
-- Justificación: filtrado cronológico de balances.
CREATE INDEX IX_GLBLN_FECPRO ON GLBLN (FECPRO);
