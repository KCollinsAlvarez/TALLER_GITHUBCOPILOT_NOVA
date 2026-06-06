--======================================================================
-- Nombre de la Tabla : ROCOL - MAESTRO_GARANTIAS
--
-- DESCRIPCIÓN:
-- Maestro de Garantías. Registra las garantías asociadas a
-- clientes del banco, incluyendo tipos, valores, fechas de
-- avalúo y vencimiento de cada garantía ofrecida en respaldo
-- de operaciones crediticias.
--
-- Objetivo:
-- Centralizar el catálogo de garantías como respaldo de
-- operaciones crediticias de clientes.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Operaciones crediticias y valuaciones de garantías.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referenciado por RCOLL (Relaciones entre Garantías) para
-- registro de asociaciones entre garantías y cuentas.
--
-- Restricciones:
-- PK compuesta: codigo_banco, id_cliente, numero_garantia.
-- UNIQUE sobre numero_garantia (clave de negocio).
-- FK a CUMST.id_cliente (referencia a clientes).
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-05
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE ROCOL (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    NUMERO_CLIENTE FOR COLUMN NUMCLI VARCHAR(30)
                   NOT NULL,

    NUMERO_GARANTIA FOR COLUMN NUMGAR VARCHAR(30)
                        NOT NULL,

    TIPO_GARANTIA FOR COLUMN TIPGAR VARCHAR(20)
                      NOT NULL DEFAULT '',

    VALOR_GARANTIA FOR COLUMN VALGAR DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    FECHA_AVALUO FOR COLUMN FECAVL DATE
                     NOT NULL DEFAULT '0001-01-01',

    FECHA_VENCIMIENTO FOR COLUMN FECVEN DATE
                        NOT NULL DEFAULT '0001-01-01',

    ESTADO_GARANTIA FOR COLUMN ESTGAR VARCHAR(20)
                        NOT NULL DEFAULT '',

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

    CONSTRAINT ROCOL_PK PRIMARY KEY (CODBCO, NUMCLI, NUMGAR),

    CONSTRAINT UK_ROCOL_NUMGAR UNIQUE (NUMGAR),

    CONSTRAINT FK_ROCOL_CUMST FOREIGN KEY (NUMCLI)
        REFERENCES CUMST (NUMCLI),

    CONSTRAINT ROCOL_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RROCOL;

RENAME TABLE ROCOL
TO MAESTRO_GARANTIAS
FOR SYSTEM NAME ROCOL;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE ROCOL IS
'MAESTRO_GARANTIAS';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN ROCOL.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN ROCOL.NUMCLI IS
'Identificador del cliente.';

COMMENT ON COLUMN ROCOL.NUMGAR IS
'Número de garantía.';

COMMENT ON COLUMN ROCOL.TIPGAR IS
'Tipo de garantía ofrecida por el cliente.';

COMMENT ON COLUMN ROCOL.VALGAR IS
'Valor de tasación de la garantía.';

COMMENT ON COLUMN ROCOL.FECAVL IS
'Fecha de avalúo o tasación de la garantía.';

COMMENT ON COLUMN ROCOL.FECVEN IS
'Fecha de vencimiento o vigencia de la garantía.';

COMMENT ON COLUMN ROCOL.ESTGAR IS
'Estado operativo de la garantía.';

COMMENT ON COLUMN ROCOL.OBSREG IS
'Observaciones adicionales de la garantía.';

COMMENT ON COLUMN ROCOL.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN ROCOL.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN ROCOL.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN ROCOL.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN ROCOL.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN ROCOL.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE ROCOL IS 'MAESTRO_GARANTIAS';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN ROCOL.CODBCO  IS 'Código Banco';
LABEL ON COLUMN ROCOL.NUMCLI  IS 'ID Cliente';
LABEL ON COLUMN ROCOL.NUMGAR  IS 'Número Garantía';
LABEL ON COLUMN ROCOL.TIPGAR  IS 'Tipo Garantía';
LABEL ON COLUMN ROCOL.VALGAR  IS 'Valor Garantía';
LABEL ON COLUMN ROCOL.FECAVL  IS 'Fecha Avalúo';
LABEL ON COLUMN ROCOL.FECVEN  IS 'Fecha Vencimiento';
LABEL ON COLUMN ROCOL.ESTGAR  IS 'Estado Garantía';
LABEL ON COLUMN ROCOL.OBSREG  IS 'Observaciones';
LABEL ON COLUMN ROCOL.VERREG  IS 'Versión Registro';
LABEL ON COLUMN ROCOL.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN ROCOL.USRING  IS 'Usuario Creación';
LABEL ON COLUMN ROCOL.FECING  IS 'Fecha Creación';
LABEL ON COLUMN ROCOL.USRACT  IS 'Usuario Actualiza';
LABEL ON COLUMN ROCOL.FECACT  IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN ROCOL.CODBCO  TEXT IS 'Código Banco';
LABEL ON COLUMN ROCOL.NUMCLI  TEXT IS 'ID Cliente';
LABEL ON COLUMN ROCOL.NUMGAR  TEXT IS 'Número Garantía';
LABEL ON COLUMN ROCOL.TIPGAR  TEXT IS 'Tipo Garantía';
LABEL ON COLUMN ROCOL.VALGAR  TEXT IS 'Valor Garantía';
LABEL ON COLUMN ROCOL.FECAVL  TEXT IS 'Fecha Avalúo';
LABEL ON COLUMN ROCOL.FECVEN  TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN ROCOL.ESTGAR  TEXT IS 'Estado Garantía';
LABEL ON COLUMN ROCOL.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN ROCOL.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN ROCOL.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN ROCOL.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN ROCOL.FECING  TEXT IS 'Fecha Creación';
LABEL ON COLUMN ROCOL.USRACT  TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN ROCOL.FECACT  TEXT IS 'Fecha Actualiza';

--======================================================================
-- Índices
--======================================================================
-- Índice sobre FK id_cliente.
-- Justificación: búsquedas de garantías por cliente frecuentes.
CREATE INDEX IX_ROCOL_NUMCLI ON ROCOL (NUMCLI);