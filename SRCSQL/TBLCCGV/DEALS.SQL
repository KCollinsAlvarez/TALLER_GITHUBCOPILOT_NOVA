--======================================================================
-- Nombre de la Tabla : DEALS - CONTRATOS_PRESTAMOS
--
-- DESCRIPCIÓN:
-- Maestro de Préstamos, Certificados, Giros, Valores al Cobro
-- e Inversiones. Registra los contratos y operaciones de crédito
-- del banco, incluyendo montos, tasas de interés, plazos y estado
-- de cada operación asociada a clientes.
--
-- Objetivo:
-- Centralizar el catálogo de préstamos y contratos como referencia
-- principal para operaciones crediticias y análisis de cartera.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Operaciones de desembolso de créditos y gestión de contratos.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referenciado por DLPMT, DLDRF, DLSDE, DLITP y DDCPN para
-- validación y registro de pagos, deducciones y detalles.
--
-- Restricciones:
-- PK técnica: id BIGINT GENERATED ALWAYS AS IDENTITY.
-- UNIQUE sobre numero_prestamo (clave de negocio).
-- FK a CUMST.id_cliente (referencia a maestro de clientes).
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-05
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE DEALS (

    ID_REGISTRO FOR COLUMN IDEREG BIGINT
           GENERATED ALWAYS AS IDENTITY
           NOT NULL,

    NUMERO_PRESTAMO FOR COLUMN NUMPRS VARCHAR(30)
                        NOT NULL,

    FECHA_DESEMBOLSO FOR COLUMN FECDSB DATE
                         NOT NULL DEFAULT '0001-01-01',

    FECHA_VENCIMIENTO FOR COLUMN FECVEN DATE
                          NOT NULL DEFAULT '0001-01-01',

    MONTO_ORIGINAL FOR COLUMN MONTOG DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                    NOT NULL DEFAULT 0,

    TASA_INTERES FOR COLUMN TASINT DECIMAL(18, 2)
                    NOT NULL DEFAULT 0,

    PLAZO_MESES FOR COLUMN PLZMES INTEGER
                    NOT NULL DEFAULT 0,

    DIAS_MORA FOR COLUMN DIAMOR INTEGER
                  NOT NULL DEFAULT 0,

    ESTADO_OPERACION FOR COLUMN ESTOPE VARCHAR(20)
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

    CONSTRAINT DEALS_PK PRIMARY KEY (IDEREG),

    CONSTRAINT UK_DEALS_NUMPRS UNIQUE (NUMPRS),

    CONSTRAINT DEALS_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RDEALS;

RENAME TABLE DEALS
TO CONTRATOS_PRESTAMOS
FOR SYSTEM NAME DEALS;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE DEALS IS
'CONTRATOS_PRESTAMOS';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN DEALS.IDEREG IS
'Identificador técnico único. ';

COMMENT ON COLUMN DEALS.NUMPRS IS
'Número del préstamo o contrato.';


COMMENT ON COLUMN DEALS.FECDSB IS
'Fecha de desembolso del préstamo.';

COMMENT ON COLUMN DEALS.FECVEN IS
'Fecha de vencimiento del préstamo.';

COMMENT ON COLUMN DEALS.MONTOG IS
'Monto original desembolsado del préstamo.';

COMMENT ON COLUMN DEALS.SLDACT IS
'Saldo actual del préstamo.';

COMMENT ON COLUMN DEALS.TASINT IS
'Tasa de interés aplicable al préstamo.';

COMMENT ON COLUMN DEALS.PLZMES IS
'Plazo del préstamo expresado en meses.';

COMMENT ON COLUMN DEALS.DIAMOR IS
'Días de mora acumulados en el préstamo.';

COMMENT ON COLUMN DEALS.ESTOPE IS
'Estado operativo del préstamo o contrato.';

COMMENT ON COLUMN DEALS.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN DEALS.OBSREG IS
'Observaciones adicionales del préstamo.';

COMMENT ON COLUMN DEALS.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN DEALS.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN DEALS.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN DEALS.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN DEALS.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE DEALS IS 'CONTRATOS_PRESTAMOS';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN DEALS.IDEREG  IS 'ID Técnico';
LABEL ON COLUMN DEALS.NUMPRS  IS 'Número Préstamo';
LABEL ON COLUMN DEALS.FECDSB  IS 'Fecha Desembolso';
LABEL ON COLUMN DEALS.FECVEN  IS 'Fecha Vencimiento';
LABEL ON COLUMN DEALS.MONTOG  IS 'Monto Original';
LABEL ON COLUMN DEALS.SLDACT  IS 'Saldo Actual';
LABEL ON COLUMN DEALS.TASINT  IS 'Tasa Interés';
LABEL ON COLUMN DEALS.PLZMES  IS 'Plazo Meses';
LABEL ON COLUMN DEALS.DIAMOR  IS 'Días Mora';
LABEL ON COLUMN DEALS.ESTOPE  IS 'Estado Operación';
LABEL ON COLUMN DEALS.VERREG  IS 'Versión Registro';
LABEL ON COLUMN DEALS.OBSREG  IS 'Observaciones';
LABEL ON COLUMN DEALS.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN DEALS.USRING  IS 'Usuario Creación';
LABEL ON COLUMN DEALS.FECING  IS 'Fecha Creación';
LABEL ON COLUMN DEALS.USRACT  IS 'Usuario Actualiza';
LABEL ON COLUMN DEALS.FECACT  IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN DEALS.IDEREG  TEXT IS 'ID Técnico';
LABEL ON COLUMN DEALS.NUMPRS  TEXT IS 'Número Préstamo';
LABEL ON COLUMN DEALS.FECDSB  TEXT IS 'Fecha Desembolso';
LABEL ON COLUMN DEALS.FECVEN  TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN DEALS.MONTOG  TEXT IS 'Monto Original';
LABEL ON COLUMN DEALS.SLDACT  TEXT IS 'Saldo Actual';
LABEL ON COLUMN DEALS.TASINT  TEXT IS 'Tasa Interés';
LABEL ON COLUMN DEALS.PLZMES  TEXT IS 'Plazo Meses';
LABEL ON COLUMN DEALS.DIAMOR  TEXT IS 'Días Mora';
LABEL ON COLUMN DEALS.ESTOPE  TEXT IS 'Estado Operación';
LABEL ON COLUMN DEALS.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN DEALS.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN DEALS.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN DEALS.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN DEALS.FECING  TEXT IS 'Fecha Creación';
LABEL ON COLUMN DEALS.USRACT  TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN DEALS.FECACT  TEXT IS 'Fecha Actualiza';

--======================================================================
-- Índices
--======================================================================
-- Índice sobre clave de negocio numero_prestamo.
-- Justificación: búsquedas de préstamos por número; tablas hijas
-- DLPMT, DLDRF, DLSDE, DLITP, DDCPN referencian esta columna via FK
-- (RI-004).
CREATE INDEX IX_DEALS_NUMPRS ON DEALS (NUMPRS);