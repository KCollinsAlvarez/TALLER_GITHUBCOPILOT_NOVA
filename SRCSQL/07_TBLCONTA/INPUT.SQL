--======================================================================
-- Nombre de la Tabla : INPUT - ASIENT_CONTA_APROB
--
-- DESCRIPCIÓN:
-- Archivo de Asientos Contables Aprobados (Archivos Derivados). Registra
-- asientos contables que han sido aprobados por el sistema, incluyendo
-- descripción, naturaleza y nivel de cuenta, con información de auditoría
-- completa.
--
-- Objetivo:
-- Centralizar el registro de asientos contables aprobados para
-- operaciones contables y reportes financieros.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Operaciones contables diarias del sistema.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Fuente de datos para balances generales, estados financieros
-- y reportes contables.
--
-- Restricciones:
-- PK técnica sobre numero_del_lote y secuencia_dentro_del_lote.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-16
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE INPUT (

    NUMERO_DEL_LOTE FOR COLUMN NUMLTE VARCHAR(30)
                        NOT NULL,

    SECUENCIA_DEL_LOTE FOR COLUMN SECLTE VARCHAR(50)
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

    CONSTRAINT INPUT_PK PRIMARY KEY (NUMLTE, SECLTE),

    CONSTRAINT INPUT_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RINPUT;

RENAME TABLE INPUT
TO ASIENT_CONTA_APROB
FOR SYSTEM NAME INPUT;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE INPUT IS
'ASIENT_CONTA_APROB';

--======================================================================
-- Comentarios de Columnas
--======================================================================

COMMENT ON COLUMN INPUT.NUMLTE IS
'Número del lote de asientos contables.';

COMMENT ON COLUMN INPUT.SECLTE IS
'Secuencia del asiento dentro del lote.';

COMMENT ON COLUMN INPUT.DESCTA IS
'Descripción de la cuenta contable.';

COMMENT ON COLUMN INPUT.NATCTA IS
'Naturaleza de la cuenta (debe/haber).';

COMMENT ON COLUMN INPUT.NIVCTA IS
'Nivel jerárquico de la cuenta.';

COMMENT ON COLUMN INPUT.SLDACT IS
'Saldo actual del asiento.';

COMMENT ON COLUMN INPUT.FECPRO IS
'Fecha y hora del proceso del sistema.';

COMMENT ON COLUMN INPUT.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN INPUT.OBSREG IS
'Observaciones adicionales del asiento.';

COMMENT ON COLUMN INPUT.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN INPUT.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN INPUT.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN INPUT.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN INPUT.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE INPUT IS 'ASIENT_CONTA_APROB';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN INPUT.NUMLTE IS 'Número Lote';
LABEL ON COLUMN INPUT.SECLTE IS 'Secuencia Lote';
LABEL ON COLUMN INPUT.DESCTA IS 'Descripción Cuenta';
LABEL ON COLUMN INPUT.NATCTA IS 'Naturaleza Cuenta';
LABEL ON COLUMN INPUT.NIVCTA IS 'Nivel Cuenta';
LABEL ON COLUMN INPUT.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN INPUT.FECPRO IS 'Fecha Proceso';
LABEL ON COLUMN INPUT.VERREG IS 'Versión Registro';
LABEL ON COLUMN INPUT.OBSREG IS 'Observaciones';
LABEL ON COLUMN INPUT.ESTREG IS 'Estado Registro';
LABEL ON COLUMN INPUT.USRING IS 'Usuario Creación';
LABEL ON COLUMN INPUT.FECING IS 'Fecha Creación';
LABEL ON COLUMN INPUT.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN INPUT.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN INPUT.NUMLTE TEXT IS 'Número Lote';
LABEL ON COLUMN INPUT.SECLTE TEXT IS 'Secuencia Lote';
LABEL ON COLUMN INPUT.DESCTA TEXT IS 'Descripción Cuenta';
LABEL ON COLUMN INPUT.NATCTA TEXT IS 'Naturaleza Cuenta';
LABEL ON COLUMN INPUT.NIVCTA TEXT IS 'Nivel Cuenta';
LABEL ON COLUMN INPUT.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN INPUT.FECPRO TEXT IS 'Fecha Proceso';
LABEL ON COLUMN INPUT.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN INPUT.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN INPUT.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN INPUT.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN INPUT.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN INPUT.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN INPUT.FECACT TEXT IS 'Fecha Actualiza';

--======================================================================
-- Índices
--======================================================================
-- Índice sobre fecha de proceso.
-- Justificación: filtrado cronológico de asientos contables.
CREATE INDEX IX_INPUT_FECPRO ON INPUT (FECPRO);
