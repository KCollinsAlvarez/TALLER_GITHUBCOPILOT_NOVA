--======================================================================
-- Nombre de la Tabla : NXINP - TRANSAC_PROXIMO_DIA
--
-- DESCRIPCIÓN:
-- Transacciones Contables del próximo día. Registra los asientos que
-- quedarán en el próximo día de operación, con descripción de cuenta,
-- naturaleza, nivel y saldo.
--
-- Objetivo:
-- Centralizar las transacciones del próximo día para su posterior
-- procesamiento contable y conciliación.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Generación de transacciones programadas para el día siguiente.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Fuente para el proceso contable del próximo día y para control
-- de transacciones futuras.
--
-- Restricciones:
-- PK técnica sobre numero_batch y secuencia.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-17
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE NXINP (

    NUMERO_BATCH FOR COLUMN NUMBTH VARCHAR(30)
                        NOT NULL,

    NUMERO_SECUENCIA FOR COLUMN NUMSEC INTEGER
                   NOT NULL,

    DESCRIPCION_CUENTA FOR COLUMN DESCTA VARCHAR(120)
                           NOT NULL DEFAULT '',

    NATURALEZA_CUENTA FOR COLUMN NATCTA VARCHAR(20)
                          NOT NULL DEFAULT '',

    NIVEL_CUENTA FOR COLUMN NIVCTA VARCHAR(50)
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

    CONSTRAINT NXINP_PK PRIMARY KEY (NUMBTH, NUMSEC),

    CONSTRAINT NXINP_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RNXINP;

RENAME TABLE NXINP
TO TRANSAC_PROXIMO_DIA
FOR SYSTEM NAME NXINP;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE NXINP IS
'TRANSAC_PROXIMO_DIA';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN NXINP.NUMBTH IS
'Número del batch de transacciones del próximo día.';

COMMENT ON COLUMN NXINP.NUMSEC IS
'NUMSEC de la transacción dentro del batch.';

COMMENT ON COLUMN NXINP.DESCTA IS
'Descripción de la cuenta contable.';

COMMENT ON COLUMN NXINP.NATCTA IS
'Naturaleza de la cuenta contable.';

COMMENT ON COLUMN NXINP.NIVCTA IS
'Nivel de la cuenta contable.';

COMMENT ON COLUMN NXINP.SLDACT IS
'Saldo actual proyectado.';

COMMENT ON COLUMN NXINP.FECPRO IS
'Fecha y hora del proceso del sistema.';

COMMENT ON COLUMN NXINP.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN NXINP.OBSREG IS
'Observaciones adicionales del registro.';

COMMENT ON COLUMN NXINP.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN NXINP.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN NXINP.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN NXINP.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN NXINP.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE NXINP IS 'TRANSAC_PROXIMO_DIA';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN NXINP.NUMBTH IS 'Número Batch';
LABEL ON COLUMN NXINP.NUMSEC IS 'Secuencia';
LABEL ON COLUMN NXINP.DESCTA IS 'Descripción Cuenta';
LABEL ON COLUMN NXINP.NATCTA IS 'Naturaleza Cuenta';
LABEL ON COLUMN NXINP.NIVCTA IS 'Nivel Cuenta';
LABEL ON COLUMN NXINP.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN NXINP.FECPRO IS 'Fecha Proceso';
LABEL ON COLUMN NXINP.VERREG IS 'Versión Registro';
LABEL ON COLUMN NXINP.OBSREG IS 'Observaciones';
LABEL ON COLUMN NXINP.ESTREG IS 'Estado Registro';
LABEL ON COLUMN NXINP.USRING IS 'Usuario Creación';
LABEL ON COLUMN NXINP.FECING IS 'Fecha Creación';
LABEL ON COLUMN NXINP.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN NXINP.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN NXINP.NUMBTH TEXT IS 'Número Batch';
LABEL ON COLUMN NXINP.NUMSEC TEXT IS 'Secuencia';
LABEL ON COLUMN NXINP.DESCTA TEXT IS 'Descripción Cuenta';
LABEL ON COLUMN NXINP.NATCTA TEXT IS 'Naturaleza Cuenta';
LABEL ON COLUMN NXINP.NIVCTA TEXT IS 'Nivel Cuenta';
LABEL ON COLUMN NXINP.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN NXINP.FECPRO TEXT IS 'Fecha Proceso';
LABEL ON COLUMN NXINP.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN NXINP.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN NXINP.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN NXINP.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN NXINP.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN NXINP.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN NXINP.FECACT TEXT IS 'Fecha Actualiza';