--======================================================================
-- Nombre de la Tabla : GLBSE - BALANCE_GENERALES
--
-- DESCRIPCIÓN:
-- Balances Generales Consolidado. Registra los saldos consolidados de
-- cuentas contables.
--
-- Objetivo:
-- Mantener la información de balances consolidados.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Resultados contables consolidados.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Reportes financieros consolidados.
--
-- Restricciones:
-- PK técnica sobre id.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-21
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE GLBSE (

    ID_REGISTRO FOR COLUMN INDREG BIGINT
               NOT NULL GENERATED ALWAYS AS IDENTITY
               (START WITH 1, INCREMENT BY 1),

    DESCRIPCION_CUENTA FOR COLUMN DSCCTA VARCHAR(120)
                               NOT NULL DEFAULT '',

    NATURALEZA_CUENTA FOR COLUMN NATCTA VARCHAR(20)
                                NOT NULL DEFAULT '',

    NIVEL_CUENTA FOR COLUMN NIVCTA VARCHAR(50)
                          NOT NULL DEFAULT '',

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                     NOT NULL DEFAULT 0,

    FEC_PROCESO_SISTEMA FOR COLUMN FECPRCSTM TIMESTAMP
                                  NOT NULL WITH DEFAULT,

    OBSERVACIONES FOR COLUMN OBSREG VARCHAR(120)
                      NOT NULL DEFAULT '',

    VERSION_REGISTRO FOR COLUMN VERREG INTEGER
                         NOT NULL DEFAULT 1,                       

    ESTADO_REGISTRO FOR COLUMN ESTREG VARCHAR(20)
                           NOT NULL DEFAULT 'A',           

    USUARIO_INGRESO FOR COLUMN USRING CHAR(18)
                        NOT NULL DEFAULT USER,

    FECHA_INGRESO FOR COLUMN FECING TIMESTAMP
                      NOT NULL WITH DEFAULT,

    USUARIO_ACTUALIZA FOR COLUMN USRACT CHAR(18)
                          NOT NULL DEFAULT USER,

    FECHA_ACTUALIZA FOR COLUMN FECACT TIMESTAMP
                        NOT NULL WITH DEFAULT,

    CONSTRAINT GLBSE_PK PRIMARY KEY (INDREG),

    CONSTRAINT GLBSE_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RGLBSE;

RENAME TABLE GLBSE
TO BALANCE_GENERALES
FOR SYSTEM NAME GLBSE;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE GLBSE IS
'BALANCE_GENERALES';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN GLBSE.INDREG IS
'Identificador único del balance consolidado.';

COMMENT ON COLUMN GLBSE.DSCCTA IS
'Descripción de la cuenta.';

COMMENT ON COLUMN GLBSE.NATCTA IS
'Naturaleza de la cuenta.';

COMMENT ON COLUMN GLBSE.NIVCTA IS
'Nivel de la cuenta.';

COMMENT ON COLUMN GLBSE.SLDACT IS
'Saldo actual del balance.';

COMMENT ON COLUMN GLBSE.FECPRCSTM IS
'Fecha del proceso del sistema.';

COMMENT ON COLUMN GLBSE.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN GLBSE.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN GLBSE.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN GLBSE.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN GLBSE.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN GLBSE.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN GLBSE.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE GLBSE IS 'BALANCE_GENERALES';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN GLBSE.INDREG IS 'ID Registro';
LABEL ON COLUMN GLBSE.DSCCTA IS 'Descripción Cuenta';
LABEL ON COLUMN GLBSE.NATCTA IS 'Naturaleza Cuenta';
LABEL ON COLUMN GLBSE.NIVCTA IS 'Nivel Cuenta';
LABEL ON COLUMN GLBSE.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN GLBSE.FECPRCSTM IS 'Fecha Proceso';
LABEL ON COLUMN GLBSE.OBSREG IS 'Observaciones';
LABEL ON COLUMN GLBSE.VERREG IS 'Versión Registro';
LABEL ON COLUMN GLBSE.ESTREG IS 'Estado Registro';
LABEL ON COLUMN GLBSE.USRING IS 'Usuario Creación';
LABEL ON COLUMN GLBSE.FECING IS 'Fecha Creación';
LABEL ON COLUMN GLBSE.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN GLBSE.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN GLBSE.INDREG TEXT IS 'ID Registro';
LABEL ON COLUMN GLBSE.DSCCTA TEXT IS 'Descripción Cuenta';
LABEL ON COLUMN GLBSE.NATCTA TEXT IS 'Naturaleza Cuenta';
LABEL ON COLUMN GLBSE.NIVCTA TEXT IS 'Nivel Cuenta';
LABEL ON COLUMN GLBSE.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN GLBSE.FECPRCSTM TEXT IS 'Fecha Proceso';
LABEL ON COLUMN GLBSE.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN GLBSE.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN GLBSE.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN GLBSE.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN GLBSE.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN GLBSE.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN GLBSE.FECACT TEXT IS 'Fecha Actualiza';
