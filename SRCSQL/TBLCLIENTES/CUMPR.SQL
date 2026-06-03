--======================================================================
-- Nombre de la Tabla : CUMPR - PALABRAS_RESERVADAS
--
-- DESCRIPCIÓN:
-- Archivo Maestro de Palabras Reservadas que se omiten en búsquedas
-- por string de caracteres. Registra términos que deben excluirse en
-- búsquedas de clientes.
--
-- Objetivo:
-- Mantener el catálogo de palabras reservadas para motores de búsqueda.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Mantenimiento administrativo y gobernanza de búsqueda.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte a procesos de búsqueda y normalización de nombres.
--
-- Restricciones:
-- PK simple en `PALABR`; auditoría con nomenclatura estándar en español.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-02
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CUMPR (
    PALABRA_RESERVADA FOR COLUMN PLBRES VARCHAR(50)
                        NOT NULL,
    TIPO_PERSONA FOR COLUMN TIPPER VARCHAR(20)
                        NOT NULL DEFAULT '',
    TIPO_IDENTIFICACION FOR COLUMN TIPIDE VARCHAR(20)
                        NOT NULL DEFAULT '',
    NUM_IDENTIFICACION FOR COLUMN NUMIDE VARCHAR(30)
                        NOT NULL DEFAULT '',
    NOMBRE_CLIENTE FOR COLUMN NOMCLI VARCHAR(80)
                        NOT NULL DEFAULT '',
    APELLIDO_CLIENTE FOR COLUMN APECLI VARCHAR(80)
                        NOT NULL DEFAULT '',
    RAZON_SOCIAL FOR COLUMN RAZSOC VARCHAR(80)
                        NOT NULL DEFAULT '',
    FECHA_NACIMIENTO FOR COLUMN FECNAC DATE
                        NOT NULL DEFAULT '0001-01-01',
    DIRECCION_CLIENTE FOR COLUMN DIRCLI VARCHAR(120)
                        NOT NULL DEFAULT '',
    EMAIL FOR COLUMN EMLCLI  VARCHAR(80)
                        NOT NULL DEFAULT '',
    TELEFONO FOR COLUMN TELCLI VARCHAR(80)
                        NOT NULL DEFAULT '',
    PAIS_RESIDENCIA FOR COLUMN PAIRES VARCHAR(50)
                        NOT NULL DEFAULT '',
    USUARIO_INGRESO FOR COLUMN USRING CHAR(18)
                        NOT NULL DEFAULT USER,
    USUARIO_ACTUALIZA FOR COLUMN USRACT CHAR(18)
                        NOT NULL DEFAULT USER,
    VERSION_REGISTRO FOR COLUMN VERREG INTEGER
                        NOT NULL DEFAULT 1,
    OBSERVACIONES FOR COLUMN OBSREG VARCHAR(120)
                        NOT NULL DEFAULT '',
    ESTADO_REGISTRO FOR COLUMN ESTREG CHAR(1)
                        NOT NULL DEFAULT 'A',
    FECHA_INGRESO FOR COLUMN FECING TIMESTAMP
                        NOT NULL WITH DEFAULT,
    FECHA_ACTUALIZA FOR COLUMN FECACT TIMESTAMP
                        NOT NULL WITH DEFAULT,

    CONSTRAINT CUMPR_PK PRIMARY KEY (PLBRES),

    CONSTRAINT CUMPR_ESTREG_CST CHECK (ESTREG IN ('A','I'))
) RCDFMT RCUMPR;

RENAME TABLE CUMPR
TO PALABRAS_RESERVADAS
FOR SYSTEM NAME CUMPR;

COMMENT ON TABLE CUMPR IS
'PALABRAS_RESERVADAS';

