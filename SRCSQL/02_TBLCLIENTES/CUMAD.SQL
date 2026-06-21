--======================================================================
-- Nombre de la Tabla : CUMAD - DIRECCIONES_CLIENTE
--
-- DESCRIPCIÓN:
-- Archivo de Direcciones de Correo y Beneficiarios de
-- Operaciones/Clientes. Registra las direcciones de correo, datos de
-- beneficiarios y datos de contacto asociados a clientes u operaciones.
--
-- Objetivo:
-- Mantener la información de contacto y beneficiarios para el
-- subsistema de clientes y operaciones.
--
-- Tipo de Tabla:
-- Transaccional / Detalle.
--
-- Origen de los Datos:
-- Procesos de apertura de cliente, gestión de direcciones y
-- mantenimiento de beneficiarios.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte a operaciones de notificación, pagos y validación de
-- beneficiarios asociados a clientes.
--
-- Restricciones:
-- PK compuesta; `ESTADO_REGISTRO` solo A o I; FK hacia CUMST;
-- auditoría con valores por defecto.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-02
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE CUMAD (
    NUM_CLIENTE FOR COLUMN NUMCLI VARCHAR(30)
                        NOT NULL,
    TIPO_REGISTRO FOR COLUMN TIPREG VARCHAR(20)
                        NOT NULL,
    NUM_SECUENCIA FOR COLUMN NUMSEC INTEGER
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
    EMAIL FOR COLUMN EMLCLI  VARCHAR(80)
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

    CONSTRAINT CUMAD_PK PRIMARY KEY (NUMCLI, TIPREG, NUMSEC),

    CONSTRAINT CUMAD_CUMST_FK FOREIGN KEY (NUMCLI)
        REFERENCES CUMST (NUMCLI),

    CONSTRAINT CUMAD_ESTREG_CST CHECK (ESTREG IN ('A','I'))
) RCDFMT RCUMAD;

RENAME TABLE CUMAD
TO DIRECCIONES_CLIENTE
FOR SYSTEM NAME CUMAD;

COMMENT ON TABLE CUMAD IS
'DIRECCIONES_CLIENTE';

--======================================================================
-- Comentarios
--======================================================================
COMMENT ON COLUMN CUMAD.NUMCLI IS
'Clave del cliente u operación asociada al registro.';
COMMENT ON COLUMN CUMAD.TIPREG IS
'Tipo de registro que clasifica la dirección o beneficiario.';
COMMENT ON COLUMN CUMAD.NUMSEC IS
'Secuencia del registro dentro del tipo de registro.';
COMMENT ON COLUMN CUMAD.TIPPER IS
'Tipo de persona asociada al registro.';
COMMENT ON COLUMN CUMAD.TIPIDE IS
'Tipo de identificación asociado al registro.';
COMMENT ON COLUMN CUMAD.NUMIDE IS
'Número de identificación del contacto o beneficiario.';
COMMENT ON COLUMN CUMAD.NOMCLI IS
'Nombres del contacto o beneficiario.';
COMMENT ON COLUMN CUMAD.APECLI IS
'Apellidos del contacto o beneficiario.';
COMMENT ON COLUMN CUMAD.RAZSOC IS
'Razón social del contacto o beneficiario.';
COMMENT ON COLUMN CUMAD.FECNAC IS
'Fecha de nacimiento del contacto o beneficiario.';
COMMENT ON COLUMN CUMAD.DIRCLI IS
'Dirección principal registrada del contacto.';
COMMENT ON COLUMN CUMAD.EMLCLI  IS
'Correo electrónico del contacto o beneficiario.';
COMMENT ON COLUMN CUMAD.TELCLI IS
'Teléfono de contacto del registro.';
COMMENT ON COLUMN CUMAD.PAIRES IS
'País de residencia del contacto.';
COMMENT ON COLUMN CUMAD.USRING IS
'Usuario que creó el registro.';
COMMENT ON COLUMN CUMAD.USRACT IS
'Usuario que actualizó el registro por última vez.';
COMMENT ON COLUMN CUMAD.VERREG IS
'Versión del registro para control de cambios.';
COMMENT ON COLUMN CUMAD.OBSREG IS
'Observaciones adicionales sobre el registro.';
COMMENT ON COLUMN CUMAD.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN CUMAD.FECING IS
'Fecha y hora de creación del registro.';
COMMENT ON COLUMN CUMAD.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================
LABEL ON TABLE CUMAD IS 'DIRECCIONES_CLIENTE';

