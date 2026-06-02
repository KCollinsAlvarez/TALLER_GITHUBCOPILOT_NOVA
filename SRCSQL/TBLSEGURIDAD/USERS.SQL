--======================================================================
-- Nombre de la Tabla : USERS - AUTORIZACIONES_MENU
--
-- DESCRIPCIÓN:
-- Archivo de autorizaciones por menú para usuarios.
--
-- Objetivo:
-- Controlar permisos de consulta, creación, actualización y aprobación
-- sobre opciones de menú para cada usuario.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Gestión de seguridad del sistema.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Se utiliza para validar accesos y permisos funcionales de usuario
-- sobre opciones de menú.
--
-- Restricciones:
-- Cada combinación usuario/menú/opción es única y define
-- permisos específicos.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-05-21
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================
CREATE OR REPLACE TABLE USERS (
    CODIGO_USUARIO FOR COLUMN CODUSR CHAR(20)
                         NOT NULL,
    CODIGO_MENU FOR COLUMN CODMNU CHAR(20)
                       NOT NULL,
    NUMERO_OPCION FOR COLUMN NUMOPC CHAR(20)
                        NOT NULL,
    ROL_ASIGNADO FOR COLUMN ROLASG CHAR(20)
                        NOT NULL DEFAULT '',
    NIVEL_AUTORIZACION FOR COLUMN NIVAUT INTEGER
                            NOT NULL DEFAULT 0,
    PERMITE_CONSULTA FOR COLUMN PRMCNS CHAR(1)
                            NOT NULL DEFAULT 'N',
    PERMITE_CREACION FOR COLUMN PRTCRN CHAR(1)
                            NOT NULL DEFAULT 'N',
    PERMITE_ACTUALIZA FOR COLUMN PRTACT CHAR(1)
                            NOT NULL DEFAULT 'N',
    PERMITE_APROBACION FOR COLUMN PRTAPR CHAR(1)
                            NOT NULL DEFAULT 'N',
    USUARIO_INGRESO FOR COLUMN USRING CHAR(18)
                        NOT NULL DEFAULT USER,
    FECHA_INGRESO FOR COLUMN FECING TIMESTAMP
                        NOT NULL WITH DEFAULT,
    USUARIO_ACTUALIZA FOR COLUMN USRACT CHAR(18)
                            NOT NULL DEFAULT USER,
    FECHA_ACTUALIZA FOR COLUMN FECACT TIMESTAMP
                            NOT NULL WITH DEFAULT,
    VERSION_REGISTRO FOR COLUMN VSNREG INTEGER
                          NOT NULL DEFAULT 1,
    OBSERVACIONES FOR COLUMN OBSERV VARCHAR(120)
                        NOT NULL DEFAULT '',
    ESTADO_REGISTRO FOR COLUMN ESTREG CHAR(1)
                        NOT NULL DEFAULT 'A',

    CONSTRAINT USERS_PK PRIMARY KEY (CODUSR, CODMNU, NUMOPC),

    CONSTRAINT USERS_PRMCNS_CST CHECK (PRMCNS IN ('S','N')),
    CONSTRAINT USERS_PRTCRN_CST CHECK (PRTCRN IN ('S','N')),
    CONSTRAINT USERS_PRTACT_CST CHECK (PRTACT IN ('S','N')),
    CONSTRAINT USERS_PRTAPR_CST CHECK (PRTAPR IN ('S','N')),
    CONSTRAINT USERS_ESTREG_CST CHECK (ESTREG IN ('A','I'))
) RCDFMT RUSERS;

RENAME TABLE USERS TO AUTORIZACIONES_MENU
FOR SYSTEM NAME USERS;

--======================================================================
-- Comentarios
--======================================================================
COMMENT ON TABLE USERS IS
'AUTORIZACIONES_MENU';

COMMENT ON COLUMN USERS.CODUSR IS
'Código del usuario autorizado.';

COMMENT ON COLUMN USERS.CODMNU IS
'Código del menú.';

COMMENT ON COLUMN USERS.NUMOPC IS
'Número de opción dentro del menú.';

COMMENT ON COLUMN USERS.ROLASG IS
'Rol asignado para autorización de menú.';

COMMENT ON COLUMN USERS.NIVAUT IS
'Nivel de autorización requerido para la opción.';

