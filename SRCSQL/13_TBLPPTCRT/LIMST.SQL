--======================================================================
-- Nombre de la Tabla : LIMST - DECLAR_LEGAL_PERSON
--
-- DESCRIPCIÓN:
-- Cabecera de declaración legal de personas jurídicas. Registra
-- información de propuestas de crédito para personas jurídicas
-- incluyendo montos, plazos, tasas y dictámenes para gestión de
-- líneas de crédito corporativo.
--
-- Objetivo:
-- Mantener cabecera de declaraciones legales de personas jurídicas
-- como base para análisis crediticio corporativo.
--
-- Tipo de Tabla:
-- Maestro.
--
-- Origen de los Datos:
-- Propuestas de crédito de personas jurídicas del banco.
--
-- Permanencia de Datos:
-- Permanente (histórico de declaraciones legales).
--
-- Uso de los Datos:
-- Gestión de líneas corporativas, análisis crediticio jurídico,
-- auditoría de propuestas y seguimiento de dictámenes legales.
--
-- Restricciones:
-- PK simple: id_cliente.
-- ESTADO_REGISTRO solo acepta A o I.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: 2026-06-21
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================
CREATE OR REPLACE TABLE LIMST (
    NUM_CLIENTE FOR COLUMN NUMCLI VARCHAR(30)
                        NOT NULL,
    
    FECHA_PROPUESTA FOR COLUMN FECPRP DATE
                         NOT NULL DEFAULT '0001-01-01',
    
    MONTO_SOLICITADO FOR COLUMN MNTSLC DECIMAL(18, 2)
                             NOT NULL DEFAULT 0,
    
    PLAZO_MESES FOR COLUMN PLZMES INTEGER
                       NOT NULL DEFAULT 0,
    
    TASA_PROPUESTA FOR COLUMN TASPRP DECIMAL(18, 2)
                            NOT NULL DEFAULT 0,
    
    DICTAMEN_CREDITO FOR COLUMN DCTCRT VARCHAR(120)
                            NOT NULL DEFAULT '',
    
    ESTADO_PROPUESTA FOR COLUMN ESTPRP VARCHAR(20)
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
    
    CONSTRAINT LIMST_PK PRIMARY KEY (NUMCLI),

    CONSTRAINT LIMST_ESTREG_CHK CHECK (ESTREG IN ('A', 'I'))
) RCDFMT RLIMST;

RENAME TABLE LIMST
TO DECLAR_LEGAL_PERSON
FOR SYSTEM NAME LIMST;

--======================================================================
-- Comentarios de Tabla
--======================================================================
COMMENT ON TABLE LIMST IS
'DECLAR_LEGAL_PERSON';

--======================================================================
-- Comentarios de Columnas
--======================================================================
COMMENT ON COLUMN LIMST.NUMCLI IS
'Número del cliente';

COMMENT ON COLUMN LIMST.FECPRP IS
'Fecha de la propuesta.';

COMMENT ON COLUMN LIMST.MNTSLC IS
'Monto solicitado.';

COMMENT ON COLUMN LIMST.PLZMES IS
'Plazo en meses.';

COMMENT ON COLUMN LIMST.TASPRP IS
'Tasa propuesta.';

COMMENT ON COLUMN LIMST.DCTCRT IS
'Dictamen de crédito.';

COMMENT ON COLUMN LIMST.ESTPRP IS
'Estado de la propuesta.';

COMMENT ON COLUMN POTLX.VERREG IS
'Versión del registro para control de cambios.';

COMMENT ON COLUMN POTLX.OBSREG IS
'Observaciones adicionales.';

COMMENT ON COLUMN POTLX.ESTREG IS
'Estado del registro. A=Activo, I=Inactivo.';

COMMENT ON COLUMN LIMST.USRING IS
'Usuario que creó el registro';

COMMENT ON COLUMN LIMST.FECING IS
'Fecha y hora de creación';

COMMENT ON COLUMN LIMST.USRACT IS
'Usuario que realizó la última actualización';

COMMENT ON COLUMN LIMST.FECACT IS
'Fecha y hora de la última actualización';

--======================================================================
-- Labels de Tabla
--======================================================================
LABEL ON TABLE LIMST IS 'DECLAR_LEGAL_PERSON';

--======================================================================
-- Labels de Columnas
--======================================================================
LABEL ON COLUMN LIMST.NUMCLI IS 'Número Cliente';
LABEL ON COLUMN LIMST.FECPRP IS 'Fecha Propuesta';
LABEL ON COLUMN LIMST.MNTSLC IS 'Monto Solicitado';
LABEL ON COLUMN LIMST.PLZMES IS 'Plazo Meses';
LABEL ON COLUMN LIMST.TASPRP IS 'Tasa Propuesta';
LABEL ON COLUMN LIMST.DCTCRT IS 'Dictamen Crédito';
LABEL ON COLUMN LIMST.ESTPRP IS 'Estado Propuesta';
LABEL ON COLUMN POTLX.VERREG IS 'Versión Registro';
LABEL ON COLUMN POTLX.OBSREG IS 'Observaciones';
LABEL ON COLUMN POTLX.ESTREG IS 'Estado Registro';
LABEL ON COLUMN LIMST.USRING IS 'Usuario Creación';
LABEL ON COLUMN LIMST.FECING IS 'Fecha Creación';
LABEL ON COLUMN LIMST.USRACT IS 'Usuario Actualiza';
LABEL ON COLUMN LIMST.FECACT IS 'Fecha Actualiza';

--======================================================================
-- Labels TEXT IS de Columnas
--======================================================================
LABEL ON COLUMN LIMST.NUMCLI  TEXT IS 'Número Cliente';
LABEL ON COLUMN LIMST.FECPRP TEXT IS 'Fecha Propuesta';
LABEL ON COLUMN LIMST.MNTSLC  TEXT IS 'Monto Solicitado';
LABEL ON COLUMN LIMST.PLZMES  TEXT IS 'Plazo Meses';
LABEL ON COLUMN LIMST.TASPRP TEXT IS 'Tasa Propuesta';
LABEL ON COLUMN LIMST.DCTCRT  TEXT IS 'Dictamen Crédito';
LABEL ON COLUMN LIMST.ESTPRP TEXT IS 'Estado Propuesta';
LABEL ON COLUMN POTLX.VERREG TEXT IS 'Versión Registro';
LABEL ON COLUMN POTLX.OBSREG TEXT IS 'Observaciones';
LABEL ON COLUMN POTLX.ESTREG TEXT IS 'Estado Registro';
LABEL ON COLUMN LIMST.USRING TEXT IS 'Usuario Creación';
LABEL ON COLUMN LIMST.FECING TEXT IS 'Fecha Creación';
LABEL ON COLUMN LIMST.USRACT TEXT IS 'Usuario Actualiza';
LABEL ON COLUMN LIMST.FECACT TEXT IS 'Fecha Actualiza';