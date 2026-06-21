--======================================================================
-- Nombre de la Tabla : PLPRD - PROPUESTA_PRODUCTOS
--
-- DESCRIPCIÓN:
-- Detalle de Productos asociados a una propuesta de crédito. Registra
-- productos específicos incluidos en cada propuesta, incluyendo montos,
-- plazos, tasas propuestas y estado de cada producto en la propuesta.
--
-- Objetivo:
-- Centralizar el catálogo detallado de productos en propuestas de
-- crédito para gestión de lineamientos de crédito.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Operaciones de propuestas de crédito y análisis de productos.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referenciada desde PLPCR para gestión de detalle de productos
-- en propuestas de crédito.
--
-- Restricciones:
-- PK técnica sobre numero_propuesta, codigo_producto y tipo_producto.
-- FK a PLPCR (numero_propuesta).
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-16
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE PLPRD (

    NUMERO_PROPUESTA FOR COLUMN NUMPRP VARCHAR(30)
                         NOT NULL,

    CODIGO_PRODUCTO FOR COLUMN CODPRD VARCHAR(20)
                        NOT NULL,

    TIPO_PRODUCTO FOR COLUMN TIPPRD VARCHAR(20)
                      NOT NULL,

    FECHA_PROPUESTA FOR COLUMN FECPRP DATE
                        NOT NULL DEFAULT '0001-01-01',

    MONTO_SOLICITADO FOR COLUMN MNTSOL DECIMAL(18, 2)
                         NOT NULL DEFAULT 0,

    PLAZO_MESES FOR COLUMN PLZMES INTEGER
                    NOT NULL DEFAULT 0,

    TASA_PROPUESTA FOR COLUMN TASPRP DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    DICTAMEN_CREDITO FOR COLUMN DICCRT VARCHAR(120)
                          NOT NULL DEFAULT '',

    ESTADO_PROPUESTA FOR COLUMN ESTPRP VARCHAR(20)
                         NOT NULL DEFAULT '',

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

    CONSTRAINT PLPRD_PK PRIMARY KEY (NUMPRP, CODPRD, TIPPRD),

    CONSTRAINT FK_PLPRD_PLPCR FOREIGN KEY (NUMPRP)
        REFERENCES PLPCR (NUMPRP),

    CONSTRAINT PLPRD_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RPLPRD;

RENAME TABLE PLPRD
TO PROPUESTA_PRODUCTOS
FOR SYSTEM NAME PLPRD;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE PLPRD IS
'PROPUESTA_PRODUCTOS';

--======================================================================
-- Comentarios de Columnas
--======================================================================

COMMENT ON COLUMN PLPRD.NUMPRP IS
'Número de propuesta de crédito.';

COMMENT ON COLUMN PLPRD.CODPRD IS
'Código del producto en la propuesta.';

COMMENT ON COLUMN PLPRD.TIPPRD IS
'Tipo de producto en la propuesta.';

COMMENT ON COLUMN PLPRD.FECPRP IS
'Fecha de la propuesta.';

COMMENT ON COLUMN PLPRD.MNTSOL IS
'Monto solicitado para el producto.';

COMMENT ON COLUMN PLPRD.PLZMES IS
'Plazo en meses del producto.';

COMMENT ON COLUMN PLPRD.TASPRP IS
'Tasa propuesta para el producto.';

COMMENT ON COLUMN PLPRD.DICCRT IS
'Dictamen de crédito para el producto.';

COMMENT ON COLUMN PLPRD.ESTPRP IS
'Estado de la propuesta del producto.';

COMMENT ON COLUMN PLPRD.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN PLPRD.OBSREG IS
'Observaciones adicionales del producto.';

COMMENT ON COLUMN PLPRD.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN PLPRD.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN PLPRD.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN PLPRD.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN PLPRD.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE PLPRD IS 'PROPUESTA_PRODUCTOS';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN PLPRD.NUMPRP IS 'Número Propuesta';
LABEL ON COLUMN PLPRD.CODPRD IS 'Código Producto';
LABEL ON COLUMN PLPRD.TIPPRD IS 'Tipo Producto';
LABEL ON COLUMN PLPRD.FECPRP IS 'Fecha Propuesta';
LABEL ON COLUMN PLPRD.MNTSOL IS 'Monto Solicitado';
LABEL ON COLUMN PLPRD.PLZMES IS 'Plazo Meses';
LABEL ON COLUMN PLPRD.TASPRP IS 'Tasa Propuesta';
LABEL ON COLUMN PLPRD.DICCRT IS 'Dictamen Crédito';
LABEL ON COLUMN PLPRD.ESTPRP IS 'Estado Propuesta';
LABEL ON COLUMN PLPRD.VERREG IS 'Versión Registro';
LABEL ON COLUMN PLPRD.OBSREG IS 'Observaciones';
LABEL ON COLUMN PLPRD.ESTREG IS 'Estado Registro';
LABEL ON COLUMN PLPRD.USRING IS 'Usuario Creación';
LABEL ON COLUMN PLPRD.FECING IS 'Fecha Creación';
LABEL ON COLUMN PLPRD.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN PLPRD.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN PLPRD.NUMPRP TEXT IS 'Número Propuesta';
LABEL ON COLUMN PLPRD.CODPRD TEXT IS 'Código Producto';
LABEL ON COLUMN PLPRD.TIPPRD TEXT IS 'Tipo Producto';
LABEL ON COLUMN PLPRD.FECPRP TEXT IS 'Fecha Propuesta';
LABEL ON COLUMN PLPRD.MNTSOL TEXT IS 'Monto Solicitado';
LABEL ON COLUMN PLPRD.PLZMES TEXT IS 'Plazo Meses';
LABEL ON COLUMN PLPRD.TASPRP TEXT IS 'Tasa Propuesta';
LABEL ON COLUMN PLPRD.DICCRT TEXT IS 'Dictamen Crédito';
LABEL ON COLUMN PLPRD.ESTPRP TEXT IS 'Estado Propuesta';
LABEL ON COLUMN PLPRD.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN PLPRD.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN PLPRD.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN PLPRD.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN PLPRD.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN PLPRD.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN PLPRD.FECACT TEXT IS 'Fecha Actualiza';

--======================================================================
-- Índices
--======================================================================
-- Índice sobre claves naturales numero_propuesta y codigo_producto.
-- Justificación: búsquedas frecuentes por propuesta y producto.
CREATE INDEX IX_PLPRD_NUMPRP_CODPRD ON PLPRD (NUMPRP, CODPRD);

-- Índice sobre fecha de ingreso.
-- Justificación: ordenamiento y filtrado cronológico de productos.
CREATE INDEX IX_PLPRD_FECING ON PLPRD (FECING);
