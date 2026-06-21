--======================================================================
-- Nombre de la Tabla : RCOLL - RELACIONES_GARANTIAS
--
-- DESCRIPCIÓN:
-- Relaciones entre Garantías. Registra las relaciones entre cuentas
-- a garantizar y cuentas que garantizan, incluyendo tipo, valor,
-- fecha de avalúo y estado de cada relación de garantía.
--
-- Objetivo:
-- Centralizar el catálogo de relaciones entre garantías para
-- operaciones de control y gestión de riesgos.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Operaciones de garantías y relaciones de cobertura.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referenciada desde ROCOL para gestión de relaciones de garantías
-- en operaciones de crédito.
--
-- Restricciones:
-- PK técnica sobre codigo_banco, cuenta_a_garantizar y 
-- cuenta_que_garantiza.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-16
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE RCOLL (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    CUENTA_A_GARANTIZAR FOR COLUMN CTAGAR VARCHAR(50)
                            NOT NULL,

    CUENTA_QUE_GARANTIZA FOR COLUMN CTAGNT VARCHAR(50)
                             NOT NULL,

    TIPO_GARANTIA FOR COLUMN TIPGAR VARCHAR(20)
                      NOT NULL DEFAULT '',

    VALOR_GARANTIA FOR COLUMN VALGAR DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    FECHA_AVALUO FOR COLUMN FECAVA DATE
                     NOT NULL DEFAULT '0001-01-01',

    FECHA_VENCIMIENTO FOR COLUMN FECVEN DATE
                    NOT NULL DEFAULT '0001-01-01',

    ESTADO_GARANTIA FOR COLUMN ESTGAR VARCHAR(20)
                        NOT NULL DEFAULT '',

    VERSION_REGISTRO FOR COLUMN VERREG INTEGER
                         NOT NULL DEFAULT 1,

    OBSERVACIONES FOR COLUMN OBSREG VARCHAR(120)
                      NOT NULL DEFAULT '',

    USUARIO_INGRESO FOR COLUMN USRING CHAR(18)
                        NOT NULL DEFAULT USER,

    FECHA_INGRESO FOR COLUMN FECING TIMESTAMP
                      NOT NULL WITH DEFAULT,

    USUARIO_ACTUALIZA FOR COLUMN USRACT CHAR(18)
                          NOT NULL DEFAULT USER,

    FECHA_ACTUALIZA FOR COLUMN FECACT TIMESTAMP
                        NOT NULL WITH DEFAULT,

    ESTADO_REGISTRO FOR COLUMN ESTREG CHAR(1)
                        NOT NULL DEFAULT 'A',

    CONSTRAINT RCOLL_PK PRIMARY KEY (CODBCO, CTAGAR, CTAGNT),

    CONSTRAINT RCOLL_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RRCOLL;

RENAME TABLE RCOLL
TO RELACIONES_GARANTIAS
FOR SYSTEM NAME RCOLL;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE RCOLL IS
'RELACIONES_GARANTIAS';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN RCOLL.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN RCOLL.CTAGAR IS
'Cuenta a garantizar.';

COMMENT ON COLUMN RCOLL.CTAGNT IS
'Cuenta que garantiza.';

COMMENT ON COLUMN RCOLL.TIPGAR IS
'Tipo de garantía en la relación.';

COMMENT ON COLUMN RCOLL.VALGAR IS
'Valor de la garantía.';

COMMENT ON COLUMN RCOLL.FECAVA IS
'Fecha de avalúo de la garantía.';

COMMENT ON COLUMN RCOLL.FECVEN IS
'Fecha de vencimiento de la garantía.';

COMMENT ON COLUMN RCOLL.ESTGAR IS
'Estado operativo de la garantía.';

COMMENT ON COLUMN RCOLL.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN RCOLL.OBSREG IS
'Observaciones adicionales de la garantía.';

COMMENT ON COLUMN RCOLL.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN RCOLL.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN RCOLL.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN RCOLL.FECACT IS
'Fecha y hora de la última actualización.';

COMMENT ON COLUMN RCOLL.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE RCOLL IS 'RELACIONES_GARANTIAS';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN RCOLL.CODBCO IS 'Código Banco';
LABEL ON COLUMN RCOLL.CTAGAR IS 'Cuenta a Garantizar';
LABEL ON COLUMN RCOLL.CTAGNT IS 'Cuenta que Garantiza';
LABEL ON COLUMN RCOLL.TIPGAR IS 'Tipo Garantía';
LABEL ON COLUMN RCOLL.VALGAR IS 'Valor Garantía';
LABEL ON COLUMN RCOLL.FECAVA IS 'Fecha Avalúo';
LABEL ON COLUMN RCOLL.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN RCOLL.ESTGAR IS 'Estado Garantía';
LABEL ON COLUMN RCOLL.VERREG IS 'Versión Registro';
LABEL ON COLUMN RCOLL.OBSREG IS 'Observaciones';
LABEL ON COLUMN RCOLL.USRING IS 'Usuario Creación';
LABEL ON COLUMN RCOLL.FECING IS 'Fecha Creación';
LABEL ON COLUMN RCOLL.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN RCOLL.FECACT IS 'Fecha Actualiza';
LABEL ON COLUMN RCOLL.ESTREG IS 'Estado Registro';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN RCOLL.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN RCOLL.CTAGAR TEXT IS 'Cuenta a Garantizar';
LABEL ON COLUMN RCOLL.CTAGNT TEXT IS 'Cuenta que Garantiza';
LABEL ON COLUMN RCOLL.TIPGAR TEXT IS 'Tipo Garantía';
LABEL ON COLUMN RCOLL.VALGAR TEXT IS 'Valor Garantía';
LABEL ON COLUMN RCOLL.FECAVA TEXT IS 'Fecha Avalúo';
LABEL ON COLUMN RCOLL.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN RCOLL.ESTGAR TEXT IS 'Estado Garantía';
LABEL ON COLUMN RCOLL.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN RCOLL.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN RCOLL.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN RCOLL.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN RCOLL.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN RCOLL.FECACT TEXT IS 'Fecha Actualiza';
LABEL ON COLUMN RCOLL.ESTREG TEXT IS 'Estado Registro';

--======================================================================
-- Índices
--======================================================================
-- Índice sobre claves naturales codigo_banco y cuenta_a_garantizar.
-- Justificación: búsquedas frecuentes por banco y cuenta garantizada.
CREATE INDEX IX_RCOLL_CODBCO_CTAGAR ON RCOLL (CODBCO, CTAGAR);

-- Índice sobre fecha de ingreso.
-- Justificación: ordenamiento y filtrado cronológico de garantías.
CREATE INDEX IX_RCOLL_FECING ON RCOLL (FECING);