COMMENT ON COLUMN USERS.PRMCNS IS
'Indica si el usuario puede consultar la opción.
Valores válidos: S=Sí, N=No.';

COMMENT ON COLUMN USERS.PRTCRN IS
'Indica si el usuario puede crear en la opción.
Valores válidos: S=Sí, N=No.';

COMMENT ON COLUMN USERS.PRTACT IS
'Indica si el usuario puede actualizar la opción.
Valores válidos: S=Sí, N=No.';

COMMENT ON COLUMN USERS.PRTAPR IS
'Indica si el usuario puede aprobar en la opción.
Valores válidos: S=Sí, N=No.';

COMMENT ON COLUMN USERS.USRING IS
'Usuario que ingresó el registro.';

COMMENT ON COLUMN USERS.FECING IS
'Fecha y hora de ingreso del registro.';

COMMENT ON COLUMN USERS.USRACT IS
'Último usuario que actualizó el registro.';

COMMENT ON COLUMN USERS.FECACT IS
'Fecha y hora de última actualización del registro.';

COMMENT ON COLUMN USERS.VSNREG IS
'Versión del registro.';

COMMENT ON COLUMN USERS.OBSERV IS
'Observaciones referentes a la autorización.';

COMMENT ON COLUMN USERS.ESTREG IS
'Estatus lógico del registro. Valores válidos: A=Activo, I=Inactivo.';

--======================================================================
-- Labels
--======================================================================
LABEL ON TABLE USERS IS
'AUTORIZACIONES_MENU';

LABEL ON COLUMN USERS.CODUSR IS 'Usuario';
LABEL ON COLUMN USERS.CODMNU IS 'Menú';
LABEL ON COLUMN USERS.NUMOPC IS 'Numero opción';
LABEL ON COLUMN USERS.ROLASG IS 'Rol asignado';
LABEL ON COLUMN USERS.NIVAUT IS 'Nivel autorización';
LABEL ON COLUMN USERS.PRMCNS IS 'Permite consulta';
LABEL ON COLUMN USERS.PRTCRN IS 'Permite creación';
LABEL ON COLUMN USERS.PRTACT IS 'Permite actualización';
LABEL ON COLUMN USERS.PRTAPR IS 'Permite aprobación';
LABEL ON COLUMN USERS.USRING IS 'Usuario ingreso';
LABEL ON COLUMN USERS.FECING IS 'Fecha ingreso';
LABEL ON COLUMN USERS.USRACT IS 'Usuario actualización';
LABEL ON COLUMN USERS.FECACT IS 'Fecha actualización';
LABEL ON COLUMN USERS.VSNREG IS 'Versión registro';
LABEL ON COLUMN USERS.OBSERV IS 'Observaciones';
LABEL ON COLUMN USERS.ESTREG IS 'Estado registro';

--======================================================================
-- Labels TEXT IS
--======================================================================
LABEL ON COLUMN USERS.CODUSR TEXT IS 'Usuario';
LABEL ON COLUMN USERS.CODMNU TEXT IS 'Menú';
LABEL ON COLUMN USERS.NUMOPC TEXT IS 'Numero opción';
LABEL ON COLUMN USERS.ROLASG TEXT IS 'Rol asignado';
LABEL ON COLUMN USERS.NIVAUT TEXT IS 'Nivel autorización';
LABEL ON COLUMN USERS.PRMCNS TEXT IS 'Permite consulta';
LABEL ON COLUMN USERS.PRTCRN TEXT IS 'Permite creación';
LABEL ON COLUMN USERS.PRTACT TEXT IS 'Permite actualización';
LABEL ON COLUMN USERS.PRTAPR TEXT IS 'Permite aprobación';
LABEL ON COLUMN USERS.USRING TEXT IS 'Usuario ingreso';
LABEL ON COLUMN USERS.FECING TEXT IS 'Fecha ingreso';
LABEL ON COLUMN USERS.USRACT TEXT IS 'Usuario actualización';
LABEL ON COLUMN USERS.FECACT TEXT IS 'Fecha actualización';
LABEL ON COLUMN USERS.VSNREG TEXT IS 'Versión registro';
LABEL ON COLUMN USERS.OBSERV TEXT IS 'Observaciones';
LABEL ON COLUMN USERS.ESTREG TEXT IS 'Estado registro';