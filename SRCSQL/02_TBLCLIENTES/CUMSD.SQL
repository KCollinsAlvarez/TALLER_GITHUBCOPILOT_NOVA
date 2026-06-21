--======================================================================
-- Nombre de la Tabla : CUMSD - MAESTRO_CLIENTES_SD
--
-- DESCRIPCIÓN:
-- Archivo Maestro de Clientes para búsqueda de Clientes a través de un
-- String de Caracteres. Contiene los datos principales usados por los
-- procesos de localización por texto parcial o completo.
--
-- Objetivo:
-- Facilitar la búsqueda eficiente de clientes y mantener referencia al
-- maestro de clientes principal.
--
-- Tipo de Tabla:
-- Maestro / Soporte de Búsqueda.
--
-- Origen de los Datos:
-- Procesos de indexación y actualizaciones del maestro de clientes.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Consultas de UI, APIs y procesos batch que requieren localizar clientes
-- por palabras, documentos o texto libre.
--
-- Restricciones:
-- PK simple; FK a CUMST; `ESTADO_REGISTRO` solo A o I; auditoría con
-- valores por defecto.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-02
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CUMSD (
    NUMERO_CLIENTE FOR COLUMN NUMCLI VARCHAR(30)
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
    DIRECCION FOR COLUMN DIRCLI VARCHAR(120)
                        NOT NULL DEFAULT '',
    EMAIL FOR COLUMN EMLCLI VARCHAR(80)
                        NOT NULL DEFAULT '',
    TELEFONO FOR COLUMN TELCLI VARCHAR(80)
                        NOT NULL DEFAULT '',
    PAIS_RESIDENCIA FOR COLUMN PAIRES VARCHAR(50)
                        NOT NULL DEFAULT '',
    USUARIO_CREACION FOR COLUMN USRING VARCHAR(18)
                        NOT NULL DEFAULT USER,
    USUARIO_ACTUALIZA FOR COLUMN USRACT VARCHAR(18)
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

    CONSTRAINT CUMSD_PK PRIMARY KEY (NUMCLI),
    CONSTRAINT CUMSD_CUMST_FK FOREIGN KEY (NUMCLI)
        REFERENCES CUMST (NUMCLI),
    CONSTRAINT CUMSD_ESTREG_CST CHECK (ESTREG IN ('A','I'))
) RCDFMT RCUMSD;

RENAME TABLE CUMSD
TO MAESTRO_CLIENTES_SD
FOR SYSTEM NAME CUMSD;

COMMENT ON TABLE CUMSD IS
'MAESTRO_CLIENTES_SD';

--======================================================================
-- Comentarios
--======================================================================
COMMENT ON COLUMN CUMSD.NUMCLI IS
'Identificador único del cliente, vinculado al maestro de clientes.';
COMMENT ON COLUMN CUMSD.TIPPER IS
'Tipo de persona del cliente: Jurídica o Natural.';
COMMENT ON COLUMN CUMSD.TIPIDE IS
'Tipo de documento de identificación para búsqueda de cliente.';
COMMENT ON COLUMN CUMSD.NUMIDE IS
'Número de documento de identificación del cliente.';
COMMENT ON COLUMN CUMSD.NOMCLI IS
'Nombres del cliente para búsquedas textuales.';
COMMENT ON COLUMN CUMSD.APECLI IS
'Apellidos del cliente para búsquedas textuales.';
COMMENT ON COLUMN CUMSD.RAZSOC IS
'Razón social o nombre comercial del cliente.';
COMMENT ON COLUMN CUMSD.FECNAC IS
'Fecha de nacimiento del cliente, utilizada para validación.';
COMMENT ON COLUMN CUMSD.DIRCLI IS
'Dirección asociada al cliente para búsquedas y contacto.';
COMMENT ON COLUMN CUMSD.EMLCLI IS
'Correo electrónico del cliente para búsquedas y notificaciones.';
COMMENT ON COLUMN CUMSD.TELCLI IS
'Teléfono del cliente para búsquedas y contacto.';
COMMENT ON COLUMN CUMSD.PAIRES IS
'País de residencia del cliente.';
COMMENT ON COLUMN CUMSD.USRING IS
'Usuario que creó el registro de búsqueda.';
COMMENT ON COLUMN CUMSD.USRACT IS
'Usuario que actualizó el registro de búsqueda.';
COMMENT ON COLUMN CUMSD.VERREG IS
'Versión del registro para control de cambios.';
COMMENT ON COLUMN CUMSD.OBSREG IS
'Observaciones adicionales sobre el registro de búsqueda.';
COMMENT ON COLUMN CUMSD.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN CUMSD.FECING IS
'Fecha y hora de creación del registro.';
COMMENT ON COLUMN CUMSD.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================
LABEL ON TABLE CUMSD IS 'MAESTRO_CLIENTES_SD';

