--======================================================================
-- Nombre de la Tabla : DLCLP - CALIFICACION_CARTERA
--
-- DESCRIPCIÓN:
-- Calificación y Previsión de Cartera. Registra la evaluación del cliente
-- y su relación con la cuenta.
--
-- Objetivo:
-- Mantener el histórico de calificaciones de cartera por cliente.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Evaluaciones de crédito y cartera.
--
-- Permanencia de los Datos:
-- Permanente.
--
-- Uso de los Datos:
-- Reportes de riesgo y provisiones de cartera.
--
-- Restricciones:
-- PK sobre cliente, cuenta y referencia.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-19
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================

CREATE OR REPLACE TABLE DLCLP (

    NUM_CLIENTE FOR COLUMN NUMCLI VARCHAR(30)
                       NOT NULL,

    NUMERO_CUENTA FOR COLUMN NUMCTA VARCHAR(24)
                      NOT NULL,

    REFERENCIA_CLASIF FOR COLUMN REFCLS VARCHAR(50)
                       NOT NULL,

    FECHA_DESEMBOLSO FOR COLUMN FECDSM DATE
                        NOT NULL DEFAULT '0001-01-01',

    FECHA_VENCIMIENTO FOR COLUMN FECVEN DATE
                         NOT NULL DEFAULT '0001-01-01',

    MONTO_ORIGINAL FOR COLUMN MNTORI DECIMAL(18, 2)
                         NOT NULL DEFAULT 0,

    SALDO_ACTUAL FOR COLUMN SLDACT DECIMAL(18, 2)
                     NOT NULL DEFAULT 0,

    TASA_INTERES FOR COLUMN TASINT DECIMAL(18, 2)
                         NOT NULL DEFAULT 0,

    PLAZO_MESES FOR COLUMN PLZMES INTEGER
                         NOT NULL DEFAULT 0,

    DIAS_MORA FOR COLUMN DIAMOR INTEGER
                         NOT NULL DEFAULT 0,

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

    CONSTRAINT DLCLP_PK PRIMARY KEY (NUMCLI, NUMCTA, REFCLS),

    CONSTRAINT DLCLP_CUMST_FK FOREIGN KEY (NUMCLI)
        REFERENCES CUMST (NUMCLI),

    CONSTRAINT DLCLP_ESTREG_CST CHECK (ESTREG IN ('A', 'I'))

) RCDFMT RDLCLP;

RENAME TABLE DLCLP
TO CALIFICACION_CARTERA
FOR SYSTEM NAME DLCLP;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE DLCLP IS
'CALIFICACION_CARTERA';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN DLCLP.NUMCLI IS 'Identificador del cliente.';

COMMENT ON COLUMN DLCLP.NUMCTA IS 'Número de la cuenta.';

COMMENT ON COLUMN DLCLP.REFCLS IS 'Referencia de la calificación.';

COMMENT ON COLUMN DLCLP.FECDSM IS 'Fecha de desembolso.';

COMMENT ON COLUMN DLCLP.FECVEN IS 'Fecha de vencimiento.';

COMMENT ON COLUMN DLCLP.MNTORI IS 'Monto original de la operación.';

COMMENT ON COLUMN DLCLP.SLDACT IS 'Saldo actual de la operación.';

COMMENT ON COLUMN DLCLP.TASINT IS 'Tasa de interés aplicada.';

COMMENT ON COLUMN DLCLP.PLZMES IS 'Plazo en meses de la operación.';

COMMENT ON COLUMN DLCLP.DIAMOR IS 'Días de mora de la operación.';

COMMENT ON COLUMN DLCLP.ESTOPE IS 'Estado de la operación.';

COMMENT ON COLUMN DLCLP.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN DLCLP.OBSREG IS 'Observaciones adicionales.';

COMMENT ON COLUMN DLCLP.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN DLCLP.USRING IS 
'Usuario que creó el registro.';

COMMENT ON COLUMN DLCLP.FECING IS
'Fecha y hora de creación del registro.';

COMMENT ON COLUMN DLCLP.USRACT IS
'Usuario que realizó la última actualización.';

COMMENT ON COLUMN DLCLP.FECACT IS
'Fecha y hora de la última actualización.';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE DLCLP IS 'CALIFICACION_CARTERA';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN DLCLP.NUMCLI IS 'ID Cliente';
LABEL ON COLUMN DLCLP.NUMCTA IS 'Número Cuenta';
LABEL ON COLUMN DLCLP.REFCLS IS 'Referencia';
LABEL ON COLUMN DLCLP.FECDSM IS 'Fecha Desembolso';
LABEL ON COLUMN DLCLP.FECVEN IS 'Fecha Vencimiento';
LABEL ON COLUMN DLCLP.MNTORI IS 'Monto Original';
LABEL ON COLUMN DLCLP.SLDACT IS 'Saldo Actual';
LABEL ON COLUMN DLCLP.TASINT IS 'Tasa Interés';
LABEL ON COLUMN DLCLP.PLZMES IS 'Plazo Meses';
LABEL ON COLUMN DLCLP.DIAMOR IS 'Días Mora';
LABEL ON COLUMN DLCLP.ESTOPE IS 'Estado Operación';
LABEL ON COLUMN DLCLP.VERREG IS 'Versión Registro';
LABEL ON COLUMN DLCLP.OBSREG IS 'Observaciones';
LABEL ON COLUMN DLCLP.ESTREG IS 'Estado Registro';
LABEL ON COLUMN DLCLP.USRING IS 'Usuario Creación';
LABEL ON COLUMN DLCLP.FECING IS 'Fecha Creación';
LABEL ON COLUMN DLCLP.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN DLCLP.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN DLCLP.NUMCLI TEXT IS 'ID Cliente';
LABEL ON COLUMN DLCLP.NUMCTA TEXT IS 'Número Cuenta';
LABEL ON COLUMN DLCLP.REFCLS TEXT IS 'Referencia';
LABEL ON COLUMN DLCLP.FECDSM TEXT IS 'Fecha Desembolso';
LABEL ON COLUMN DLCLP.FECVEN TEXT IS 'Fecha Vencimiento';
LABEL ON COLUMN DLCLP.MNTORI TEXT IS 'Monto Original';
LABEL ON COLUMN DLCLP.SLDACT TEXT IS 'Saldo Actual';
LABEL ON COLUMN DLCLP.TASINT TEXT IS 'Tasa Interés';
LABEL ON COLUMN DLCLP.PLZMES TEXT IS 'Plazo Meses';
LABEL ON COLUMN DLCLP.DIAMOR TEXT IS 'Días Mora';
LABEL ON COLUMN DLCLP.ESTOPE TEXT IS 'Estado Operación';
LABEL ON COLUMN DLCLP.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN DLCLP.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN DLCLP.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN DLCLP.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN DLCLP.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN DLCLP.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN DLCLP.FECACT TEXT IS 'Fecha Actualiza';