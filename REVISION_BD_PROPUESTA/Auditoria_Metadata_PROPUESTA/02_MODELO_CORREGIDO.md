# 02_MODELO_CORREGIDO.md

# Modelo de Datos Corregido

## Proyecto

Reestructuración y Normalización del Modelo de Base de Datos

## Versión

1.0

---

# 1. Objetivo

Definir la estructura objetivo del modelo de datos corregido a partir de los hallazgos identificados durante la auditoría.

Este documento establece:

* Claves primarias definitivas.
* Claves candidatas (UNIQUE).
* Relaciones válidas.
* Cardinalidades corregidas.
* Reglas de integridad referencial.

El modelo conserva exactamente las 114 tablas originales.

---

# 2. Principios de Corrección Aplicados

## PRC-001

### Separación entre clave técnica y clave de negocio

Todas las entidades principales deberán utilizar:

```text
id BIGINT
```

como clave primaria técnica.

Las claves funcionales históricas se conservarán mediante restricciones UNIQUE.

---

## PRC-002

### Todas las FK deben apuntar a una PK o UNIQUE

No se permitirán referencias hacia atributos que no posean:

* PRIMARY KEY
* UNIQUE

---

## PRC-003

### Conservación de las 114 tablas

No se eliminan entidades.

No se agregan nuevas entidades.

---

## PRC-004

### Conservación de la funcionalidad IBS

Las relaciones funcionales originales se mantienen.

---

# 3. Estándar de Claves

## Clave Primaria

Formato estándar:

```sql
id BIGINT
GENERATED ALWAYS AS IDENTITY
PRIMARY KEY
```

---

## Claves Funcionales

Cuando una entidad posea una clave de negocio histórica deberá definirse:

```sql
UNIQUE
```

sobre dicha columna.

---

# 4. Ajustes de Entidades Maestras

## ACMST

### PK

```text
id
```

### UNIQUE

```text
numero_cuenta
```

### Justificación

Las siguientes tablas utilizan numero_cuenta como referencia:

* STPMT
* PBTRN
* RCLNB
* CMRIN
* TRANS
* TTRAN

### Estado Final

```text
PK:
 id

UNIQUE:
 numero_cuenta
```

---

## DEALS

### PK

```text
id
```

### UNIQUE

```text
numero_prestamo
```

### Relaciones

* DLPMT
* DLDRF
* DLSDE
* DLITP
* DDCPN

### Estado Final

```text
PK:
 id

UNIQUE:
 numero_prestamo
```

---

## LCMST

### PK

```text
id
```

### UNIQUE

```text
numero_carta_credito
```

### Relaciones

* LCDOC
* LCADM
* LCCOV
* LCDIN
* APPRV
* LCFEE

### Estado Final

```text
PK:
 id

UNIQUE:
 numero_carta_credito
```

---

## ROCOL

### PK

```text
id
```

### UNIQUE

```text
numero_garantia
```

### Relaciones

* RCOLL

---

## LNECR

### PK

```text
id
```

### UNIQUE

```text
numero_linea_credito
```

---

## BAVEN

### PK

```text
id
```

### UNIQUE

```text
numero_proveedor
```

---

# 5. Corrección de Relaciones Especiales

## SPINS

### Problema

Referencia simultáneamente:

* Cliente
* Cuenta

No es implementable mediante una FK convencional.

### Estructura Corregida

```text
tipo_referencia

num_cliente

numero_cuenta
```

### Regla

Si:

```text
tipo_referencia = CLIENTE
```

entonces:

```text
num_cliente NOT NULL
```

Si:

```text
tipo_referencia = CUENTA
```

entonces:

```text
numero_cuenta NOT NULL
```

---

## DIMST y DITBL

### Relación Correcta

```text
DITBL (1)
    |
    |
    +----- (N) DIMST
```

### FK Definitiva

```text
DIMST.numero_tabla
    ->
DITBL.numero_tabla
```

---

# 6. Tablas que Requieren PK Técnica

## Grupo A

Las siguientes tablas deberán incorporar:

```sql
id BIGINT
GENERATED ALWAYS AS IDENTITY
PRIMARY KEY
```

### Tablas

* MSSGS
* HLHIS
* LCSTA
* DCMST
* GLBSE
* GLFIN
* OVDRF

---

# 7. Modelo Relacional Definitivo

## Clientes

```text
CUMST
 ├─ CUMAD
 ├─ CUMSD
 ├─ SPINS
 ├─ ACMST
 ├─ DEALS
 ├─ ROCOL
 └─ LNECR
```

---

## Cuentas

```text
ACMST
 ├─ STPMT
 ├─ PBTRN
 ├─ RCLNB
 ├─ CHMST
 │   └─ CHPER
 ├─ CMRIN
 ├─ TRANS
 └─ TTRAN
```

---

## Contratos

```text
DEALS
 ├─ DLPMT
 ├─ DLDRF
 ├─ DLSDE
 ├─ DLITP
 └─ DDCPN
```

---

## Cartas de Crédito

```text
LCMST
 ├─ LCDOC
 ├─ LCADM
 ├─ LCCOV
 ├─ LCDIN
 ├─ APPRV
 └─ LCFEE
```

---

## Garantías

```text
ROCOL
 └─ RCOLL
```

---

## Proveedores

```text
BAVEN
 └─ BAPRC
      ├─ BAMOR
      ├─ BAHIS
      └─ BAINP
```

---

## Propuesta de Crédito

```text
PLPCR
 ├─ PLPRD
 └─ PLGRT

DPMST
 └─ DPDTL

IFMST
 └─ IFDTL
```

---

## Documentos

```text
DITBL
 └─ DIMST
```

---

# 8. Restricciones Globales

## RGI-001

Toda FK debe apuntar a:

* PK
  o
* UNIQUE

---

## RGI-002

No se permiten referencias polimórficas directas.

---

## RGI-003

Toda tabla debe poseer PK.

---

## RGI-004

Las tablas históricas deberán poseer identificador único.

---

# 9. Resultado Esperado

## Estado del Modelo

| Métrica                      | Resultado |
| ---------------------------- | --------- |
| Tablas                       | 114       |
| Tablas eliminadas            | 0         |
| Tablas agregadas             | 0         |
| PK definidas                 | Sí        |
| UNIQUE definidos             | Sí        |
| FK corregidas                | Sí        |
| Cardinalidades corregidas    | Sí        |
| Compatible con DB2 for IBM i | Sí        |

---