LABEL ON COLUMN CUMAD.NUMCLI  IS 'Cliente/Operación';
LABEL ON COLUMN CUMAD.TIPREG   IS 'Tipo Registro';
LABEL ON COLUMN CUMAD.NUMSEC   IS 'Secuencia';
LABEL ON COLUMN CUMAD.TIPPER   IS 'Tipo Persona';
LABEL ON COLUMN CUMAD.TIPIDE   IS 'Tipo Identificación';
LABEL ON COLUMN CUMAD.NUMIDE   IS 'Número Identificación';
LABEL ON COLUMN CUMAD.NOMCLI   IS 'Nombres';
LABEL ON COLUMN CUMAD.APECLI   IS 'Apellidos';
LABEL ON COLUMN CUMAD.RAZSOC   IS 'Razón Social';
LABEL ON COLUMN CUMAD.FECNAC   IS 'Fecha Nacimiento';
LABEL ON COLUMN CUMAD.DIRCLI   IS 'Dirección';
LABEL ON COLUMN CUMAD.EMLCLI    IS 'Email';
LABEL ON COLUMN CUMAD.TELCLI   IS 'Teléfono';
LABEL ON COLUMN CUMAD.PAIRES   IS 'País Residencia';
LABEL ON COLUMN CUMAD.USRING   IS 'Usuario creación';
LABEL ON COLUMN CUMAD.USRACT   IS 'Usuario actualización';
LABEL ON COLUMN CUMAD.VERREG   IS 'Versión registro';
LABEL ON COLUMN CUMAD.OBSREG   IS 'Observaciones';
LABEL ON COLUMN CUMAD.ESTREG   IS 'Estado registro';
LABEL ON COLUMN CUMAD.FECING   IS 'Fecha creación';
LABEL ON COLUMN CUMAD.FECACT   IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================
LABEL ON COLUMN CUMAD.NUMCLI  TEXT  IS 'Cliente/Operación';
LABEL ON COLUMN CUMAD.TIPREG   TEXT  IS 'Tipo Registro';
LABEL ON COLUMN CUMAD.NUMSEC   TEXT  IS 'Secuencia';
LABEL ON COLUMN CUMAD.TIPPER   TEXT  IS 'Tipo Persona';
LABEL ON COLUMN CUMAD.TIPIDE   TEXT  IS 'Tipo Identificación';
LABEL ON COLUMN CUMAD.NUMIDE   TEXT  IS 'Número Identificación';
LABEL ON COLUMN CUMAD.NOMCLI   TEXT  IS 'Nombres';
LABEL ON COLUMN CUMAD.APECLI   TEXT  IS 'Apellidos';
LABEL ON COLUMN CUMAD.RAZSOC   TEXT  IS 'Razón Social';
LABEL ON COLUMN CUMAD.FECNAC   TEXT  IS 'Fecha Nacimiento';
LABEL ON COLUMN CUMAD.DIRCLI   TEXT  IS 'Dirección';
LABEL ON COLUMN CUMAD.EMLCLI    TEXT  IS 'Email';
LABEL ON COLUMN CUMAD.TELCLI   TEXT  IS 'Teléfono';
LABEL ON COLUMN CUMAD.PAIRES   TEXT  IS 'País Residencia';
LABEL ON COLUMN CUMAD.USRING   TEXT  IS 'Usuario creación';
LABEL ON COLUMN CUMAD.USRACT   TEXT  IS 'Usuario actualización';
LABEL ON COLUMN CUMAD.VERREG   TEXT  IS 'Versión registro';
LABEL ON COLUMN CUMAD.OBSREG   TEXT  IS 'Observaciones';
LABEL ON COLUMN CUMAD.ESTREG   TEXT  IS 'Estado registro';
LABEL ON COLUMN CUMAD.FECING   TEXT  IS 'Fecha creación';
LABEL ON COLUMN CUMAD.FECACT   TEXT  IS 'Fecha actualización';