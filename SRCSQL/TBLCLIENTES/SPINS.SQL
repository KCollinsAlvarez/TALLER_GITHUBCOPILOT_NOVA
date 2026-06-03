--======================================================================
-- Nombre de la Tabla : SPINS - ARCHIVO_INSTRUCCIONES
--
-- DESCRIPCIÓN:
-- Archivo de Instrucciones Especiales (Usos). Registra instrucciones,
-- usos o notas asociadas a un tipo de información y a la cuenta/cliente.
--
-- Objetivo:
-- Mantener instrucciones especiales vinculadas a cliente/cuenta para
-- operaciones, cumplimiento y procesos de negocio.
--
-- Tipo de Tabla:
-- Transaccional.
--
-- Origen de los Datos:
-- Sistemas operativos y procesos de atención al cliente.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte a procesos operativos que requieren instrucciones especiales.
--
-- Restricciones:
-- PK compuesta; `ESTADO_REGISTRO` solo A o I; auditoría estándar en
-- español aplicada; FK a `CUMST` y `ACMST` (comentadas para revisión).
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-02
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE SPINS (
    TIPO_INFORMACION FOR COLUMN TIPINF VARCHAR(50)
                        NOT NULL,
    CUENTA_O_CLIENTE FOR COLUMN CUECLI VARCHAR(50)
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
    EMAIL FOR COLUMN EMLCLI VARCHAR(80)
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

    CONSTRAINT SPINS_PK PRIMARY KEY (TIPINF, CUECLI, SECUEN),

    -- FK opcional a CUMST (cliente) comentada para revisión:
    -- CONSTRAINT SPINS_CUMST_FK FOREIGN KEY (CUECLI)
    --     REFERENCES CUMST (NUMCLI),

    -- FK opcional a ACMST (cuenta) comentada para revisión (tipos
    -- distintos: CUECLI VARCHAR(50) vs ACMST.ID BIGINT):
    -- CONSTRAINT SPINS_ACMST_FK FOREIGN KEY (CUECLI)
    --     REFERENCES ACMST (ID),

    CONSTRAINT SPINS_ESTREG_CST CHECK (ESTREG IN ('A','I'))
) RCDFMT RSPINS;

RENAME TABLE SPINS
TO ARCHIVO_INSTRUCCIONES
FOR SYSTEM NAME SPINS;

COMMENT ON TABLE SPINS IS
'ARCHIVO_INSTRUCCIONES';

--======================================================================
-- Comentarios
--======================================================================
COMMENT ON COLUMN SPINS.TIPINF IS
'Tipo de información o clasificación de la instrucción.';
COMMENT ON COLUMN SPINS.CUECLI IS
'Cuenta o identificador de cliente vinculado a la instrucción.';
COMMENT ON COLUMN SPINS.NUMSEC IS
'Secuencia o número de línea de la instrucción dentro del registro.';
COMMENT ON COLUMN SPINS.TIPPER IS
'Tipo de persona: Jurídica o Natural.';
COMMENT ON COLUMN SPINS.TIPIDE IS
'Tipo de identificación asociado a la persona.';
COMMENT ON COLUMN SPINS.NUMIDE IS
'Número de documento de identificación de la persona.';
COMMENT ON COLUMN SPINS.NOMCLI IS
'Nombres asociados a la instrucción (persona natural).';
COMMENT ON COLUMN SPINS.APECLI IS
'APELLIDO_CLIENTE asociados a la instrucción (persona natural).';
COMMENT ON COLUMN SPINS.RAZSOC IS
'Razón social asociada (persona jurídica).';
COMMENT ON COLUMN SPINS.FECNAC IS
'Fecha de nacimiento (persona natural).';
COMMENT ON COLUMN SPINS.DIRCLI IS
'Dirección asociada al registro.';
COMMENT ON COLUMN SPINS.EMLCLI IS
'Correo electrónico de contacto.';
COMMENT ON COLUMN SPINS.TELCLI IS
'Teléfono de contacto.';
COMMENT ON COLUMN SPINS.PAIRES IS
'País de residencia o jurisdicción.';
COMMENT ON COLUMN SPINS.USRING IS
'Usuario que creó el registro (estándar español).';
COMMENT ON COLUMN SPINS.USRACT IS
'Usuario que actualizó el registro (estándar español).';
COMMENT ON COLUMN SPINS.VERREG IS
'Versión del registro para control de cambios.';
COMMENT ON COLUMN SPINS.OBSREG IS
'Observaciones adicionales o notas.';
COMMENT ON COLUMN SPINS.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';
COMMENT ON COLUMN SPINS.FECING IS
'Fecha y hora de creación del registro (reemplaza created_at).';
COMMENT ON COLUMN SPINS.FECACT IS
'Fecha y hora de última actualización (reemplaza updated_at).';