LABEL ON COLUMN CUMSD.NUMCLI  IS 'ID Cliente';
LABEL ON COLUMN CUMSD.TIPPER  IS 'Tipo de persona';
LABEL ON COLUMN CUMSD.TIPIDE  IS 'Tipo de identificación';
LABEL ON COLUMN CUMSD.NUMIDE  IS 'Número de identificación';
LABEL ON COLUMN CUMSD.NOMCLI  IS 'Nombres';
LABEL ON COLUMN CUMSD.APECLI  IS 'Apellidos';
LABEL ON COLUMN CUMSD.RAZSOC  IS 'Razón social';
LABEL ON COLUMN CUMSD.FECNAC  IS 'Fecha de nacimiento';
LABEL ON COLUMN CUMSD.DIRCLI  IS 'Dirección';
LABEL ON COLUMN CUMSD.EMLCLI  IS 'Email';
LABEL ON COLUMN CUMSD.TELCLI  IS 'Teléfono';
LABEL ON COLUMN CUMSD.PAIRES  IS 'País de residencia';
LABEL ON COLUMN CUMSD.USRING  IS 'Usuario creación';
LABEL ON COLUMN CUMSD.USRACT  IS 'Usuario actualización';
LABEL ON COLUMN CUMSD.VERREG  IS 'Versión del registro';
LABEL ON COLUMN CUMSD.OBSREG  IS 'Observaciones';
LABEL ON COLUMN CUMSD.ESTREG  IS 'Estado del registro';
LABEL ON COLUMN CUMSD.FECING  IS 'Fecha creación';
LABEL ON COLUMN CUMSD.FECACT  IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================
LABEL ON COLUMN CUMSD.NUMCLI  TEXT  IS 'ID Cliente';
LABEL ON COLUMN CUMSD.TIPPER  TEXT  IS 'Tipo de persona';
LABEL ON COLUMN CUMSD.TIPIDE  TEXT  IS 'Tipo de identificación';
LABEL ON COLUMN CUMSD.NUMIDE  TEXT  IS 'Número de identificación';
LABEL ON COLUMN CUMSD.NOMCLI  TEXT  IS 'Nombres';
LABEL ON COLUMN CUMSD.APECLI  TEXT  IS 'Apellidos';
LABEL ON COLUMN CUMSD.RAZSOC  TEXT  IS 'Razón social';
LABEL ON COLUMN CUMSD.FECNAC  TEXT  IS 'Fecha de nacimiento';
LABEL ON COLUMN CUMSD.DIRCLI  TEXT  IS 'Dirección';
LABEL ON COLUMN CUMSD.EMLCLI  TEXT  IS 'Email';
LABEL ON COLUMN CUMSD.TELCLI  TEXT  IS 'Teléfono';
LABEL ON COLUMN CUMSD.PAIRES  TEXT  IS 'País de residencia';
LABEL ON COLUMN CUMSD.USRING  TEXT  IS 'Usuario creación';
LABEL ON COLUMN CUMSD.USRACT  TEXT  IS 'Usuario actualización';
LABEL ON COLUMN CUMSD.VERREG  TEXT  IS 'Versión del registro';
LABEL ON COLUMN CUMSD.OBSREG  TEXT  IS 'Observaciones';
LABEL ON COLUMN CUMSD.ESTREG  TEXT  IS 'Estado del registro';
LABEL ON COLUMN CUMSD.FECING  TEXT  IS 'Fecha creación';
LABEL ON COLUMN CUMSD.FECACT  TEXT  IS 'Fecha actualización';
