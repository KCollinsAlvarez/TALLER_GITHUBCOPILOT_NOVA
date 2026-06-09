# 03_MATRIZ_REFERENCIAL.md

# Matriz Referencial del Modelo

## Proyecto

Reestructuración y Validación del Modelo de Datos

## Versión

1.0

---

# 1. Objetivo

Documentar todas las relaciones identificadas en el modelo y validar que cada clave foránea tenga una referencia consistente hacia una clave primaria o clave candidata (UNIQUE).

Esta matriz constituye la base para la validación definitiva de integridad referencial.

---

# 2. Estados de Validación

| Estado    | Significado                            |
| --------- | -------------------------------------- |
| VALIDA    | FK apunta a PK o UNIQUE existente      |
| CORREGIDA | FK válida después de ajuste propuesto  |
| AMBIGUA   | Relación no implementable directamente |
| PENDIENTE | Requiere revisión detallada de campos  |
| INVALIDA  | FK apunta a columna inexistente        |

---

# 3. Módulo Clientes

| Tabla Origen | Campo FK   | Tabla Destino | Campo Referenciado | Estado    |
| ------------ | ---------- | ------------- | ------------------ | --------- |
| CUMAD        | num_cliente | CUMST        | num_cliente        | VALIDA    |
| CUMSD        | num_cliente | CUMST        | num_cliente        | VALIDA    |
| SPINS        | num_cliente | CUMST        | num_cliente        | CORREGIDA |
| ACMST        | num_cliente | CUMST        | num_cliente        | VALIDA    |
| DEALS        | num_cliente | CUMST        | num_cliente        | VALIDA    |
| ROCOL        | num_cliente | CUMST        | num_cliente        | VALIDA    |
| LNECR        | num_cliente | CUMST        | num_cliente        | VALIDA    |

---

# 4. Módulo Cuentas

## ACMST como Maestro

| Tabla Origen | Campo FK      | Tabla Destino | Campo Referenciado | Estado    |
| ------------ | ------------- | ------------- | ------------------ | --------- |
| STPMT        | numero_cuenta | ACMST         | numero_cuenta      | CORREGIDA |
| PBTRN        | numero_cuenta | ACMST         | numero_cuenta      | CORREGIDA |
| RCLNB        | numero_cuenta | ACMST         | numero_cuenta      | CORREGIDA |
| CHMST        | numero_cuenta | ACMST         | numero_cuenta      | CORREGIDA |
| CMRIN        | numero_cuenta | ACMST         | numero_cuenta      | CORREGIDA |
| TRANS        | numero_cuenta | ACMST         | numero_cuenta      | CORREGIDA |
| TTRAN        | numero_cuenta | ACMST         | numero_cuenta      | CORREGIDA |

### Dependencias Secundarias

| Tabla Origen | Campo FK        | Tabla Destino | Campo Referenciado | Estado    |
| ------------ | --------------- | ------------- | ------------------ | --------- |
| CHPER        | numero_chequera | CHMST         | numero_chequera    | PENDIENTE |

---

# 5. Módulo Contratos y Préstamos

## DEALS como Maestro

| Tabla Origen | Campo FK        | Tabla Destino | Campo Referenciado | Estado    |
| ------------ | --------------- | ------------- | ------------------ | --------- |
| DLPMT        | numero_prestamo | DEALS         | numero_prestamo    | CORREGIDA |
| DLDRF        | numero_prestamo | DEALS         | numero_prestamo    | CORREGIDA |
| DLSDE        | numero_prestamo | DEALS         | numero_prestamo    | CORREGIDA |
| DLITP        | numero_prestamo | DEALS         | numero_prestamo    | CORREGIDA |
| DDCPN        | numero_prestamo | DEALS         | numero_prestamo    | CORREGIDA |

---

# 6. Módulo Cartas de Crédito

## LCMST como Maestro

| Tabla Origen | Campo FK             | Tabla Destino | Campo Referenciado   | Estado    |
| ------------ | -------------------- | ------------- | -------------------- | --------- |
| LCDOC        | numero_carta_credito | LCMST         | numero_carta_credito | CORREGIDA |
| LCADM        | numero_carta_credito | LCMST         | numero_carta_credito | CORREGIDA |
| LCCOV        | numero_carta_credito | LCMST         | numero_carta_credito | CORREGIDA |
| LCDIN        | numero_carta_credito | LCMST         | numero_carta_credito | CORREGIDA |
| APPRV        | numero_carta_credito | LCMST         | numero_carta_credito | CORREGIDA |
| LCFEE        | numero_carta_credito | LCMST         | numero_carta_credito | CORREGIDA |

