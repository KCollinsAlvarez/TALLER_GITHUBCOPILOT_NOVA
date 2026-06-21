--======================================================================
-- Nombre de la Tabla : INPT2 - ENTRADAS_CONTA_AUTO
--
-- DESCRIPCIÓN:
-- Entradas Contables Automáticas generadas en el fin de día. Registra
-- los asientos automáticos creados al cierre del día con su saldo,
-- descripción de cuenta, naturaleza y nivel contable.
--
-- Objetivo:
-- Centralizar las entradas contables automáticas de fin de día para
-- auditoría y conciliación contable.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Generación automática de asientos en el proceso de fin de día.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Fuente de datos para conciliaciones contables y reportes
-- automáticos de cierre.
--
-- Restricciones:
-- PK simple: id.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-17
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE INPT2 (

    ID_ENTRADA FOR COLUMN IDNETD BIGINT NOT NULL
           GENERATED ALWAYS AS IDENTITY,

    DESCRIPCION_CUENTA FOR COLUMN DESCTA VARCHAR(120)
                           NOT NULL DEFAULT '',

    NATURALEZA_CUENTA FOR COLUMN NATCTA VARCHAR(20)
                          NOT NULL DEFAULT '',

    NIVEL_CUENTA FOR COLUMN NVLCTA VARCHAR(50)
                     NOT NULL DEFAULT '',

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                     NOT NULL DEFAULT 0,

    FEC_PROCESO_SISTEMA FOR COLUMN FECPRO TIMESTAMP
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

    CONSTRAINT INPT2_PK PRIMARY KEY (IDNETD),

    CONSTRAINT INPT2_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RINPT2;

RENAME TABLE INPT2
TO ENTRADAS_CONTA_AUTO
FOR SYSTEM NAME INPT2;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE INPT2 IS
'ENTRADAS_CONTA_AUTO';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN INPT2.IDNETD IS
'Identificador técnico único.';

COMMENT ON COLUMN INPT2.DESCTA IS
'Descripción de la cuenta contable.';

COMMENT ON COLUMN INPT2.NATCTA IS
'Naturaleza de la cuenta contable.';

COMMENT ON COLUMN INPT2.NVLCTA IS
'Nivel de la cuenta contable.';

COMMENT ON COLUMN INPT2.SLDACT IS
'Saldo actual de la cuenta.';

COMMENT ON COLUMN INPT2.FECPRO IS
'Fecha y hora del proceso del sistema.';

COMMENT ON COLUMN INPT2.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN INPT2.OBSREG IS
'Observaciones adicionales del registro.';

COMMENT ON COLUMN INPT2.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN INPT2.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN INPT2.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN INPT2.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN INPT2.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE INPT2 IS 'ENTRADAS_CONTA_AUTO';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN INPT2.IDNETD IS 'Identificador Entrada';
LABEL ON COLUMN INPT2.DESCTA IS 'Descripción Cuenta';
LABEL ON COLUMN INPT2.NATCTA IS 'Naturaleza Cuenta';
LABEL ON COLUMN INPT2.NVLCTA IS 'Nivel Cuenta';
LABEL ON COLUMN INPT2.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN INPT2.FECPRO IS 'Fecha Proceso';
LABEL ON COLUMN INPT2.VERREG IS 'Versión Registro';
LABEL ON COLUMN INPT2.OBSREG IS 'Observaciones';
LABEL ON COLUMN INPT2.ESTREG IS 'Estado Registro';
LABEL ON COLUMN INPT2.USRING IS 'Usuario Creación';
LABEL ON COLUMN INPT2.FECING IS 'Fecha Creación';
LABEL ON COLUMN INPT2.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN INPT2.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN INPT2.IDNETD TEXT IS 'Identificador Entrada';
LABEL ON COLUMN INPT2.DESCTA TEXT IS 'Descripción Cuenta';
LABEL ON COLUMN INPT2.NATCTA TEXT IS 'Naturaleza Cuenta';
LABEL ON COLUMN INPT2.NVLCTA TEXT IS 'Nivel Cuenta';
LABEL ON COLUMN INPT2.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN INPT2.FECPRO TEXT IS 'Fecha Proceso';
LABEL ON COLUMN INPT2.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN INPT2.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN INPT2.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN INPT2.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN INPT2.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN INPT2.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN INPT2.FECACT TEXT IS 'Fecha Actualiza';
