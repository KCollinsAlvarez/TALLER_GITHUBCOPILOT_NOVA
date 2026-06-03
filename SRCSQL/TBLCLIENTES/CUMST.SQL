--======================================================================
-- Nombre de la Tabla : CUMST - MAESTRO_CLIENTES
--
-- DESCRIPCIÓN:
-- Archivo de Maestro de Clientes. Registra la información principal
-- de los clientes del banco (personas naturales y jurídicas).
--
-- Objetivo:
-- Centralizar y mantener la información integral de clientes para
-- propósitos de operaciones, contacto y auditoría.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Procesos de apertura de clientes, actualización de datos y
-- procesos de validación e identidad.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte a transacciones, reportes, consultas y operaciones
-- vinculadas a cuentas y servicios de clientes.
--
-- Restricciones:
-- PK simple en número de cliente; `ESTADO_REGISTRO` solo A o I;
-- auditoría con valores por defecto.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-02
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CUMST (
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
    DIRECCION_CLIENTE FOR COLUMN DIRCLI VARCHAR(120)
                        NOT NULL DEFAULT '',
    EMAIL FOR COLUMN EMLCLI VARCHAR(80)
                        NOT NULL DEFAULT '',
    TELEFONO FOR COLUMN TELCLI VARCHAR(80)
                        NOT NULL DEFAULT '',
    PAIS_RESIDENCIA FOR COLUMN PAIRES VARCHAR(50)
                        NOT NULL DEFAULT '',
    USUARIO_INGRESO FOR COLUMN USRING VARCHAR(18)
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

    CONSTRAINT CUMST_PK PRIMARY KEY (NUMCLI),

    CONSTRAINT CUMST_ESTREG_CST CHECK (ESTREG IN ('A','I'))
) RCDFMT RCUMST;

RENAME TABLE CUMST
TO MAESTRO_CLIENTES
FOR SYSTEM NAME CUMST;

COMMENT ON TABLE CUMST IS
'MAESTRO_CLIENTES';

--======================================================================
-- Comentarios
--======================================================================
COMMENT ON COLUMN CUMST.NUMCLI IS
'Número único de identificación del cliente en el sistema.';
COMMENT ON COLUMN CUMST.TIPPER IS
'Tipo de persona: Jurídica (empresa) o Física (natural).';
COMMENT ON COLUMN CUMST.TIPIDE IS
'Tipo de documento de identificación del cliente.';
COMMENT ON COLUMN CUMST.NUMIDE IS
'Número de documento de identificación del cliente.';
COMMENT ON COLUMN CUMST.NOMCLI IS
'Nombres del cliente (para personas naturales).';
COMMENT ON COLUMN CUMST.APECLI IS
'Apellidos del cliente (para personas naturales).';
COMMENT ON COLUMN CUMST.RAZSOC IS
'Razón social o nombre comercial (para personas jurídicas).';
COMMENT ON COLUMN CUMST.FECNAC IS
'Fecha de nacimiento del cliente (para personas naturales).';
COMMENT ON COLUMN CUMST.DIRCLI IS
'Dirección postal principal del cliente.';
COMMENT ON COLUMN CUMST.EMLCLI IS
'Correo electrónico principal del cliente.';
COMMENT ON COLUMN CUMST.TELCLI IS
'Número de teléfono de contacto del cliente.';
COMMENT ON COLUMN CUMST.PAIRES IS
'País de residencia del cliente.';
COMMENT ON COLUMN CUMST.USRING IS
'Usuario que creó el registro.';
COMMENT ON COLUMN CUMST.USRACT IS
'Usuario que actualizó el registro por última vez.';
COMMENT ON COLUMN CUMST.VERREG IS
'Versión del registro para control de cambios.';
COMMENT ON COLUMN CUMST.OBSREG IS
'Observaciones adicionales sobre el cliente.';
COMMENT ON COLUMN CUMST.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN CUMST.FECING IS
'Fecha y hora de creación del registro.';
COMMENT ON COLUMN CUMST.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================
LABEL ON TABLE CUMST IS 'MAESTRO_CLIENTES';

LABEL ON COLUMN CUMST.NUMCLI  IS 'Número de cliente';
LABEL ON COLUMN CUMST.TIPPER  IS 'Tipo de persona';
LABEL ON COLUMN CUMST.TIPIDE  IS 'Tipo de identificación';
LABEL ON COLUMN CUMST.NUMIDE  IS 'Número de identificación';
LABEL ON COLUMN CUMST.NOMCLI  IS 'Nombres';
LABEL ON COLUMN CUMST.APECLI  IS 'Apellidos';
LABEL ON COLUMN CUMST.RAZSOC  IS 'Razón Social';
LABEL ON COLUMN CUMST.FECNAC  IS 'Fecha de Nacimiento';
LABEL ON COLUMN CUMST.DIRCLI  IS 'Dirección';
LABEL ON COLUMN CUMST.EMLCLI  IS 'Email';
LABEL ON COLUMN CUMST.TELCLI  IS 'Teléfono';
LABEL ON COLUMN CUMST.PAIRES  IS 'País de Residencia';
LABEL ON COLUMN CUMST.USRING  IS 'Usuario creación';
LABEL ON COLUMN CUMST.USRACT  IS 'Usuario actualización';
LABEL ON COLUMN CUMST.VERREG  IS 'Versión del registro';
LABEL ON COLUMN CUMST.OBSREG  IS 'Observaciones';
LABEL ON COLUMN CUMST.ESTREG  IS 'Estado del registro';
LABEL ON COLUMN CUMST.FECING  IS 'Fecha creación';
LABEL ON COLUMN CUMST.FECACT  IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================
LABEL ON COLUMN CUMST.NUMCLI  TEXT  IS 'Número de cliente';
LABEL ON COLUMN CUMST.TIPPER  TEXT  IS 'Tipo de persona';
LABEL ON COLUMN CUMST.TIPIDE  TEXT  IS 'Tipo de identificación';
LABEL ON COLUMN CUMST.NUMIDE  TEXT  IS 'Número de identificación';
LABEL ON COLUMN CUMST.NOMCLI  TEXT  IS 'Nombres';
LABEL ON COLUMN CUMST.APECLI  TEXT  IS 'Apellidos';
LABEL ON COLUMN CUMST.RAZSOC  TEXT  IS 'Razón Social';
LABEL ON COLUMN CUMST.FECNAC  TEXT  IS 'Fecha de Nacimiento';
LABEL ON COLUMN CUMST.DIRCLI  TEXT  IS 'Dirección';
LABEL ON COLUMN CUMST.EMLCLI  TEXT  IS 'Email';
LABEL ON COLUMN CUMST.TELCLI  TEXT  IS 'Teléfono';
LABEL ON COLUMN CUMST.PAIRES  TEXT  IS 'País de Residencia';
LABEL ON COLUMN CUMST.USRING  TEXT  IS 'Usuario creación';
LABEL ON COLUMN CUMST.USRACT  TEXT  IS 'Usuario actualización';
LABEL ON COLUMN CUMST.VERREG  TEXT  IS 'Versión del registro';
LABEL ON COLUMN CUMST.OBSREG  TEXT  IS 'Observaciones';
LABEL ON COLUMN CUMST.ESTREG  TEXT  IS 'Estado del registro';
LABEL ON COLUMN CUMST.FECING  TEXT  IS 'Fecha creación';
LABEL ON COLUMN CUMST.FECACT  TEXT  IS 'Fecha actualización';
