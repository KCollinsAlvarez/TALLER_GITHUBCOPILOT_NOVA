# PLAN_CARGA_DATOS.md

## PROYECTO

Taller GitHub Copilot NOVA

---

## OBJETIVO

Definir el orden de generación y carga de datos de prueba
para las tablas críticas del modelo de datos.

Este documento actúa como orquestador del proceso de
generación de datos.

Las dependencias, estructura y reglas de negocio deberán
obtenerse desde:

* ESTRUCTURA_BD_PROPUESTA.md
* 03_MATRIZ_REFERENCIAL.md
* GENERACION_DATOS_GLOBAL.md

---

# DOCUMENTOS REQUERIDOS

Antes de generar cualquier tabla el agente deberá leer:

1. ESTRUCTURA_BD_PROPUESTA.md
2. 03_MATRIZ_REFERENCIAL.md
3. GENERACION_DATOS_GLOBAL.md
4. PLAN_CARGA_DATOS.md

---

# PRIORIDADES

| Valor | Significado |
| ----- | ----------- |
| 1     | Crítica     |
| 2     | Alta        |
| 3     | Media       |
| 4     | Baja        |

---

# ESTADOS

| Estado    | Significado            |
| --------- | ---------------------- |
| PENDIENTE | No iniciado            |
| GENERADO  | Datos generados        |
| VALIDADO  | Revisado               |
| CARGADO   | Ejecutado              |
| BLOQUEADO | Dependencias faltantes |

---

# FASE 0 - CATALOGOS Y PARAMETROS

Estas tablas deben existir antes que cualquier entidad
de negocio.

| Orden | Tabla    | Tipo    | Prioridad | Registros | Estado    |
| ----: | -------- | ------- | --------: | --------: | --------- |
|   001 | CNOFT    | MAESTRO |         1 |        10 | PENDIENTE |
|   002 | CNOFC    | MAESTRO |         1 |        25 | PENDIENTE |
|   003 | HOLYD    | MAESTRO |         1 |        50 | PENDIENTE |
|   004 | APCLS    | MAESTRO |         1 |        20 | PENDIENTE |
|   005 | RATES    | MAESTRO |         1 |        30 | PENDIENTE |
|   006 | CNTRLTAX | MAESTRO |         1 |        20 | PENDIENTE |
|   007 | CNTRLNUM | MAESTRO |         1 |        50 | PENDIENTE |
|   008 | CCDSC    | MAESTRO |         1 |        20 | PENDIENTE |

---

# FASE 1 - MAESTROS RAIZ

Tablas principales del modelo.

| Orden | Tabla | Tipo    | Prioridad | Registros | Estado    |
| ----: | ----- | ------- | --------: | --------: | --------- |
|   009 | GLMST | MAESTRO |         1 |       300 | PENDIENTE |
|   010 | CUMST | MAESTRO |         1 |       600 | PENDIENTE |

---

# FASE 2 - MAESTROS DEPENDIENTES

Información complementaria de clientes.

| Orden | Tabla | Tipo                | Prioridad | Registros | Estado    |
| ----: | ----- | ------------------- | --------: | --------: | --------- |
|   011 | CUMAD | MAESTRO DEPENDIENTE |         1 |      1200 | PENDIENTE |
|   012 | CUMSD | MAESTRO DEPENDIENTE |         1 |       600 | PENDIENTE |
|   013 | SPINS | MAESTRO DEPENDIENTE |         2 |       300 | PENDIENTE |

---

# FASE 3 - ENTIDADES DE NEGOCIO

Productos financieros principales.

| Orden | Tabla | Tipo      | Prioridad | Registros | Estado    |
| ----: | ----- | --------- | --------: | --------: | --------- |
|   014 | ACMST | OPERATIVA |         1 |      2000 | PENDIENTE |
|   015 | DEALS | OPERATIVA |         1 |       300 | PENDIENTE |
|   016 | ROCOL | OPERATIVA |         2 |       400 | PENDIENTE |
|   017 | LNECR | OPERATIVA |         2 |       300 | PENDIENTE |

---

# FASE 4 - DETALLES OPERATIVOS

Complementan las entidades de negocio.

| Orden | Tabla | Tipo    | Prioridad | Registros | Estado    |
| ----: | ----- | ------- | --------: | --------: | --------- |
|   018 | STPMT | DETALLE |         2 |       100 | PENDIENTE |
|   019 | CHMST | DETALLE |         2 |       500 | PENDIENTE |
|   020 | CHPER | DETALLE |         2 |      1000 | PENDIENTE |
|   021 | UNCOL | DETALLE |         2 |       100 | PENDIENTE |
|   022 | DLPMT | DETALLE |         1 |      5000 | PENDIENTE |
|   023 | DLDRF | DETALLE |         2 |      1000 | PENDIENTE |
|   024 | DLSDE | DETALLE |         2 |      5000 | PENDIENTE |
|   025 | DLITP | DETALLE |         2 |      1000 | PENDIENTE |
|   026 | DDCPN | DETALLE |         2 |      1000 | PENDIENTE |
|   027 | RCOLL | DETALLE |         2 |       600 | PENDIENTE |

---

# FASE 5 - OPERACION TRANSACCIONAL

Generan movimiento financiero.

| Orden | Tabla | Tipo          | Prioridad | Registros | Estado    |
| ----: | ----- | ------------- | --------: | --------: | --------- |
|   028 | TRANS | TRANSACCIONAL |         1 |    300000 | PENDIENTE |
|   029 | TTRAN | TRANSACCIONAL |         1 |     50000 | PENDIENTE |

---

# FASE 6 - CONTABILIDAD Y CONCILIACION

Generan impacto contable y permiten conciliación.

| Orden | Tabla | Tipo     | Prioridad | Registros | Estado    |
| ----: | ----- | -------- | --------: | --------: | --------- |
|   030 | INPUT | CONTABLE |         1 |     80000 | PENDIENTE |
|   031 | INPT2 | CONTABLE |         1 |     80000 | PENDIENTE |
|   032 | NXINP | CONTABLE |         1 |     80000 | PENDIENTE |
|   033 | GLBLN | CONTABLE |         1 |     10000 | PENDIENTE |

---

# REGLAS PARA EL AGENTE

Para generar una tabla:

1. Ubicar la tabla en este documento.
2. Obtener cantidad objetivo.
3. Consultar metadata.
4. Consultar dependencias.
5. Consultar reglas globales.
6. Verificar tablas padre.
7. Reutilizar datos previamente generados.
8. Generar datos consistentes.
9. Ejecutar validaciones.

---

# CRITERIOS DE VALIDACION

Antes de marcar una tabla como VALIDADA:

* PK válidas.
* FK válidas.
* UNIQUE válidos.
* Sin registros huérfanos.
* Cantidad esperada alcanzada.
* Reglas de negocio cumplidas.
* Consistencia temporal.
* Consistencia contable.

---

# OBJETIVO DE ESTA VERSION

Esta versión cubre exclusivamente las tablas críticas
necesarias para:

* Clientes.
* Cuentas.
* Créditos.
* Garantías.
* Transacciones.
* Contabilidad.
* Conciliación bancaria.
* Conciliación contable.

Las tablas restantes del modelo serán incorporadas en una
segunda etapa.