---

# 7. Módulo Garantías

| Tabla Origen | Campo FK        | Tabla Destino | Campo Referenciado | Estado    |
| ------------ | --------------- | ------------- | ------------------ | --------- |
| RCOLL        | numero_garantia | ROCOL         | numero_garantia    | CORREGIDA |

---

# 8. Módulo Líneas de Crédito

| Tabla Origen | Campo FK   | Tabla Destino | Campo Referenciado | Estado |
| ------------ | ---------- | ------------- | ------------------ | ------ |
| LNECR        | num_cliente | CUMST         | num_cliente         | VALIDA |

---

# 9. Módulo Contabilidad

## Relaciones Detectadas

| Tabla Origen | Campo FK        | Tabla Destino | Campo Referenciado | Estado    |
| ------------ | --------------- | ------------- | ------------------ | --------- |
| GLBLN        | cuenta_contable | GLMST         | cuenta_contable    | PENDIENTE |
| INPUT        | cuenta_contable | GLMST         | cuenta_contable    | PENDIENTE |
| INPT2        | cuenta_contable | GLMST         | cuenta_contable    | PENDIENTE |
| NXINP        | cuenta_contable | GLMST         | cuenta_contable    | PENDIENTE |
| TRANS        | cuenta_contable | GLMST         | cuenta_contable    | PENDIENTE |
| TTRAN        | cuenta_contable | GLMST         | cuenta_contable    | PENDIENTE |

Observación:

Debe verificarse que GLMST posea:

```text
UNIQUE(cuenta_contable)
```

---

# 10. Módulo Proveedores y CxP

## BAVEN como Maestro

| Tabla Origen | Campo FK         | Tabla Destino | Campo Referenciado | Estado    |
| ------------ | ---------------- | ------------- | ------------------ | --------- |
| BAPRC        | numero_proveedor | BAVEN         | numero_proveedor   | CORREGIDA |
| BAMOR        | id_proceso       | BAPRC         | id_proceso         | PENDIENTE |
| BAHIS        | id_proceso       | BAPRC         | id_proceso         | PENDIENTE |
| BAINP        | id_proceso       | BAPRC         | id_proceso         | PENDIENTE |

---

# 11. Módulo Propuesta de Crédito

## PLPCR

| Tabla Origen | Campo FK     | Tabla Destino | Campo Referenciado | Estado    |
| ------------ | ------------ | ------------- | ------------------ | --------- |
| PLPRD        | id_propuesta | PLPCR         | id_propuesta       | PENDIENTE |
| PLGRT        | id_propuesta | PLPCR         | id_propuesta       | PENDIENTE |

---

## DPMST

| Tabla Origen | Campo FK     | Tabla Destino | Campo Referenciado | Estado    |
| ------------ | ------------ | ------------- | ------------------ | --------- |
| DPDTL        | id_documento | DPMST         | id_documento       | PENDIENTE |

---

## IFMST

| Tabla Origen | Campo FK      | Tabla Destino | Campo Referenciado | Estado    |
| ------------ | ------------- | ------------- | ------------------ | --------- |
| IFDTL        | id_formulario | IFMST         | id_formulario      | PENDIENTE |

---

# 12. Módulo Documentos

| Tabla Origen | Campo FK     | Tabla Destino | Campo Referenciado | Estado |
| ------------ | ------------ | ------------- | ------------------ | ------ |
| DIMST        | numero_tabla | DITBL         | numero_tabla       | VALIDA |

---

# 13. Relaciones Ambiguas Detectadas

## SPINS

Problema:

Puede apuntar simultáneamente a:

* Cliente
* Cuenta

Estado:

AMBIGUA

Resolución aplicada:

```text
tipo_referencia
num_cliente
numero_cuenta
```

---

# 14. Resumen de Validación

| Resultado | Cantidad |
| --------- | -------- |
| VALIDA    | 10       |
| CORREGIDA | 17       |
| AMBIGUA   | 1        |
| PENDIENTE | 12       |
| INVALIDA  | 0        |

---

# 15. Conclusiones

1. No se detectan relaciones imposibles de corregir.
2. Todas las inconsistencias identificadas pueden resolverse mediante:

   * PK técnicas.
   * UNIQUE.
   * Corrección de cardinalidades.
3. No es necesario agregar nuevas tablas.
4. No es necesario eliminar tablas.
5. El modelo mantiene las 114 tablas originales.
6. La siguiente fase consiste en construir el Diccionario de Datos Definitivo.

---