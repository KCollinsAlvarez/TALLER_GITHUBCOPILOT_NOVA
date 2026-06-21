--======================================================================
-- Nombre de la Tabla : BUMST - MAESTRO_PRESUPUESTOS
--
-- DESCRIPCIÓN:
-- Maestro de Presupuestos. Registra presupuestos por banco, sucursal,
-- moneda y centro de costo.
--
-- Objetivo:
-- Mantener el catálogo de presupuestos.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Definición de presupuestos contables.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Control y seguimiento de presupuestos.
--
-- Restricciones:
-- PK sobre banco, sucursal, moneda, presupuesto y centro de costo.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-21
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE BUMST (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    CODIGO_SUCURSAL FOR COLUMN CODSUC VARCHAR(20)
                        NOT NULL,

    CODIGO_MONEDA FOR COLUMN CODMON CHAR(3)
                        NOT NULL,

    NUMERO_PRESUPUESTO FOR COLUMN NUMPRS VARCHAR(30)
                               NOT NULL,

    CENTRO_COSTO FOR COLUMN CNTCST VARCHAR(50)
                        NOT NULL,

    DESCRIPCION_CUENTA FOR COLUMN DSPCTA VARCHAR(120)
                               NOT NULL DEFAULT '',

    NATURALEZA_CUENTA FOR COLUMN NATCTA VARCHAR(20)
                                NOT NULL DEFAULT '',

    NIVEL_CUENTA FOR COLUMN NVLCTA VARCHAR(50)
                          NOT NULL DEFAULT '',

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                     NOT NULL DEFAULT 0,

    FEC_PROCESO_SISTEMA FOR COLUMN FECPRCSIS TIMESTAMP
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

    CONSTRAINT BUMST_PK PRIMARY KEY 
    (CODBCO, CODSUC, CODMON, NUMPRS, CNTCST),

    CONSTRAINT BUMST_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RBUMST;

RENAME TABLE BUMST
TO MAESTRO_PRESUPUESTOS
FOR SYSTEM NAME BUMST;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE BUMST IS
'MAESTRO_PRESUPUESTOS';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN BUMST.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN BUMST.CODSUC IS
'Código de la sucursal.';

COMMENT ON COLUMN BUMST.CODMON IS
'Código de la moneda.';

COMMENT ON COLUMN BUMST.NUMPRS IS
'Número del presupuesto.';

COMMENT ON COLUMN BUMST.CNTCST IS
'Centro de costo asociado.';

COMMENT ON COLUMN BUMST.DSPCTA IS
'Descripción de la cuenta.';

COMMENT ON COLUMN BUMST.NATCTA IS
'Naturaleza de la cuenta.';

COMMENT ON COLUMN BUMST.NVLCTA IS
'Nivel de la cuenta.';

COMMENT ON COLUMN BUMST.SLDACT IS
'Saldo actual del presupuesto.';

COMMENT ON COLUMN BUMST.FECPRCSIS IS
'Fecha del proceso del sistema.';

COMMENT ON COLUMN BUMST.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN BUMST.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN BUMST.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN BUMST.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN BUMST.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN BUMST.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN BUMST.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE BUMST IS 'MAESTRO_PRESUPUESTOS';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN BUMST.CODBCO IS 'Código Banco';
LABEL ON COLUMN BUMST.CODSUC IS 'Código Sucursal';
LABEL ON COLUMN BUMST.CODMON IS 'Código Moneda';
LABEL ON COLUMN BUMST.NUMPRS IS 'Número Presupuesto';
LABEL ON COLUMN BUMST.CNTCST IS 'Centro Costo';
LABEL ON COLUMN BUMST.DSPCTA IS 'Descripción Cuenta';
LABEL ON COLUMN BUMST.NATCTA IS 'Naturaleza Cuenta';
LABEL ON COLUMN BUMST.NVLCTA IS 'Nivel Cuenta';
LABEL ON COLUMN BUMST.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN BUMST.FECPRCSIS IS 'Fecha Proceso';
LABEL ON COLUMN BUMST.OBSREG IS 'Observaciones';
LABEL ON COLUMN BUMST.VERREG IS 'Versión Registro';
LABEL ON COLUMN BUMST.ESTREG IS 'Estado Registro';
LABEL ON COLUMN BUMST.USRING IS 'Usuario Creación';
LABEL ON COLUMN BUMST.FECING IS 'Fecha Creación';
LABEL ON COLUMN BUMST.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN BUMST.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN BUMST.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN BUMST.CODSUC TEXT IS 'Código Sucursal';
LABEL ON COLUMN BUMST.CODMON TEXT IS 'Código Moneda';
LABEL ON COLUMN BUMST.NUMPRS TEXT IS 'Número Presupuesto';
LABEL ON COLUMN BUMST.CNTCST TEXT IS 'Centro Costo';
LABEL ON COLUMN BUMST.DSPCTA TEXT IS 'Descripción Cuenta';
LABEL ON COLUMN BUMST.NATCTA TEXT IS 'Naturaleza Cuenta';
LABEL ON COLUMN BUMST.NVLCTA TEXT IS 'Nivel Cuenta';
LABEL ON COLUMN BUMST.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN BUMST.FECPRCSIS TEXT IS 'Fecha Proceso';
LABEL ON COLUMN BUMST.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN BUMST.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN BUMST.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN BUMST.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN BUMST.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN BUMST.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN BUMST.FECACT TEXT IS 'Fecha Actualiza';
