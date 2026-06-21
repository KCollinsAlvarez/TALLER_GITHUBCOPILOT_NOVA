--======================================================================
-- Nombre de la Tabla : TRDSC - DESCRIPCIONES_TRANS
--
-- DESCRIPCIÓN:
-- Descripciones Adicionales a las Transacciones (TRANS). Registra
-- textos adicionales en diferentes idiomas y formatos de salida para
-- transacciones.
--
-- Objetivo:
-- Centralizar las descripciones adicionales de transacciones para
-- reportes multidioma y documentos.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Generación de descripciones complementarias en transacciones.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte para reportes en múltiples idiomas y formatos.
--
-- Restricciones:
-- PK técnica sobre numero_registro_relativo, secuencia.
-- FK a TRANS (numero_registro_relativo).
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-17
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE TRDSC (

    NUM_REG_RELATIVO FOR COLUMN NUMREGRLT VARCHAR(30)
                                 NOT NULL,

    NUMERO_SECUENCIA FOR COLUMN NUMSEC INT
                   NOT NULL,

    TIPO_DESCRIPCION FOR COLUMN TIPDES VARCHAR(20)
                         NOT NULL DEFAULT '',

    TEXTO_DESCRIPCION FOR COLUMN TXTDES VARCHAR(200)
                          NOT NULL DEFAULT '',

    CODIGO_IDIOMA FOR COLUMN CODIDM VARCHAR(5)
                      NOT NULL DEFAULT '',

    FORMATO_SALIDA FOR COLUMN FMTSAL VARCHAR(20)
                       NOT NULL DEFAULT '',

    OBLIGATORIO FOR COLUMN OBLREG BOOLEAN
                    NOT NULL DEFAULT FALSE,

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

    CONSTRAINT TRDSC_PK PRIMARY KEY (NUMREGRLT, NUMSEC),

    CONSTRAINT FK_TRDSC_TRANS FOREIGN KEY (NUMREGRLT)
        REFERENCES TRANS (NUMREGRLT),

    CONSTRAINT TRDSC_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RTRDSC;

RENAME TABLE TRDSC
TO DESCRIPCIONES_TRANS
FOR SYSTEM NAME TRDSC;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE TRDSC IS
'DESCRIPCIONES_TRANS';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN TRDSC.NUMREGRLT IS
'Número de registro relativo de la transacción.';

COMMENT ON COLUMN TRDSC.NUMSEC IS
'Secuencia de descripción adicional.';

COMMENT ON COLUMN TRDSC.TIPDES IS
'Tipo de descripción.';

COMMENT ON COLUMN TRDSC.TXTDES IS
'Texto de descripción adicional.';

COMMENT ON COLUMN TRDSC.CODIDM IS
'Código de idioma de la descripción.';

COMMENT ON COLUMN TRDSC.FMTSAL IS
'Formato de salida para el texto.';

COMMENT ON COLUMN TRDSC.OBLREG IS
'Indicador si la descripción es obligatoria.';

COMMENT ON COLUMN TRDSC.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN TRDSC.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN TRDSC.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN TRDSC.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN TRDSC.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN TRDSC.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN TRDSC.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE TRDSC IS 'DESCRIPCIONES_TRANS';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN TRDSC.NUMREGRLT IS 'Número Registro';
LABEL ON COLUMN TRDSC.NUMSEC IS 'Secuencia';
LABEL ON COLUMN TRDSC.TIPDES IS 'Tipo Descripción';
LABEL ON COLUMN TRDSC.TXTDES IS 'Texto Descripción';
LABEL ON COLUMN TRDSC.CODIDM IS 'Código Idioma';
LABEL ON COLUMN TRDSC.FMTSAL IS 'Formato Salida';
LABEL ON COLUMN TRDSC.OBLREG IS 'Obligatorio';
LABEL ON COLUMN TRDSC.VERREG IS 'Versión Registro';
LABEL ON COLUMN TRDSC.OBSREG IS 'Observaciones';
LABEL ON COLUMN TRDSC.ESTREG IS 'Estado Registro';
LABEL ON COLUMN TRDSC.USRING IS 'Usuario Creación';
LABEL ON COLUMN TRDSC.FECING IS 'Fecha Creación';
LABEL ON COLUMN TRDSC.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN TRDSC.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN TRDSC.NUMREGRLT TEXT IS 'Número Registro';
LABEL ON COLUMN TRDSC.NUMSEC TEXT IS 'Secuencia';
LABEL ON COLUMN TRDSC.TIPDES TEXT IS 'Tipo Descripción';
LABEL ON COLUMN TRDSC.TXTDES TEXT IS 'Texto Descripción';
LABEL ON COLUMN TRDSC.CODIDM TEXT IS 'Código Idioma';
LABEL ON COLUMN TRDSC.FMTSAL TEXT IS 'Formato Salida';
LABEL ON COLUMN TRDSC.OBLREG TEXT IS 'Obligatorio';
LABEL ON COLUMN TRDSC.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN TRDSC.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN TRDSC.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN TRDSC.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN TRDSC.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN TRDSC.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN TRDSC.FECACT TEXT IS 'Fecha Actualiza';