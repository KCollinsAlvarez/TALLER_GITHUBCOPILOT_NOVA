--======================================================================
-- Nombre de la Tabla : CNTRLRCO - CARGOS_SRV_COBRANZAS
--
-- DESCRIPCIÓN:
-- Tabla de Cargos por Servicios o Tarifas de Cobranzas. Registra cargos
-- aplicables por banco y tipo de producto.
--
-- Objetivo:
-- Centralizar tarifas y cargos de cobranza.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Parámetros de cobranza y servicios.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Cálculo de cargos y control de tarifas.
--
-- Restricciones:
-- PK sobre banco y tipo de producto.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-21
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CNTRLRCO (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    TIPO_PRODUCTO FOR COLUMN TIPPRO VARCHAR(20)
                       NOT NULL,

    NUMERO_TABLA FOR COLUMN NUMTAB VARCHAR(30)
                       NOT NULL,

    FECHA_RECEPCION FOR COLUMN FECRCP DATE
                        NOT NULL DEFAULT '0001-01-01',

    FECHA_VENCIMIENTO FOR COLUMN FECVEN DATE
                         NOT NULL DEFAULT '0001-01-01',

    MONTO_ORIGINAL FOR COLUMN MONORI DECIMAL(18, 2)
                         NOT NULL DEFAULT 0,

    SALDO_PENDIENTE FOR COLUMN SLDPND DECIMAL(18, 2)
                         NOT NULL DEFAULT 0,

    TIPO_DOCUMENTO FOR COLUMN TIPDOC VARCHAR(20)
                           NOT NULL DEFAULT '',

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

    CONSTRAINT CNTRLRCO_PK PRIMARY KEY (CODBCO, TIPPRO, NUMTAB),

    CONSTRAINT CNTRLRCO_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCNTRLRCO;

RENAME TABLE CNTRLRCO
TO CARGOS_SRV_COBRANZAS
FOR SYSTEM NAME CNTRLRCO;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CNTRLRCO IS
'CARGOS_SRV_COBRANZAS';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CNTRLRCO.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN CNTRLRCO.TIPPRO IS
'Tipo de producto.';

COMMENT ON COLUMN CNTRLRCO.NUMTAB IS
'Número de tabla de tarifas.';

COMMENT ON COLUMN CNTRLRCO.FECRCP IS
'Fecha de recepción.';

COMMENT ON COLUMN CNTRLRCO.FECVEN IS
'Fecha de vencimiento.';

COMMENT ON COLUMN CNTRLRCO.MONORI IS
'Monto original de la operación.';

COMMENT ON COLUMN CNTRLRCO.SLDPND IS
'Saldo pendiente de la operación.';

COMMENT ON COLUMN CNTRLRCO.TIPDOC IS
'Tipo de documento.';

COMMENT ON COLUMN CNTRLRCO.ESTOPE IS
'Estado de la operación.';

COMMENT ON COLUMN CNTRLRCO.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN CNTRLRCO.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN CNTRLRCO.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN CNTRLRCO.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN CNTRLRCO.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN CNTRLRCO.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN CNTRLRCO.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CNTRLRCO IS 'CARGOS_SRV_COBRANZAS';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CNTRLRCO.CODBCO IS 'Código Banco';
LABEL ON COLUMN CNTRLRCO.TIPPRO IS 'Tipo Producto';
LABEL ON COLUMN CNTRLRCO.NUMTAB IS 'Número Tabla';
LABEL ON COLUMN CNTRLRCO.FECRCP IS 'Fecha Recepción';
LABEL ON COLUMN CNTRLRCO.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN CNTRLRCO.MONORI IS 'Monto Original';
LABEL ON COLUMN CNTRLRCO.SLDPND IS 'Saldo Pendiente';
LABEL ON COLUMN CNTRLRCO.TIPDOC IS 'Tipo Documento';
LABEL ON COLUMN CNTRLRCO.ESTOPE IS 'Estado Operación';
LABEL ON COLUMN CNTRLRCO.VERREG IS 'Versión Registro';
LABEL ON COLUMN CNTRLRCO.OBSREG IS 'Observaciones';
LABEL ON COLUMN CNTRLRCO.ESTREG IS 'Estado Registro';
LABEL ON COLUMN CNTRLRCO.USRING IS 'Usuario Creación';
LABEL ON COLUMN CNTRLRCO.FECING IS 'Fecha Creación';
LABEL ON COLUMN CNTRLRCO.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLRCO.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CNTRLRCO.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN CNTRLRCO.TIPPRO TEXT IS 'Tipo Producto';
LABEL ON COLUMN CNTRLRCO.NUMTAB TEXT IS 'Número Tabla';
LABEL ON COLUMN CNTRLRCO.FECRCP TEXT IS 'Fecha Recepción';
LABEL ON COLUMN CNTRLRCO.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN CNTRLRCO.MONORI TEXT IS 'Monto Original';
LABEL ON COLUMN CNTRLRCO.SLDPND TEXT IS 'Saldo Pendiente';
LABEL ON COLUMN CNTRLRCO.TIPDOC TEXT IS 'Tipo Documento';
LABEL ON COLUMN CNTRLRCO.ESTOPE TEXT IS 'Estado Operación';
LABEL ON COLUMN CNTRLRCO.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN CNTRLRCO.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN CNTRLRCO.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN CNTRLRCO.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN CNTRLRCO.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN CNTRLRCO.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLRCO.FECACT TEXT IS 'Fecha Actualiza';
