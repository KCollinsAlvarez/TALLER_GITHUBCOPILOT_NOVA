--======================================================================
-- Nombre de la Tabla : LCSTA - ESTADISTICAS_CREDITO
--
-- DESCRIPCIÓN:
-- Estadística de Aperturas, Enmiendas, Pagos en Cartas de Crédito.
-- Registra métricas y totales relacionados con las cartas emitidas.
--
-- Objetivo:
-- Mantener estadísticas históricas de cartas de crédito.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Proceso de cálculo y reporte de estadísticas.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Informes de gestión y análisis de operaciones de crédito.
--
-- Restricciones:
-- PK técnica sobre id.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-19
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE LCSTA (

    ID_REGISTROS FOR COLUMN IDNREG BIGINT
               NOT NULL GENERATED ALWAYS AS IDENTITY
               (START WITH 1, INCREMENT BY 1),

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

    CONSTRAINT LCSTA_PK PRIMARY KEY (IDNREG),

    CONSTRAINT LCSTA_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RLCSTA;

RENAME TABLE LCSTA
TO ESTADISTICAS_CREDITO
FOR SYSTEM NAME LCSTA;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE LCSTA IS
'ESTADISTICAS_CREDITO';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN LCSTA.IDNREG IS
'Identificador único de la estadística.';

COMMENT ON COLUMN LCSTA.FECEMI IS
'Fecha de emisión.';

COMMENT ON COLUMN LCSTA.FECVEN IS
'Fecha de vencimiento.';

COMMENT ON COLUMN LCSTA.MNTORI IS
'Monto original de la operación.';

COMMENT ON COLUMN LCSTA.SLDACT IS
'Saldo actual de la operación.';

COMMENT ON COLUMN LCSTA.BCOCRR IS
'Banco corresponsal.';

COMMENT ON COLUMN LCSTA.PAIDST IS
'País de destino.';

COMMENT ON COLUMN LCSTA.ESTCAR IS
'Estado de la carta.';

COMMENT ON COLUMN LCSTA.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN LCSTA.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN LCSTA.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN LCSTA.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN LCSTA.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN LCSTA.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN LCSTA.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE LCSTA IS 'ESTADISTICAS_CREDITO';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN LCSTA.IDNREG IS 'ID Registro';
LABEL ON COLUMN LCSTA.FECEMI IS 'Fecha Emisión';
LABEL ON COLUMN LCSTA.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN LCSTA.MNTORI IS 'Monto Original';
LABEL ON COLUMN LCSTA.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN LCSTA.BCOCRR IS 'Banco Corresponsal';
LABEL ON COLUMN LCSTA.PAIDST IS 'País Destino';
LABEL ON COLUMN LCSTA.ESTCAR IS 'Estado Carta';
LABEL ON COLUMN LCSTA.VERREG IS 'Versión Registro';
LABEL ON COLUMN LCSTA.OBSREG IS 'Observaciones';
LABEL ON COLUMN LCSTA.ESTREG IS 'Estado Registro';
LABEL ON COLUMN LCSTA.USRING IS 'Usuario Creación';
LABEL ON COLUMN LCSTA.FECING IS 'Fecha Creación';
LABEL ON COLUMN LCSTA.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN LCSTA.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN LCSTA.IDNREG TEXT IS 'ID Registro';
LABEL ON COLUMN LCSTA.FECEMI TEXT IS 'Fecha Emisión';
LABEL ON COLUMN LCSTA.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN LCSTA.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN LCSTA.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN LCSTA.BCOCRR TEXT IS 'Banco Corresponsal';
LABEL ON COLUMN LCSTA.PAIDST TEXT IS 'País Destino';
LABEL ON COLUMN LCSTA.ESTCAR TEXT IS 'Estado Carta';
LABEL ON COLUMN LCSTA.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN LCSTA.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN LCSTA.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN LCSTA.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN LCSTA.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN LCSTA.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN LCSTA.FECACT TEXT IS 'Fecha Actualiza';
