--======================================================================
-- Nombre de la Tabla : IFMST - FINANZAS_JURIDICA
--
-- DESCRIPCIÓN:
-- Cabecera de Declaración Patrimonial de Personas Jurídicas.
-- Registra la información financiera de propuestas crediticias de
-- personas jurídicas (empresas) basadas en sus estados financieros,
-- incluyendo montos solicitados, plazos, tasas y dictamenes.
--
-- Objetivo:
-- Centralizar el catálogo de información financiera de personas
-- jurídicas como referencia para evaluación crediticia empresarial.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Solicitudes crediticias de personas jurídicas con estados
-- financieros.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Referenciado por IFDTL (Detalle de Información Financiera)
-- para registro de líneas de balance y cuentas contables.
--
-- Restricciones:
-- PK compuesta: id_cliente, ANIFIZ, mes, formato_balance.
-- ESTADO_REGISTRO solo acepta A o I.
-- Auditoría estándar en español aplicada.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-06
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE IFMST (

    NUM_CLIENTE FOR COLUMN NUMCLI VARCHAR(30)
                   NOT NULL,

    ANIO_FINANZA FOR COLUMN ANIFIZ INTEGER
              NOT NULL,

    MES_FINANZA FOR COLUMN MESFIZ INTEGER
           NOT NULL,

    FORMATO_BALANCE FOR COLUMN FORBAL VARCHAR(50)
                        NOT NULL,

    FECHA_PROPUESTA FOR COLUMN FECPRP DATE
                        NOT NULL DEFAULT '0001-01-01',

    MONTO_SOLICITADO FOR COLUMN MONSOL DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,

    PLAZO_MESES FOR COLUMN PLZMES INTEGER
                    NOT NULL DEFAULT 0,

    TASA_PROPUESTA FOR COLUMN TASPRP DECIMAL(18, 2)
                       NOT NULL DEFAULT 0,

    DICTAMEN_CREDITO FOR COLUMN DICCRT VARCHAR(120)
                         NOT NULL DEFAULT '',

    ESTADO_PROPUESTA FOR COLUMN ESTPRP VARCHAR(20)
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

    CONSTRAINT IFMST_PK PRIMARY KEY (NUMCLI, ANIFIZ, MESFIZ, FORBAL),

    CONSTRAINT IFMST_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RIFMST;

RENAME TABLE IFMST
TO FINANZAS_JURIDICA
FOR SYSTEM NAME IFMST;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE IFMST IS
'FINANZAS_JURIDICA';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN IFMST.NUMCLI IS
'Identificador del cliente.';

COMMENT ON COLUMN IFMST.ANIFIZ IS
'Año de los estados financieros..';

COMMENT ON COLUMN IFMST.MESFIZ IS
'Mes de los estados financieros.';

COMMENT ON COLUMN IFMST.FORBAL IS
'Formato de balance utilizado.';

COMMENT ON COLUMN IFMST.FECPRP IS
'Fecha de presentación de la información financiera.';

COMMENT ON COLUMN IFMST.MONSOL IS
'Monto solicitado basado en los estados financieros.';

COMMENT ON COLUMN IFMST.PLZMES IS
'Plazo solicitado expresado en meses.';

COMMENT ON COLUMN IFMST.TASPRP IS
'Tasa de interés propuesta para el crédito.';

COMMENT ON COLUMN IFMST.DICCRT IS
'Dictamen o análisis de los estados financieros.';

COMMENT ON COLUMN IFMST.ESTPRP IS
'Estado de la propuesta financiera.';

COMMENT ON COLUMN IFMST.OBSREG IS
'Observaciones adicionales de la información.';

COMMENT ON COLUMN IFMST.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN IFMST.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN IFMST.USRING IS
'Usuario que creó el registro.';

COMMENT ON COLUMN IFMST.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN IFMST.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN IFMST.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE IFMST IS 'FINANZAS_JURIDICA';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN IFMST.NUMCLI  IS 'ID Cliente';
LABEL ON COLUMN IFMST.ANIFIZ  IS 'Año';
LABEL ON COLUMN IFMST.MESFIZ  IS 'Mes';
LABEL ON COLUMN IFMST.FORBAL  IS 'Formato Balance';
LABEL ON COLUMN IFMST.FECPRP  IS 'Fecha Propuesta';
LABEL ON COLUMN IFMST.MONSOL  IS 'Monto Solicitado';
LABEL ON COLUMN IFMST.PLZMES  IS 'Plazo Meses';
LABEL ON COLUMN IFMST.TASPRP  IS 'Tasa Propuesta';
LABEL ON COLUMN IFMST.DICCRT  IS 'Dictamen Crédito';
LABEL ON COLUMN IFMST.ESTPRP IS 'Estado Propuesta';
LABEL ON COLUMN IFMST.OBSREG  IS 'Observaciones';
LABEL ON COLUMN IFMST.VERREG  IS 'Versión Registro';
LABEL ON COLUMN IFMST.ESTREG  IS 'Estado Registro';
LABEL ON COLUMN IFMST.USRING  IS 'Usuario Creación';
LABEL ON COLUMN IFMST.FECING  IS 'Fecha Creación';
LABEL ON COLUMN IFMST.USRACT  IS 'Usuario Actualiza';
LABEL ON COLUMN IFMST.FECACT  IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN IFMST.NUMCLI  TEXT IS 'ID Cliente';
LABEL ON COLUMN IFMST.ANIFIZ  TEXT IS 'Año';
LABEL ON COLUMN IFMST.MESFIZ  TEXT IS 'Mes';
LABEL ON COLUMN IFMST.FORBAL  TEXT IS 'Formato Balance';
LABEL ON COLUMN IFMST.FECPRP  TEXT IS 'Fecha Propuesta';
LABEL ON COLUMN IFMST.MONSOL  TEXT IS 'Monto Solicitado';
LABEL ON COLUMN IFMST.PLZMES  TEXT IS 'Plazo Meses';
LABEL ON COLUMN IFMST.TASPRP  TEXT IS 'Tasa Propuesta';
LABEL ON COLUMN IFMST.DICCRT  TEXT IS 'Dictamen Crédito';
LABEL ON COLUMN IFMST.ESTPRP  TEXT IS 'Estado Propuesta';
LABEL ON COLUMN IFMST.OBSREG  TEXT IS 'Observaciones';
LABEL ON COLUMN IFMST.VERREG  TEXT IS 'Versión Registro';
LABEL ON COLUMN IFMST.ESTREG  TEXT IS 'Estado Registro';
LABEL ON COLUMN IFMST.USRING  TEXT IS 'Usuario Creación';
LABEL ON COLUMN IFMST.FECING  TEXT IS 'Fecha Creación';
LABEL ON COLUMN IFMST.USRACT  TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN IFMST.FECACT  TEXT IS 'Fecha Actualiza';