--======================================================================
-- Nombre de la Tabla : LCFIN - INDICE_FORMATOS_CRED
--
-- DESCRIPCIÓN:
-- Índice de Formatos de Cartas de Crédito. Define el índice de los
-- formatos disponibles por nivel y documento.
--
-- Objetivo:
-- Mantener la referencia de formatos para cartas de crédito.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Definición de formatos de carta de crédito.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Lookup y generación de documentos de crédito.
--
-- Restricciones:
-- PK sobre nivel, código de documento y secuencia de texto.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-19
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE LCFIN (

    NIVEL_FORMATO FOR COLUMN NVLFRM INTEGER
                    NOT NULL,

    COD_DOCUMENTO FOR COLUMN CODDOC VARCHAR(20)
                             NOT NULL,

    SECUENCIA_TEXTO FOR COLUMN SECTXT VARCHAR(50)
                                  NOT NULL,

    FECHA_EMISION FOR COLUMN FECEMS DATE
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

    ESTADO_CARTA FOR COLUMN ESTCRT VARCHAR(20)
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

    CONSTRAINT LCFIN_PK PRIMARY KEY (NVLFRM, CODDOC, SECTXT),

    CONSTRAINT LCFIN_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RLCFIN;

RENAME TABLE LCFIN
TO INDICE_FORMATOS_CRED
FOR SYSTEM NAME LCFIN;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE LCFIN IS
'INDICE_FORMATOS_CRED';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN LCFIN.NVLFRM IS
'Nivel del índice de formato.';

COMMENT ON COLUMN LCFIN.CODDOC IS
'Código del documento.';

COMMENT ON COLUMN LCFIN.SECTXT IS
'Secuencia de texto del formato.';

COMMENT ON COLUMN LCFIN.FECEMS IS
'Fecha de emisión.';

COMMENT ON COLUMN LCFIN.FECVEN IS
'Fecha de vencimiento.';

COMMENT ON COLUMN LCFIN.MNTORI IS
'Monto original de la operación.';

COMMENT ON COLUMN LCFIN.SLDACT IS
'Saldo actual de la operación.';

COMMENT ON COLUMN LCFIN.BCOCRR IS
'Banco corresponsal.';

COMMENT ON COLUMN LCFIN.PAIDST IS
'País de destino.';

COMMENT ON COLUMN LCFIN.ESTCRT IS
'Estado de la carta.';

COMMENT ON COLUMN LCFIN.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN LCFIN.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN LCFIN.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN LCFIN.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN LCFIN.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN LCFIN.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN LCFIN.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE LCFIN IS 'INDICE_FORMATOS_CRED';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN LCFIN.NVLFRM IS 'Nivel';
LABEL ON COLUMN LCFIN.CODDOC IS 'Código Documento';
LABEL ON COLUMN LCFIN.SECTXT IS 'Secuencia Texto';
LABEL ON COLUMN LCFIN.FECEMS IS 'Fecha Emisión';
LABEL ON COLUMN LCFIN.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN LCFIN.MNTORI IS 'Monto Original';
LABEL ON COLUMN LCFIN.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN LCFIN.BCOCRR IS 'Banco Corresponsal';
LABEL ON COLUMN LCFIN.PAIDST IS 'País Destino';
LABEL ON COLUMN LCFIN.ESTCRT IS 'Estado Carta';
LABEL ON COLUMN LCFIN.VERREG IS 'Versión Registro';
LABEL ON COLUMN LCFIN.OBSREG IS 'Observaciones';
LABEL ON COLUMN LCFIN.ESTREG IS 'Estado Registro';
LABEL ON COLUMN LCFIN.USRING IS 'Usuario Creación';
LABEL ON COLUMN LCFIN.FECING IS 'Fecha Creación';
LABEL ON COLUMN LCFIN.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN LCFIN.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN LCFIN.NVLFRM TEXT IS 'Nivel';
LABEL ON COLUMN LCFIN.CODDOC TEXT IS 'Código Documento';
LABEL ON COLUMN LCFIN.SECTXT TEXT IS 'Secuencia Texto';
LABEL ON COLUMN LCFIN.FECEMS TEXT IS 'Fecha Emisión';
LABEL ON COLUMN LCFIN.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN LCFIN.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN LCFIN.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN LCFIN.BCOCRR TEXT IS 'Banco Corresponsal';
LABEL ON COLUMN LCFIN.PAIDST TEXT IS 'País Destino';
LABEL ON COLUMN LCFIN.ESTCRT TEXT IS 'Estado Carta';
LABEL ON COLUMN LCFIN.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN LCFIN.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN LCFIN.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN LCFIN.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN LCFIN.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN LCFIN.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN LCFIN.FECACT TEXT IS 'Fecha Actualiza';