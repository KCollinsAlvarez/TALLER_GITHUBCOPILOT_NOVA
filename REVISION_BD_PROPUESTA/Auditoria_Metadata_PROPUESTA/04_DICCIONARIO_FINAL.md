# 04_DICCIONARIO_FINAL.md

# Diccionario de Datos Definitivo

## Proyecto

Reestructuración y Normalización del Modelo de Base de Datos

## Versión

1.0

---

# 1. Objetivo

Definir el estándar corporativo para la documentación de las 114 tablas que conforman el modelo de datos corregido.

Este documento servirá como referencia para:

* Generación de DDL.
* Validación de integridad referencial.
* Construcción de índices.
* Migraciones futuras.
* Gobierno de datos.

---

# 2. Estándares Corporativos

## Clave Primaria

Todas las tablas deberán poseer una PK.

Formato estándar:

```sql
id BIGINT
GENERATED ALWAYS AS IDENTITY
PRIMARY KEY
```

---

## Claves de Negocio

Las claves históricas deberán mantenerse mediante:

```sql
UNIQUE
```

Ejemplos:

```text
numero_cuenta
numero_prestamo
numero_carta_credito
numero_garantia
numero_proveedor
```

---

## Claves Foráneas

Toda FK debe apuntar a:

* PRIMARY KEY
  o
* UNIQUE

No se permiten referencias implícitas.

---

## Índices

Toda FK deberá poseer índice.

Regla:

```sql
CREATE INDEX
```

sobre:

* id_cliente
* numero_cuenta
* numero_prestamo
* numero_carta_credito
* numero_proveedor

según corresponda.

---

# 3. Diccionario de Entidades Principales

---

## CUMST

### Descripción

Maestro de clientes.

### PK

```text
id
```

### Clave de Negocio

```text
id_cliente
```

### UNIQUE

```text
id_cliente
```

### Relaciones

Padre de:

* CUMAD
* CUMSD
* ACMST
* DEALS
* ROCOL
* LNECR
* SPINS

### Índices

```text
IX_CUMST_ID_CLIENTE
```

---

## ACMST

### Descripción

Maestro de cuentas.

### PK

```text
id
```

### Clave de Negocio

```text
numero_cuenta
```

### UNIQUE

```text
numero_cuenta
```

### Relaciones

Padre de:

* STPMT
* PBTRN
* RCLNB
* CHMST
* CMRIN
* TRANS
* TTRAN

### FK

```text
id_cliente -> CUMST.id_cliente
```

### Índices

```text
IX_ACMST_NUM_CUENTA
IX_ACMST_CLIENTE
```

---

## DEALS

### Descripción

Contratos y préstamos.

### PK

```text
id
```

### Clave de Negocio

```text
numero_prestamo
```

### UNIQUE

```text
numero_prestamo
```

### Relaciones

Padre de:

* DLPMT
* DLDRF
* DLSDE
* DLITP
* DDCPN

### FK

```text
id_cliente -> CUMST.id_cliente
```

---

## ROCOL

### Descripción

Garantías asociadas a clientes.

### PK

```text
id
```

### Clave de Negocio

```text
numero_garantia
```

### UNIQUE

```text
numero_garantia
```

### Relaciones

Padre de:

* RCOLL

### FK

```text
id_cliente -> CUMST.id_cliente
```

---

## LNECR

### Descripción

Líneas de crédito.

### PK

```text
id
```

### Clave de Negocio

```text
numero_linea_credito
```

### UNIQUE

```text
numero_linea_credito
```

### FK

```text
id_cliente -> CUMST.id_cliente
```

---

## LCMST

### Descripción

Cartas de crédito.

### PK

```text
id
```

### Clave de Negocio

```text
numero_carta_credito
```

### UNIQUE

```text
numero_carta_credito
```

### Relaciones

Padre de:

* LCDOC
* LCADM
* LCCOV
* LCDIN
* APPRV
* LCFEE

---

## GLMST

### Descripción

Catálogo maestro contable.

### PK

```text
id
```

### Clave de Negocio

```text
cuenta_contable
```

### UNIQUE

```text
cuenta_contable
```

### Relaciones

Padre de:

* GLBLN
* INPUT
* INPT2
* NXINP
* TRANS
* TTRAN

---

## BAVEN

### Descripción

Maestro de proveedores.

### PK

```text
id
```

### Clave de Negocio

```text
numero_proveedor
```

### UNIQUE

```text
numero_proveedor
```

### Relaciones

Padre de:

* BAPRC

---

## BAPRC

### Descripción

Procesos de cuentas por pagar.

### PK

```text
id
```

### Relaciones

Padre de:

* BAMOR
* BAHIS
* BAINP

---

## PLPCR

### Descripción

Propuesta de crédito.

### PK

```text
id
```

### Relaciones

Padre de:

* PLPRD
* PLGRT

---

## DPMST

### Descripción

Documentación principal.

### PK

```text
id
```

### Relaciones

Padre de:

* DPDTL

---

## IFMST

### Descripción

Información financiera principal.

### PK

```text
id
```

### Relaciones

Padre de:

* IFDTL

---

## DITBL

### Descripción

Catálogo de tipos documentales.

### PK

```text
id
```

### Clave de Negocio

```text
numero_tabla
```

### UNIQUE

```text
numero_tabla
```

### Relaciones

Padre de:

* DIMST

---

## DIMST

### Descripción

Inventario documental.

### PK

```text
id
```

### FK

```text
numero_tabla
    ->
DITBL.numero_tabla
```

---

# 4. Tablas que Requieren PK Técnica

Las siguientes entidades deberán incorporar PK técnica:

* MSSGS
* HLHIS
* LCSTA
* DCMST
* GLBSE
* GLFIN
* OVDRF

Formato:

```sql
id BIGINT
GENERATED ALWAYS AS IDENTITY
PRIMARY KEY
```

---

# 5. Reglas de Integridad

## RI-001

Toda tabla debe poseer PK.

---

## RI-002

Toda FK debe referenciar:

* PK
  o
* UNIQUE

---

## RI-003

Toda clave de negocio debe poseer:

```text
UNIQUE
```

---

## RI-004

Toda FK debe poseer índice.

---

## RI-005

No se permiten relaciones polimórficas.

Caso corregido:

```text
SPINS
```

---

# 6. Convenciones de Nombres

## PK

```text
PK_<TABLA>
```

Ejemplo:

```text
PK_ACMST
```

---

## FK

```text
FK_<ORIGEN>_<DESTINO>
```

Ejemplo:

```text
FK_ACMST_CUMST
```

---

## UNIQUE

```text
UK_<TABLA>_<CAMPO>
```

Ejemplo:

```text
UK_ACMST_NUMERO_CUENTA
```

---

## Índices

```text
IX_<TABLA>_<CAMPO>
```

Ejemplo:

```text
IX_ACMST_NUM_CUENTA
```

---

# 7. Estado del Modelo

| Elemento                 | Estado |
| ------------------------ | ------ |
| Tablas                   | 114    |
| Eliminadas               | 0      |
| Agregadas                | 0      |
| PK definidas             | Sí     |
| UNIQUE definidos         | Sí     |
| FK definidas             | Sí     |
| Índices definidos        | Sí     |
| Compatible DB2 for IBM i | Sí     |

---
