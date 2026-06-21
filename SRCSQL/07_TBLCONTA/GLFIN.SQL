--======================================================================
-- Nombre de la Tabla : GLFIN - ESTADOS_FINANCIEROS
--
-- DESCRIPCIÓN:
-- Estados Financieros por niveles. Registra datos de estados financieros
-- consolidados.
--
-- Objetivo:
-- Mantener la información de estados financieros por niveles.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Resultados financieros de cierre.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Reportes de gestión financiera.
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

CREATE OR REPLACE TABLE GLFIN (

    ID_REGISTRO FOR COLUMN IDNREG BIGINT
               NOT NULL GENERATED ALWAYS AS IDENTITY
               (START WITH 1, INCREMENT BY 1),

    DESCRIPCION_CUENTA FOR COLUMN DSCCTA VARCHAR(120)
                               NOT NULL DEFAULT '',

    NATURALEZA_CUENTA FOR COLUMN NATCTA VARCHAR(20)
                                NOT NULL DEFAULT '',

    NIVEL_CUENTA FOR COLUMN NVLCTA VARCHAR(50)
                          NOT NULL DEFAULT '',

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                     NOT NULL DEFAULT 0,

    FEC_PROCESO_SISTEMA FOR COLUMN FECPRSSIS TIMESTAMP
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

    CONSTRAINT GLFIN_PK PRIMARY KEY (IDNREG)

) RCDFMT RGLFIN;

RENAME TABLE GLFIN
TO ESTADOS_FINANCIEROS
FOR SYSTEM NAME GLFIN;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE GLFIN IS
'ESTADOS_FINANCIEROS';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN GLFIN.IDNREG IS
'Identificador único del estado financiero.';

COMMENT ON COLUMN GLFIN.DSCCTA IS
'Descripción de la cuenta.';

COMMENT ON COLUMN GLFIN.NATCTA IS
'Naturaleza de la cuenta.';

COMMENT ON COLUMN GLFIN.NVLCTA IS
'Nivel de la cuenta.';

COMMENT ON COLUMN GLFIN.SLDACT IS
'Saldo actual del estado financiero.';

COMMENT ON COLUMN GLFIN.FECPRSSIS IS
'Fecha del proceso del sistema.';

COMMENT ON COLUMN GLFIN.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN GLFIN.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN GLFIN.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN GLFIN.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN GLFIN.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN GLFIN.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN GLFIN.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE GLFIN IS 'ESTADOS_FINANCIEROS';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN GLFIN.IDNREG IS 'ID Registro';
LABEL ON COLUMN GLFIN.DSCCTA IS 'Descripción Cuenta';
LABEL ON COLUMN GLFIN.NATCTA IS 'Naturaleza Cuenta';
LABEL ON COLUMN GLFIN.NVLCTA IS 'Nivel Cuenta';
LABEL ON COLUMN GLFIN.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN GLFIN.FECPRSSIS IS 'Fecha Proceso';
LABEL ON COLUMN GLFIN.OBSREG IS 'Observaciones';
LABEL ON COLUMN GLFIN.VERREG IS 'Versión Registro';
LABEL ON COLUMN GLFIN.ESTREG IS 'Estado Registro';
LABEL ON COLUMN GLFIN.USRING IS 'Usuario Creación';
LABEL ON COLUMN GLFIN.FECING IS 'Fecha Creación';
LABEL ON COLUMN GLFIN.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN GLFIN.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN GLFIN.IDNREG TEXT IS 'ID Registro';
LABEL ON COLUMN GLFIN.DSCCTA TEXT IS 'Descripción Cuenta';
LABEL ON COLUMN GLFIN.NATCTA TEXT IS 'Naturaleza Cuenta';
LABEL ON COLUMN GLFIN.NVLCTA TEXT IS 'Nivel Cuenta';
LABEL ON COLUMN GLFIN.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN GLFIN.FECPRSSIS TEXT IS 'Fecha Proceso';
LABEL ON COLUMN GLFIN.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN GLFIN.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN GLFIN.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN GLFIN.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN GLFIN.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN GLFIN.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN GLFIN.FECACT TEXT IS 'Fecha Actualiza';
