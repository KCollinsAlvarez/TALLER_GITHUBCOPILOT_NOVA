--======================================================================
-- Nombre de la Tabla : CNTRLFIX - CONTROL_ACTIVOS
--
-- DESCRIPCIÓN:
-- Archivo de Control de Activos Fijos. Registra parámetros
-- de control y configuración para la gestión de activos fijos
-- por entidad bancaria, incluyendo valoración, depreciación
-- y estados operativos.
--
-- Objetivo:
-- Centralizar los parámetros de control para la administración
-- integral de activos fijos del banco.
--
-- Tipo de Tabla:
-- Control.
--
-- Origen de los Datos:
-- Administración de activos fijos y control patrimonial.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Consultado por procesos de gestión y control de activos
-- para validar parámetros y configuraciones por banco.
--
-- Restricciones:
-- PK simple: codigo_banco.
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-04
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CNTRLFIX (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    DESCRIPCION FOR COLUMN DESCRT VARCHAR(120)
                    NOT NULL DEFAULT '',

    FECHA_ADQUISICION FOR COLUMN FECADQ DATE
                          NOT NULL DEFAULT '0001-01-01',

    VALOR_ADQUISICION FOR COLUMN VALADQ DECIMAL(18, 2)
                          NOT NULL DEFAULT 0,

    VIDA_UTIL_MESES FOR COLUMN VIDUTLMES INTEGER
                        NOT NULL DEFAULT 0,

    DEPRECIACION_ACUM FOR COLUMN DEPACM DECIMAL(18, 2)
                          NOT NULL DEFAULT 0,

    ESTADO_ACTIVO FOR COLUMN ESTACT VARCHAR(20)
                      NOT NULL DEFAULT ' ',

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

    CONSTRAINT CNTRLFIX_PK PRIMARY KEY (CODBCO),

    CONSTRAINT CNTRLFIX_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCNTRLFIX;

RENAME TABLE CNTRLFIX
TO CONTROL_ACTIVOS
FOR SYSTEM NAME CNTRLFIX;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CNTRLFIX IS
'CONTROL_ACTIVOS';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CNTRLFIX.CODBCO IS
'Código del banco. PK de la tabla.';

COMMENT ON COLUMN CNTRLFIX.DESCRT IS
'Descripción del control de activos.';

COMMENT ON COLUMN CNTRLFIX.FECADQ IS
'Fecha de adquisición base para el control.';

COMMENT ON COLUMN CNTRLFIX.VALADQ IS
'Valor de adquisición base del control.';

COMMENT ON COLUMN CNTRLFIX.VIDUTLMES IS
'Vida útil en meses para el control de activos.';

COMMENT ON COLUMN CNTRLFIX.DEPACM IS
'Depreciación acumulada a la fecha.';

COMMENT ON COLUMN CNTRLFIX.ESTACT IS
'Estado operativo.';

COMMENT ON COLUMN CNTRLFIX.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN CNTRLFIX.OBSREG IS
'Observaciones adicionales del control.';

COMMENT ON COLUMN CNTRLFIX.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN CNTRLFIX.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN CNTRLFIX.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN CNTRLFIX.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN CNTRLFIX.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CNTRLFIX IS 'CONTROL_ACTIVOS';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CNTRLFIX.CODBCO  IS 'Código Banco';
LABEL ON COLUMN CNTRLFIX.DESCRT  IS 'Descripción';
LABEL ON COLUMN CNTRLFIX.FECADQ  IS 'Fecha Adquisición';
LABEL ON COLUMN CNTRLFIX.VALADQ  IS 'Valor Adquisición';
LABEL ON COLUMN CNTRLFIX.VIDUTLMES  IS 'Vida Útil Meses';
LABEL ON COLUMN CNTRLFIX.DEPACM  IS 'Depreciación Acumulada';
LABEL ON COLUMN CNTRLFIX.ESTACT  IS 'Estado Activo';
LABEL ON COLUMN CNTRLFIX.VERREG  IS 'Versión Registro';
LABEL ON COLUMN CNTRLFIX.OBSREG  IS 'Observaciones';
LABEL ON COLUMN CNTRLFIX.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN CNTRLFIX.USRING  IS 'Usuario Creación';
LABEL ON COLUMN CNTRLFIX.FECING  IS 'Fecha Creación';
LABEL ON COLUMN CNTRLFIX.USRACT  IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLFIX.FECACT  IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CNTRLFIX.CODBCO  TEXT IS 'Código Banco';
LABEL ON COLUMN CNTRLFIX.DESCRT  TEXT IS 'Descripción';
LABEL ON COLUMN CNTRLFIX.FECADQ  TEXT IS 'Fecha Adquisición';
LABEL ON COLUMN CNTRLFIX.VALADQ  TEXT IS 'Valor Adquisición';
LABEL ON COLUMN CNTRLFIX.VIDUTLMES  TEXT IS 'Vida Útil Meses';
LABEL ON COLUMN CNTRLFIX.DEPACM  TEXT IS 'Depreciación Acumulada';
LABEL ON COLUMN CNTRLFIX.ESTACT  TEXT IS 'Estado Activo';
LABEL ON COLUMN CNTRLFIX.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN CNTRLFIX.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN CNTRLFIX.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN CNTRLFIX.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN CNTRLFIX.FECING  TEXT IS 'Fecha Creación';
LABEL ON COLUMN CNTRLFIX.USRACT  TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLFIX.FECACT  TEXT IS 'Fecha Actualiza';