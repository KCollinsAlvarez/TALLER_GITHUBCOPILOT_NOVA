# 01_AUDITORIA_MODELO.md

# Auditoría del Modelo de Datos

## Proyecto

Reestructuración y Validación del Modelo de Base de Datos Propuesto

## Versión

1.0

---

# 1. Objetivo

Realizar una auditoría técnica del modelo de datos compuesto por 114 tablas distribuidas en 15 módulos funcionales con el fin de identificar inconsistencias estructurales, problemas de integridad referencial, ambigüedades de modelado y riesgos de implementación.

La auditoría constituye la base para la posterior generación del modelo corregido.

---

# 2. Resumen Ejecutivo

Se analizaron las 114 tablas identificadas en el modelo original. El modelo presenta una estructura funcional coherente y una clara separación por dominios de negocio. Sin embargo, se detectaron inconsistencias importantes relacionadas con:

* Ausencia de claves primarias en tablas maestras.
* Relaciones documentadas que no pueden implementarse físicamente.
* Uso inconsistente de claves técnicas y claves funcionales.
* Relaciones polimórficas.
* Cardinalidades invertidas.
* Tablas históricas sin identificador único.
* Campos referenciados que no existen físicamente en algunas tablas maestras.

El modelo es recuperable sin eliminar tablas y manteniendo el total de 114 entidades.

---

# 3. Alcance Auditado

## Distribución por módulos

| Módulo                 | Tablas |
| ---------------------- | -----: |
| Archivos Comunes       |     27 |
| Clientes               |      5 |
| Cuentas y Chequeras    |     18 |
| Contratos y Préstamos  |      9 |
| Cartas de Crédito      |     10 |
| Cobranzas              |      4 |
| Contabilidad           |      9 |
| Garantías              |      2 |
| Líneas de Crédito      |      1 |
| Activos Fijos          |      4 |
| Proveedores y CxP      |      7 |
| Pagos y Transferencias |      6 |
| Propuesta de Crédito   |      9 |
| Manejo de Documentos   |      2 |
| Seguridad              |      1 |

Total auditado: 114 tablas.

---

# 4. Hallazgos Críticos

## AUD-001

### Tablas maestras sin clave funcional explícita

Se identificaron entidades maestras cuyo diccionario original indica:

"No tiene clave"

Tablas afectadas:

* DEALS
* LCMST
* DCMST
* GLBSE
* GLFIN
* LCSTA
* MSSGS
* HLHIS

Riesgo:

No pueden actuar como destino confiable de claves foráneas.

Nivel:

CRÍTICO

---

## AUD-002

### Inconsistencia entre PK técnica y FK funcional

En la versión enriquecida se introducen claves técnicas tipo:

id BIGINT

Sin embargo múltiples tablas continúan utilizando claves funcionales históricas.

Casos detectados:

#### ACMST

Relaciones dependientes:

* STPMT
* PBTRN
* RCLNB
* CMRIN
* TRANS
* TTRAN

Requiere:

UNIQUE(numero_cuenta)

---

#### DEALS

Relaciones dependientes:

* DLPMT
* DLDRF
* DLSDE
* DDCPN
* DLITP

Requiere:

UNIQUE(numero_prestamo)

---

#### LCMST

Relaciones dependientes:

* LCDOC
* LCADM
* LCCOV
* LCDIN
* APPRV
* LCFEE

Requiere:

UNIQUE(numero_carta_credito)

Nivel:

CRÍTICO

---

## AUD-003

### Relación polimórfica

Tabla:

SPINS

La definición funcional permite relacionarse indistintamente con:

* Cliente
* Cuenta

Una FK tradicional no soporta esta implementación.

Nivel:

ALTO

---

## AUD-004

### Cardinalidad documental invertida

Se detectó contradicción entre:

Vista conceptual:

DIMST → DITBL

y

Diccionario enriquecido:

DIMST.numero_tabla FK → DITBL.numero_tabla

La relación correcta debe ser:

DITBL (1) → (N) DIMST

Nivel:

ALTO

---

# 5. Hallazgos de Integridad

## Tablas sin PK claramente definida

Se recomienda incorporar PK técnica.

### Grupo 1

* MSSGS
* HLHIS
* LCSTA
* DCMST
* GLBSE
* GLFIN
* OVDRF

### Acción

Agregar:

id BIGINT GENERATED ALWAYS AS IDENTITY

---

## Tablas con claves ambiguas

### CNTRLLCP

Clave reportada:

Banco, ?LCRPARM?

No existe definición suficiente.

### CNTRLPRF

Clave reportada:

Banco, ?PAR?, Código Tabla

No existe definición suficiente.

### CCDSC

Documento indica:

"No especificada"

Nivel:

MEDIO

---

# 6. Hallazgos de Normalización

## Cumplimiento General

El modelo cumple razonablemente:

* Primera Forma Normal
* Segunda Forma Normal

No obstante existen riesgos de:

### Dependencias transitivas

En:

* TRANS
* TTRAN
* FIWRT
* SWITF
* BAHIS

Requieren validación posterior.

---

## Posibles catálogos reutilizables

Se identifican múltiples atributos repetidos:

* estado_*
* tipo_*
* codigo_tabla

Se recomienda reutilizar:

* CNOFT
* CNOFC

como catálogos corporativos.

---

# 7. Validación de Relaciones de Negocio

## Relaciones Correctas

### Clientes

CUMST
├─ CUMAD
├─ CUMSD
├─ ACMST
├─ DEALS
├─ ROCOL
└─ LNECR

### Cuentas

ACMST
├─ STPMT
├─ PBTRN
├─ RCLNB
├─ CHMST
│  └─ CHPER
├─ CMRIN
├─ TRANS
└─ TTRAN

### Contratos

DEALS
├─ DLPMT
├─ DLDRF
├─ DLSDE
├─ DLITP
└─ DDCPN

### Cartas de Crédito

LCMST
├─ LCDOC
├─ LCADM
├─ LCCOV
├─ LCDIN
├─ APPRV
└─ LCFEE

### Garantías

ROCOL
└─ RCOLL

### Cuentas por Pagar

BAVEN
└─ BAPRC
├─ BAMOR
├─ BAHIS
└─ BAINP

### Propuesta de Crédito

PLPCR
├─ PLPRD
└─ PLGRT

DPMST
└─ DPDTL

IFMST
└─ IFDTL

### Documentos

DITBL
└─ DIMST

---

# 8. Riesgos Identificados

| Riesgo                               | Impacto |
| ------------------------------------ | ------- |
| FK hacia columnas inexistentes       | Alto    |
| PK faltantes                         | Alto    |
| Cardinalidades incorrectas           | Alto    |
| Ambigüedad documental                | Medio   |
| Dependencias funcionales incompletas | Medio   |
| Duplicidad lógica en históricos      | Bajo    |

---

# 9. Conclusiones

1. El modelo conserva coherencia funcional.
2. No es necesario eliminar tablas.
3. No es necesario agregar tablas nuevas.
4. Se requiere formalizar claves candidatas mediante UNIQUE.
5. Se requiere corregir relaciones ambiguas.
6. El modelo puede mantenerse con exactamente 114 tablas.
7. La siguiente fase consiste en construir la matriz referencial completa y el modelo corregido definitivo.

Estado de auditoría:

APROBADO CON OBSERVACIONES
