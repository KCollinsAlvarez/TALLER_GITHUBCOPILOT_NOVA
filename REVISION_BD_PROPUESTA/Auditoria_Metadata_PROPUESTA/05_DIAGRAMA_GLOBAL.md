# 05_DIAGRAMA_GLOBAL.md

# Diagrama Global del Modelo de Datos

## Proyecto

Reestructuración y Normalización del Modelo de Base de Datos

## Versión

1.0

---

# 1. Objetivo

Presentar una vista consolidada de la arquitectura relacional del modelo de datos compuesto por 114 tablas.

El propósito de este documento es:

* Visualizar dependencias entre módulos.
* Identificar entidades maestras.
* Validar la coherencia funcional.
* Facilitar futuras implementaciones.
* Servir como referencia para la generación de DDL.

---

# 2. Arquitectura General

```text
                          +---------+
                          |  CUMST  |
                          |Clientes |
                          +----+----+
                               |
        +----------------------+----------------------+
        |                      |                      |
        v                      v                      v

    +-------+            +---------+            +---------+
    | ACMST |            | DEALS   |            | ROCOL   |
    |Cuenta |            |Prestamo |            |Garantia |
    +---+---+            +----+----+            +----+----+
        |                     |                      |
        |                     |                      |
        v                     v                      v

   Transacciones       Contratos Hijos         RCOLL

        |
        |
        v

   Chequeras
   Cámara
   Movimientos
```

---

# 3. Mapa General por Dominios

```text
CLIENTES
│
├── CUMAD
├── CUMSD
├── SPINS
├── ACMST
├── DEALS
├── ROCOL
└── LNECR
```

Entidad Maestra:

```text
CUMST
```

---

# 4. Dominio de Clientes

```text
CUMST
│
├── CUMAD
│
├── CUMSD
│
├── SPINS
│
├── ACMST
│
├── DEALS
│
├── ROCOL
│
└── LNECR
```

Responsabilidad:

* Administración de clientes.
* Datos generales.
* Direcciones.
* Identificaciones.
* Productos asociados.

---

# 5. Dominio de Cuentas

```text
ACMST
│
├── STPMT
│
├── PBTRN
│
├── RCLNB
│
├── CHMST
│     │
│     └── CHPER
│
├── CMRIN
│
├── TRANS
│
└── TTRAN
```

Entidad Maestra:

```text
ACMST
```

Clave de negocio:

```text
numero_cuenta
```

---

# 6. Dominio de Contratos y Préstamos

```text
DEALS
│
├── DLPMT
│
├── DLDRF
│
├── DLSDE
│
├── DLITP
│
└── DDCPN
```

Entidad Maestra:

```text
DEALS
```

Clave de negocio:

```text
numero_prestamo
```

---

# 7. Dominio de Cartas de Crédito

```text
LCMST
│
├── LCDOC
│
├── LCADM
│
├── LCCOV
│
├── LCDIN
│
├── APPRV
│
└── LCFEE
```

Entidad Maestra:

```text
LCMST
```

Clave de negocio:

```text
numero_carta_credito
```

---

# 8. Dominio de Garantías

```text
ROCOL
│
└── RCOLL
```

Entidad Maestra:

```text
ROCOL
```

Clave de negocio:

```text
numero_garantia
```

---

# 9. Dominio de Líneas de Crédito

```text
LNECR
```

Dependencia:

```text
LNECR
  └── CUMST
```

Entidad Maestra:

```text
LNECR
```

---

# 10. Dominio Contable

```text
GLMST
│
├── GLBLN
│
├── INPUT
│
├── INPT2
│
├── NXINP
│
├── TRANS
│
└── TTRAN
```

Entidad Maestra:

```text
GLMST
```

Clave de negocio:

```text
cuenta_contable
```

---

# 11. Dominio de Proveedores y CxP

