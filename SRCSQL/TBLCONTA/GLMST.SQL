--======================================================================
-- Nombre de la Tabla : GLMST - CUENTAS_CONTABLES
--
-- DESCRIPCIÓN:
-- Maestro de Cuentas Contables. Catálogo central que define
-- las cuentas del plan contable por banco y moneda, incluyendo
-- saldos, naturaleza y nivel jerárquico de cada cuenta.
--
-- Objetivo:
-- Centralizar el catálogo contable del banco como referencia
-- para asientos, balances y estados financieros del sistema.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Configuración contable del banco y procesos de contabilidad.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referenciado por GLBLN, INPUT, INPT2, NXINP, TRANS y TTRAN
-- para validación y registro de movimientos contables.
--
-- Restricciones:
-- PK compuesta natural: codigo_banco, codigo_moneda,
-- cuenta_contable.
-- UNIQUE sobre cuenta_contable (clave de negocio).
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-04
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE GLMST (

    CODIGO_BANCO FOR COLUMN CODBCO SMALLINT
                     NOT NULL,

    CODIGO_MONEDA FOR COLUMN CODMON CHAR(3)
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

    FECHA_PROCESO FOR COLUMN FECPRC TIMESTAMP
                      NOT NULL WITH DEFAULT,

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

    CONSTRAINT GLMST_PK PRIMARY KEY (CODBCO, CODMON, CTACNT),

    CONSTRAINT GLMST_CTACNT_UK UNIQUE (CTACNT),

    CONSTRAINT GLMST_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RGLMST;

RENAME TABLE GLMST
TO CUENTAS_CONTABLES
FOR SYSTEM NAME GLMST;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE GLMST IS
'CUENTAS_CONTABLES';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN GLMST.CODBCO IS
'Código del banco. ';

COMMENT ON COLUMN GLMST.CODMON IS
'Código de moneda. ';

COMMENT ON COLUMN GLMST.CTACNT IS
'Número de cuenta contable.
Clave de negocio única (UNIQUE).';

COMMENT ON COLUMN GLMST.DESCTA IS
'Descripción de la cuenta contable.';

COMMENT ON COLUMN GLMST.NATCTA IS
'Naturaleza de la cuenta: deudora o acreedora.';

COMMENT ON COLUMN GLMST.NIVCTA IS
'Nivel jerárquico de la cuenta dentro del plan contable.';

COMMENT ON COLUMN GLMST.SLDACT IS
'Saldo actual de la cuenta contable.';

COMMENT ON COLUMN GLMST.FECPRC IS
'Fecha y hora del último proceso del sistema sobre la cuenta.';

COMMENT ON COLUMN GLMST.OBSREG IS
'Observaciones adicionales de la cuenta.';

COMMENT ON COLUMN GLMST.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN GLMST.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN GLMST.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN GLMST.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN GLMST.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN GLMST.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE GLMST IS 'CUENTAS_CONTABLES';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN GLMST.CODBCO  IS 'Código Banco';
LABEL ON COLUMN GLMST.CODMON  IS 'Código Moneda';
LABEL ON COLUMN GLMST.CTACNT  IS 'Cuenta Contable';
LABEL ON COLUMN GLMST.DESCTA  IS 'Descripción Cuenta';
LABEL ON COLUMN GLMST.NATCTA  IS 'Naturaleza Cuenta';
LABEL ON COLUMN GLMST.NIVCTA  IS 'Nivel Cuenta';
LABEL ON COLUMN GLMST.SLDACT  IS 'Saldo Actual';
LABEL ON COLUMN GLMST.FECPRC  IS 'Fecha Proceso';
LABEL ON COLUMN GLMST.OBSREG  IS 'Observaciones';
LABEL ON COLUMN GLMST.VERREG  IS 'Versión Registro';
LABEL ON COLUMN GLMST.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN GLMST.USRING  IS 'Usuario Creación';
LABEL ON COLUMN GLMST.FECING  IS 'Fecha Creación';
LABEL ON COLUMN GLMST.USRACT  IS 'Usuario Actualiz.';
LABEL ON COLUMN GLMST.FECACT  IS 'Fecha Actualiz.';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN GLMST.CODBCO  TEXT IS 'Código Banco';
LABEL ON COLUMN GLMST.CODMON  TEXT IS 'Código Moneda';
LABEL ON COLUMN GLMST.CTACNT  TEXT IS 'Cuenta Contable';
LABEL ON COLUMN GLMST.DESCTA  TEXT IS 'Descripción Cuenta';
LABEL ON COLUMN GLMST.NATCTA  TEXT IS 'Naturaleza Cuenta';
LABEL ON COLUMN GLMST.NIVCTA  TEXT IS 'Nivel Cuenta';
LABEL ON COLUMN GLMST.SLDACT  TEXT IS 'Saldo Actual';
LABEL ON COLUMN GLMST.FECPRC  TEXT IS 'Fecha Proceso';
LABEL ON COLUMN GLMST.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN GLMST.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN GLMST.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN GLMST.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN GLMST.FECING  TEXT IS 'Fecha Creación';
LABEL ON COLUMN GLMST.USRACT  TEXT IS 'Usuario Actualiz.';
LABEL ON COLUMN GLMST.FECACT  TEXT IS 'Fecha Actualiz.';

--======================================================================
-- Índices
--======================================================================
-- Índice sobre clave de negocio cuenta_contable.
-- Justificación: tablas hijas GLBLN, INPUT, INPT2, NXINP,
-- TRANS y TTRAN referencian esta columna via FK (RI-004).
CREATE INDEX IX_GLMST_CTA_CONTABLE ON GLMST (CTACNT);