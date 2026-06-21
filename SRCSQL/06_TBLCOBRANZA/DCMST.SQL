--======================================================================
-- Nombre de la Tabla : DCMST - MAESTRO_COBRANZA_DOC
--
-- DESCRIPCIÓN:
-- Maestro de Cobranzas Documentarias. Registra documentos en cobranza y
-- su estado.
--
-- Objetivo:
-- Mantener el catálogo de cobranzas documentarias.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Procesos de cobranza documental.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Control de documentos en cobranza y reportes.
--
-- Restricciones:
-- PK técnica sobre id.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-21
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE DCMST (

    ID_REGISTRO FOR COLUMN IDNREG BIGINT
               NOT NULL GENERATED ALWAYS AS IDENTITY
               (START WITH 1, INCREMENT BY 1),

    FECHA_RECEPCION FOR COLUMN FECRCP DATE
                        NOT NULL DEFAULT '0001-01-01',

    FECHA_VENCIMIENTO FOR COLUMN FECVEN DATE
                         NOT NULL DEFAULT '0001-01-01',

    MONTO_ORIGINAL FOR COLUMN MNTORI DECIMAL(18, 2)
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

    CONSTRAINT DCMST_PK PRIMARY KEY (IDNREG),

    CONSTRAINT DCMST_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RDCMST;

RENAME TABLE DCMST
TO MAESTRO_COBRANZA_DOC
FOR SYSTEM NAME DCMST;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE DCMST IS
'MAESTRO_COBRANZA_DOC';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN DCMST.IDNREG IS
'Identificador único del registro.';

COMMENT ON COLUMN DCMST.FECRCP IS
'Fecha de recepción del documento.';

COMMENT ON COLUMN DCMST.FECVEN IS
'Fecha de vencimiento del documento.';

COMMENT ON COLUMN DCMST.MNTORI IS
'Monto original del documento.';

COMMENT ON COLUMN DCMST.SLDPND IS
'Saldo pendiente de la cobranza.';

COMMENT ON COLUMN DCMST.TIPDOC IS
'Tipo de documento.';

COMMENT ON COLUMN DCMST.ESTOPE IS
'Estado de la operación.';

COMMENT ON COLUMN DCMST.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN DCMST.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN DCMST.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN DCMST.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN DCMST.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN DCMST.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN DCMST.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE DCMST IS 'MAESTRO_COBRANZA_DOC';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN DCMST.IDNREG IS 'ID Registro';
LABEL ON COLUMN DCMST.FECRCP IS 'Fecha Recepción';
LABEL ON COLUMN DCMST.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN DCMST.MNTORI IS 'Monto Original';
LABEL ON COLUMN DCMST.SLDPND IS 'Saldo Pendiente';
LABEL ON COLUMN DCMST.TIPDOC IS 'Tipo Documento';
LABEL ON COLUMN DCMST.ESTOPE IS 'Estado Operación';
LABEL ON COLUMN DCMST.VERREG IS 'Versión Registro';
LABEL ON COLUMN DCMST.OBSREG IS 'Observaciones';
LABEL ON COLUMN DCMST.ESTREG IS 'Estado Registro';
LABEL ON COLUMN DCMST.USRING IS 'Usuario Creación';
LABEL ON COLUMN DCMST.FECING IS 'Fecha Creación';
LABEL ON COLUMN DCMST.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN DCMST.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN DCMST.IDNREG TEXT IS 'ID Registro';
LABEL ON COLUMN DCMST.FECRCP TEXT IS 'Fecha Recepción';
LABEL ON COLUMN DCMST.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN DCMST.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN DCMST.SLDPND TEXT IS 'Saldo Pendiente';
LABEL ON COLUMN DCMST.TIPDOC TEXT IS 'Tipo Documento';
LABEL ON COLUMN DCMST.ESTOPE TEXT IS 'Estado Operación';
LABEL ON COLUMN DCMST.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN DCMST.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN DCMST.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN DCMST.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN DCMST.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN DCMST.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN DCMST.FECACT TEXT IS 'Fecha Actualiza';