```text
BAVEN
│
└── BAPRC
      │
      ├── BAMOR
      ├── BAHIS
      └── BAINP
```

Entidad Maestra:

```text
BAVEN
```

Clave de negocio:

```text
numero_proveedor
```

---

# 12. Dominio de Pagos y Transferencias

```text
SWIFT
│
├── SWITF
│
├── FIWRT
│
└── CMRIN
```

Responsabilidad:

* Transferencias.
* Mensajería financiera.
* Operaciones interbancarias.

---

# 13. Dominio de Propuesta de Crédito

```text
PLPCR
│
├── PLPRD
│
└── PLGRT


DPMST
│
└── DPDTL


IFMST
│
└── IFDTL
```

Responsabilidad:

* Evaluación crediticia.
* Documentación.
* Información financiera.

---

# 14. Dominio Documental

```text
DITBL
│
└── DIMST
```

Relación Correcta:

```text
DITBL (1)
    │
    └─────── (N) DIMST
```

Entidad Maestra:

```text
DITBL
```

Clave de negocio:

```text
numero_tabla
```

---

# 15. Dominio de Seguridad

```text
SECURITY
│
└── CNTRLPRF
```

Responsabilidad:

* Parámetros.
* Perfiles.
* Seguridad operativa.

---

# 16. Flujo Principal de Negocio

```text
CLIENTE
   │
   ▼
CUENTA
   │
   ▼
TRANSACCIÓN
   │
   ▼
CONTABILIDAD
   │
   ▼
PROCESOS
   │
   ▼
HISTÓRICOS
```

---

# 17. Entidades Maestras del Sistema

Las siguientes entidades actúan como núcleo del modelo:

| Entidad | Dominio              |
| ------- | -------------------- |
| CUMST   | Clientes             |
| ACMST   | Cuentas              |
| DEALS   | Préstamos            |
| LCMST   | Cartas de Crédito    |
| ROCOL   | Garantías            |
| LNECR   | Líneas de Crédito    |
| GLMST   | Contabilidad         |
| BAVEN   | Proveedores          |
| PLPCR   | Propuesta de Crédito |
| DITBL   | Documentos           |

---

# 18. Dependencias Críticas

## Dependencia Cliente

```text
CUMST
│
├── ACMST
├── DEALS
├── ROCOL
└── LNECR
```

Impacto:

Si falla la integridad de CUMST se afecta gran parte del modelo.

---

## Dependencia Cuenta

```text
ACMST
│
├── TRANS
├── TTRAN
├── CHMST
└── CMRIN
```

Impacto:

Afecta operaciones financieras.

---

## Dependencia Contable

```text
GLMST
│
├── INPUT
├── INPT2
├── NXINP
├── TRANS
└── TTRAN
```

Impacto:

Afecta la trazabilidad contable.

---

# 19. Estado Final del Modelo

| Elemento                        | Resultado |
| ------------------------------- | --------- |
| Total de tablas                 | 114       |
| Tablas eliminadas               | 0         |
| Tablas agregadas                | 0         |
| PK definidas                    | Sí        |
| UNIQUE definidos                | Sí        |
| FK corregidas                   | Sí        |
| Cardinalidades corregidas       | Sí        |
| Compatible DB2 for IBM i        | Sí        |
| Integridad referencial validada | Sí        |
| Arquitectura consolidada        | Sí        |

---

# 20. Conclusión General

El modelo puede mantenerse con las 114 tablas originales.

Las inconsistencias detectadas durante la auditoría se resuelven mediante:

* Formalización de claves técnicas.
* Incorporación de claves candidatas UNIQUE.
* Corrección de relaciones ambiguas.
* Ajuste de cardinalidades.
* Estandarización de integridad referencial.

No se requiere eliminar entidades ni ampliar el modelo.

El modelo ajustado queda preparado para la siguiente etapa:

GENERACIÓN DEL DDL CORPORATIVO DB2 FOR IBM i.
