--======================================================================
-- Nombre de la Tabla : APCLS - MAESTRO_PRODUCTOS
--
-- DESCRIPCIÓN:
-- Archivo maestro de productos del banco. Registra el catálogo de
-- productos financieros disponibles por banco incluyendo depósitos,
-- préstamos, inversiones y otros servicios.
--
-- Objetivo:
-- Centralizar la definición de productos financieros por banco para
-- validación y consulta en operaciones del sistema.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Configuración del sistema y mantenimiento administrativo de
-- productos financieros.
--
-- Permanencia de Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Soporte a procesos que requieren validación de productos y
-- consulta de catálogo de ofertas por banco.
--
-- Restricciones:
-- PK compuesta; ESTADO_REGISTRO solo A o I; auditoría con valores
-- por defecto.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-04
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE APCLS (
    CODIGO_BANCO FOR COLUMN CODBCO SMALLINT
                        NOT NULL,

    CODIGO_PRODUCTO FOR COLUMN CODPRD VARCHAR(20)
                        NOT NULL,

    DESCRIP_PRODUCTO FOR COLUMN DESPRD VARCHAR(120)
                        NOT NULL DEFAULT '',

    VALOR_TEXTO FOR COLUMN VALTXT VARCHAR(50)
                        NOT NULL DEFAULT '',

    VALOR_NUMERICO FOR COLUMN VALNUM DECIMAL(18, 2)
                        NOT NULL DEFAULT 0,

    VIGENCIA_DESDE FOR COLUMN VIGDED DATE
                        NOT NULL DEFAULT '0001-01-01',

    VIGENCIA_HASTA FOR COLUMN VIGHAS DATE
                        NOT NULL DEFAULT '0001-01-01',

    ORDEN_VISUALIZACION FOR COLUMN ORDVIZ INTEGER
                        NOT NULL DEFAULT 0,

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

    CONSTRAINT APCLS_PK PRIMARY KEY (CODBCO, CODPRD),

    CONSTRAINT APCLS_ESTREG_CST CHECK (ESTREG IN ('A','I'))

) RCDFMT RAPCLS;

RENAME TABLE APCLS
TO MAESTRO_PRODUCTOS
FOR SYSTEM NAME APCLS;

--======================================================================
-- Comentarios
--======================================================================

COMMENT ON TABLE APCLS IS
'MAESTRO_PRODUCTOS';

COMMENT ON COLUMN APCLS.CODBCO IS
'Código identificador del banco propietario del producto.';

COMMENT ON COLUMN APCLS.CODPRD IS
'Código identificador del producto dentro del banco.';

COMMENT ON COLUMN APCLS.DESPRD IS
'Descripción funcional del producto financiero.';

COMMENT ON COLUMN APCLS.VALTXT IS
'Valor textual adicional asociado al producto.';

COMMENT ON COLUMN APCLS.VALNUM IS
'Valor numérico adicional asociado al producto.';

COMMENT ON COLUMN APCLS.VIGDED IS
'Fecha desde la cual el producto es vigente en catálogo.';

COMMENT ON COLUMN APCLS.VIGHAS IS
'Fecha hasta la cual el producto es vigente en catálogo.';

COMMENT ON COLUMN APCLS.ORDVIZ IS
'Orden de visualización o prioridad en listados.';

COMMENT ON COLUMN APCLS.USRING IS
'Usuario que creó el registro de producto.';

COMMENT ON COLUMN APCLS.USRACT IS
'Usuario que actualizó por última vez el registro.';

COMMENT ON COLUMN APCLS.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN APCLS.OBSREG IS
'Observaciones adicionales sobre el producto.';

COMMENT ON COLUMN APCLS.ESTREG IS
'Estatus del registro: A=Activo, I=Inactivo.';

COMMENT ON COLUMN APCLS.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN APCLS.FECACT IS
'Fecha y hora de última actualización del registro.';

--======================================================================
-- Labels
--======================================================================

LABEL ON TABLE APCLS IS 'MAESTRO_PRODUCTOS';

LABEL ON COLUMN APCLS.CODBCO IS 'Código Banco';

LABEL ON COLUMN APCLS.CODPRD IS 'Código Producto';

LABEL ON COLUMN APCLS.DESPRD IS 'Descripción';

LABEL ON COLUMN APCLS.VALTXT IS 'Valor Texto';

LABEL ON COLUMN APCLS.VALNUM IS 'Valor Numérico';

LABEL ON COLUMN APCLS.VIGDED IS 'Vigencia Desde';

LABEL ON COLUMN APCLS.VIGHAS IS 'Vigencia Hasta';

LABEL ON COLUMN APCLS.ORDVIZ IS 'Orden Visualización';

LABEL ON COLUMN APCLS.USRING IS 'Usuario creación';

LABEL ON COLUMN APCLS.USRACT IS 'Usuario actualización';

LABEL ON COLUMN APCLS.VERREG IS 'Versión del registro';

LABEL ON COLUMN APCLS.OBSREG IS 'Observaciones';

LABEL ON COLUMN APCLS.ESTREG IS 'Estado del registro';

LABEL ON COLUMN APCLS.FECING IS 'Fecha creación';

LABEL ON COLUMN APCLS.FECACT IS 'Fecha actualización';

--======================================================================
-- Labels TEXT IS
--======================================================================

LABEL ON COLUMN APCLS.CODBCO TEXT IS 'Código Banco';

LABEL ON COLUMN APCLS.CODPRD TEXT IS 'Código Producto';

LABEL ON COLUMN APCLS.DESPRD TEXT IS 'Descripción';

LABEL ON COLUMN APCLS.VALTXT TEXT IS 'Valor Texto';

LABEL ON COLUMN APCLS.VALNUM TEXT IS 'Valor Numérico';

LABEL ON COLUMN APCLS.VIGDED TEXT IS 'Vigencia Desde';

LABEL ON COLUMN APCLS.VIGHAS TEXT IS 'Vigencia Hasta';

LABEL ON COLUMN APCLS.ORDVIZ TEXT IS 'Orden Visualización';

LABEL ON COLUMN APCLS.USRING TEXT IS 'Usuario creación';

LABEL ON COLUMN APCLS.USRACT TEXT IS 'Usuario actualización';

LABEL ON COLUMN APCLS.VERREG TEXT IS 'Versión del registro';

LABEL ON COLUMN APCLS.OBSREG TEXT IS 'Observaciones';

LABEL ON COLUMN APCLS.ESTREG TEXT IS 'Estado del registro';

LABEL ON COLUMN APCLS.FECING TEXT IS 'Fecha creación';

LABEL ON COLUMN APCLS.FECACT TEXT IS 'Fecha actualización';