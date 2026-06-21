--======================================================================
-- Nombre de la Tabla : CNTRLRLC - CARGOS_SRV_CARTA_CRT
--
-- DESCRIPCIÓN:
-- Tabla de Cargos por Servicios o Tarifas de Cartas de Crédito.
-- Contiene tasas y cargos por tipo de producto y tabla.
--
-- Objetivo:
-- Centralizar los cargos y tarifas aplicables a cartas de crédito.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Parámetros de servicio de cartas de crédito.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Cálculo de tarifas y generación de cargos.
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

CREATE OR REPLACE TABLE CNTRLRLC (

    CODIGO_BANCO FOR COLUMN CODBCO NUMERIC(3, 0)
                     NOT NULL,

    TIPO_PRODUCTO FOR COLUMN TIPPRD VARCHAR(20)
                       NOT NULL,

    NUMERO_TABLA FOR COLUMN NUMTAB VARCHAR(30)
                       NOT NULL,

    FECHA_EMISION FOR COLUMN FECEMI DATE
                        NOT NULL DEFAULT '0001-01-01',

    FECHA_VENCIMIENTO FOR COLUMN FECVEN DATE
                         NOT NULL DEFAULT '0001-01-01',

    MONTO_ORIGINAL FOR COLUMN MNTORI DECIMAL(18, 2)
                         NOT NULL DEFAULT 0,

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                     NOT NULL DEFAULT 0,

    BANCO_CORRESPONSAL FOR COLUMN BCOCRR VARCHAR(80)
                              NOT NULL DEFAULT '',

    PAIS_DESTINO FOR COLUMN PAIDST VARCHAR(80)
                         NOT NULL DEFAULT '',

    ESTADO_CARTA FOR COLUMN ESTCAR VARCHAR(20)
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

    CONSTRAINT CNTRLRLC_PK PRIMARY KEY (CODBCO, TIPPRD, NUMTAB),

    CONSTRAINT CNTRLRLC_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RCNTRLRLC;

RENAME TABLE CNTRLRLC
TO CARGOS_SRV_CARTA_CRT
FOR SYSTEM NAME CNTRLRLC;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE CNTRLRLC IS
'CARGOS_SRV_CARTA_CRT';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN CNTRLRLC.CODBCO IS
'Código del banco.';

COMMENT ON COLUMN CNTRLRLC.TIPPRD IS
'Tipo de producto.';

COMMENT ON COLUMN CNTRLRLC.NUMTAB IS
'Número de tabla de tarifas.';

COMMENT ON COLUMN CNTRLRLC.FECEMI IS
'Fecha de emisión.';

COMMENT ON COLUMN CNTRLRLC.FECVEN IS
'Fecha de vencimiento.';

COMMENT ON COLUMN CNTRLRLC.MNTORI IS
'Monto original de la operación.';

COMMENT ON COLUMN CNTRLRLC.SLDACT IS
'Saldo actual de la operación.';

COMMENT ON COLUMN CNTRLRLC.BCOCRR IS
'Banco corresponsal.';

COMMENT ON COLUMN CNTRLRLC.PAIDST IS
'País de destino.';

COMMENT ON COLUMN CNTRLRLC.ESTCAR IS
'Estado de la carta.';

COMMENT ON COLUMN CNTRLRLC.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN CNTRLRLC.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN CNTRLRLC.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN CNTRLRLC.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN CNTRLRLC.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN CNTRLRLC.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN CNTRLRLC.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE CNTRLRLC IS 'CARGOS_SRV_CARTA_CRT';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN CNTRLRLC.CODBCO IS 'Código Banco';
LABEL ON COLUMN CNTRLRLC.TIPPRD IS 'Tipo Producto';
LABEL ON COLUMN CNTRLRLC.NUMTAB IS 'Número Tabla';
LABEL ON COLUMN CNTRLRLC.FECEMI IS 'Fecha Emisión';
LABEL ON COLUMN CNTRLRLC.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN CNTRLRLC.MNTORI IS 'Monto Original';
LABEL ON COLUMN CNTRLRLC.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN CNTRLRLC.BCOCRR IS 'Banco Corresponsal';
LABEL ON COLUMN CNTRLRLC.PAIDST IS 'País Destino';
LABEL ON COLUMN CNTRLRLC.ESTCAR IS 'Estado Carta';
LABEL ON COLUMN CNTRLRLC.VERREG IS 'Versión Registro';
LABEL ON COLUMN CNTRLRLC.OBSREG IS 'Observaciones';
LABEL ON COLUMN CNTRLRLC.ESTREG IS 'Estado Registro';
LABEL ON COLUMN CNTRLRLC.USRING IS 'Usuario Creación';
LABEL ON COLUMN CNTRLRLC.FECING IS 'Fecha Creación';
LABEL ON COLUMN CNTRLRLC.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLRLC.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN CNTRLRLC.CODBCO TEXT IS 'Código Banco';
LABEL ON COLUMN CNTRLRLC.TIPPRD TEXT IS 'Tipo Producto';
LABEL ON COLUMN CNTRLRLC.NUMTAB TEXT IS 'Número Tabla';
LABEL ON COLUMN CNTRLRLC.FECEMI TEXT IS 'Fecha Emisión';
LABEL ON COLUMN CNTRLRLC.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN CNTRLRLC.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN CNTRLRLC.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN CNTRLRLC.BCOCRR TEXT IS 'Banco Corresponsal';
LABEL ON COLUMN CNTRLRLC.PAIDST TEXT IS 'País Destino';
LABEL ON COLUMN CNTRLRLC.ESTCAR TEXT IS 'Estado Carta';
LABEL ON COLUMN CNTRLRLC.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN CNTRLRLC.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN CNTRLRLC.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN CNTRLRLC.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN CNTRLRLC.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN CNTRLRLC.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN CNTRLRLC.FECACT TEXT IS 'Fecha Actualiza';