--======================================================================
-- Comentarios
--======================================================================
COMMENT ON COLUMN CUMPR.PLBRES IS
'Palabra reservada que se omite en búsquedas.';
COMMENT ON COLUMN CUMPR.TIPPER IS
'Tipo de persona al que aplica la palabra (si aplica).';
COMMENT ON COLUMN CUMPR.TIPIDE IS
'Tipo de identificación asociado (si aplica).';
COMMENT ON COLUMN CUMPR.NUMIDE IS
'Número de identificación asociado (si aplica).';
COMMENT ON COLUMN CUMPR.NOMCLI IS
'Nombre del cliente';
COMMENT ON COLUMN CUMPR.APECLI IS
'Apellidos del cliente';
COMMENT ON COLUMN CUMPR.RAZSOC IS
'Razón social relacionada para contexto de la palabra.';
COMMENT ON COLUMN CUMPR.FECNAC IS
'Fecha de nacimiento asociada (si aplica).';
COMMENT ON COLUMN CUMPR.DIRCLI IS
'Dirección asociada (si aplica).';
COMMENT ON COLUMN CUMPR.EMLCLI  IS
'Correo electrónico asociado (si aplica).';
COMMENT ON COLUMN CUMPR.TELCLI IS
'Teléfono asociado (si aplica).';
COMMENT ON COLUMN CUMPR.PAIRES IS
'País de residencia asociado (si aplica).';
COMMENT ON COLUMN CUMPR.USRING IS
'Usuario que creó el registro.';
COMMENT ON COLUMN CUMPR.USRACT IS
'Usuario que actualizó el registro por última vez.';
COMMENT ON COLUMN CUMPR.VERREG IS
'Versión del registro para control de cambios.';
COMMENT ON COLUMN CUMPR.OBSREG IS
'Observaciones adicionales sobre la palabra.';
COMMENT ON COLUMN CUMPR.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN CUMPR.FECING IS
'Fecha y hora de creación del registro.';
COMMENT ON COLUMN CUMPR.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================
LABEL ON TABLE CUMPR IS 'PALABRAS_RESERVADAS';

LABEL ON COLUMN CUMPR.PLBRES  IS 'Palabra';
LABEL ON COLUMN CUMPR.TIPPER  IS 'Tipo Persona';
LABEL ON COLUMN CUMPR.TIPIDE  IS 'Tipo Identif.';
LABEL ON COLUMN CUMPR.NUMIDE  IS 'Número Identif.';
LABEL ON COLUMN CUMPR.NOMCLI  IS 'Nombre';
LABEL ON COLUMN CUMPR.APECLI  IS 'Apellidos';
LABEL ON COLUMN CUMPR.RAZSOC  IS 'Razón Social';
LABEL ON COLUMN CUMPR.FECNAC  IS 'Fecha Nac.';
LABEL ON COLUMN CUMPR.DIRCLI  IS 'Dirección';
LABEL ON COLUMN CUMPR.EMLCLI   IS 'Email';
LABEL ON COLUMN CUMPR.TELCLI  IS 'Teléfono';
LABEL ON COLUMN CUMPR.PAIRES  IS 'País Residencia';
LABEL ON COLUMN CUMPR.USRING  IS 'Usuario creación';
LABEL ON COLUMN CUMPR.USRACT  IS 'Usuario actualización';
LABEL ON COLUMN CUMPR.VERREG  IS 'Versión registro';
LABEL ON COLUMN CUMPR.OBSREG  IS 'Observaciones';
LABEL ON COLUMN CUMPR.ESTREG  IS 'Estado registro';
LABEL ON COLUMN CUMPR.FECING  IS 'Fecha creación';
LABEL ON COLUMN CUMPR.FECACT  IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================
LABEL ON COLUMN CUMPR.PLBRES  TEXT  IS 'Palabra';
LABEL ON COLUMN CUMPR.TIPPER  TEXT  IS 'Tipo Persona';
LABEL ON COLUMN CUMPR.TIPIDE  TEXT  IS 'Tipo Identif.';
LABEL ON COLUMN CUMPR.NUMIDE  TEXT  IS 'Número Identif.';
LABEL ON COLUMN CUMPR.NOMCLI  TEXT  IS 'Nombre';
LABEL ON COLUMN CUMPR.APECLI  TEXT  IS 'Apellidos';
LABEL ON COLUMN CUMPR.RAZSOC  TEXT  IS 'Razón Social';
LABEL ON COLUMN CUMPR.FECNAC  TEXT  IS 'Fecha Nac.';
LABEL ON COLUMN CUMPR.DIRCLI  TEXT  IS 'Dirección';
LABEL ON COLUMN CUMPR.EMLCLI   TEXT  IS 'Email';
LABEL ON COLUMN CUMPR.TELCLI  TEXT  IS 'Teléfono';
LABEL ON COLUMN CUMPR.PAIRES  TEXT  IS 'País Residencia';
LABEL ON COLUMN CUMPR.USRING  TEXT  IS 'Usuario creación';
LABEL ON COLUMN CUMPR.USRACT  TEXT  IS 'Usuario actualización';
LABEL ON COLUMN CUMPR.VERREG  TEXT  IS 'Versión registro';
LABEL ON COLUMN CUMPR.OBSREG  TEXT  IS 'Observaciones';
LABEL ON COLUMN CUMPR.ESTREG  TEXT  IS 'Estado registro';
LABEL ON COLUMN CUMPR.FECING  TEXT  IS 'Fecha creación';
LABEL ON COLUMN CUMPR.FECACT  TEXT  IS 'Fecha actualización';