--======================================================================
-- Labels
--======================================================================
LABEL ON TABLE SPINS IS 'ARCHIVO_INSTRUCCIONES';

LABEL ON COLUMN SPINS.TIPINF  IS 'Tipo Información';
LABEL ON COLUMN SPINS.CUECLI  IS 'Cuenta/Cliente';
LABEL ON COLUMN SPINS.NUMSEC  IS 'Secuencia';
LABEL ON COLUMN SPINS.TIPPER  IS 'Tipo Persona';
LABEL ON COLUMN SPINS.TIPIDE  IS 'Tipo Identificación';
LABEL ON COLUMN SPINS.NUMIDE  IS 'Número Identificación';
LABEL ON COLUMN SPINS.NOMCLI  IS 'Nombres';
LABEL ON COLUMN SPINS.APECLI  IS 'Apellidos';
LABEL ON COLUMN SPINS.RAZSOC  IS 'Razón Social';
LABEL ON COLUMN SPINS.FECNAC  IS 'Fecha Nacimiento';
LABEL ON COLUMN SPINS.DIRCLI  IS 'Dirección';
LABEL ON COLUMN SPINS.EMLCLI  IS 'Email';
LABEL ON COLUMN SPINS.TELCLI  IS 'Teléfono';
LABEL ON COLUMN SPINS.PAIRES  IS 'País Residencia';
LABEL ON COLUMN SPINS.USRING  IS 'Usuario creación';
LABEL ON COLUMN SPINS.USRACT  IS 'Usuario actualización';
LABEL ON COLUMN SPINS.VERREG  IS 'Versión registro';
LABEL ON COLUMN SPINS.OBSREG  IS 'Observaciones';
LABEL ON COLUMN SPINS.ESTREG  IS 'Estado registro';
LABEL ON COLUMN SPINS.FECING  IS 'Fecha creación';
LABEL ON COLUMN SPINS.FECACT  IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================
LABEL ON COLUMN SPINS.TIPINF  TEXT  IS 'Tipo de Información';
LABEL ON COLUMN SPINS.CUECLI  TEXT  IS 'Cuenta o Cliente';
LABEL ON COLUMN SPINS.NUMSEC  TEXT  IS 'Secuencia';
LABEL ON COLUMN SPINS.TIPPER  TEXT  IS 'Tipo de Persona';
LABEL ON COLUMN SPINS.TIPIDE  TEXT  IS 'Tipo Identificación';
LABEL ON COLUMN SPINS.NUMIDE  TEXT  IS 'Número Identificación';
LABEL ON COLUMN SPINS.NOMCLI  TEXT  IS 'Nombres';
LABEL ON COLUMN SPINS.APECLI  TEXT  IS 'Apellidos';
LABEL ON COLUMN SPINS.RAZSOC  TEXT  IS 'Razón Social';
LABEL ON COLUMN SPINS.FECNAC  TEXT  IS 'Fecha de Nacimiento';
LABEL ON COLUMN SPINS.DIRCLI  TEXT  IS 'Dirección';
LABEL ON COLUMN SPINS.EMLCLI  TEXT  IS 'Email';
LABEL ON COLUMN SPINS.TELCLI  TEXT  IS 'Teléfono';
LABEL ON COLUMN SPINS.PAIRES  TEXT  IS 'País de Residencia';
LABEL ON COLUMN SPINS.USRING  TEXT  IS 'Usuario creación';
LABEL ON COLUMN SPINS.USRACT  TEXT  IS 'Usuario actualización';
LABEL ON COLUMN SPINS.VERREG  TEXT  IS 'Versión del registro';
LABEL ON COLUMN SPINS.OBSREG  TEXT  IS 'Observaciones';
LABEL ON COLUMN SPINS.ESTREG  TEXT  IS 'Estado del registro';
LABEL ON COLUMN SPINS.FECING  TEXT  IS 'Fecha creación';
LABEL ON COLUMN SPINS.FECACT  TEXT  IS 'Fecha actualización';
