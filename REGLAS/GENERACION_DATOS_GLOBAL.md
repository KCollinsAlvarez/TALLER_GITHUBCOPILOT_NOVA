# GENERACION_DATOS_GLOBAL.md

## PROPÓSITO

Definir las reglas generales para la generación de datos de
prueba del proyecto.

Este documento será utilizado por agentes de IA para
construir scripts SQL compatibles con IBM i (AS400) y DB2
for i.

Las reglas aquí definidas son obligatorias para todas las
tablas del modelo de datos.

---

# ENCABEZADO OBLIGATORIO

Todo script SQL deberá iniciar exactamente con la
siguiente estructura:

```sql
---------------------------------------------------------------------
-- TITULO...............:  Plan de Montaje del [MODULO]
--
-- DESCRIPCION..........: Carga de datos de la tabla [NOMBRE_TABLA]
--
-- PROYECTO.............: Taller GitHub Copilot NOVA
--
-- FECHA................: [FECHA_GENERACION]
--
-- HECHO POR............: K. Collins Alvarez Herrera
---------------------------------------------------------------------
```

Donde:

* [MODULO] = módulo funcional de la tabla.
* [NOMBRE_TABLA] = nombre físico de la tabla.
* [FECHA_GENERACION] = fecha actual.

No modificar el formato.

No agregar líneas adicionales dentro del encabezado.

---

# COMPATIBILIDAD

Todo script deberá ser compatible con:

* IBM i
* DB2 for i
* RUNSQLSTM
* ACS Run SQL Scripts
* VS Code - Code for IBM i
* RDi

---

# RESTRICCION DE LONGITUD

Ninguna línea podrá superar la columna 75.

Aplica para:

* Comentarios.
* SQL.
* Encabezados.
* Documentación.
* Inserts.

Si una sentencia excede la longitud permitida deberá
partirse en múltiples líneas.

---

# FORMATO DE ARCHIVO

Nombre sugerido:

```text
NNN_NOMBRETABLA.sql
```

Ejemplos:

```text
001_CNTRLCNT.sql
002_CNTRLBRN.sql
003_APCLS.sql
004_CUMST.sql
```

El prefijo numérico representa el orden de carga.

---

# REGLAS DE INTEGRIDAD

Los datos generados deberán respetar:

* PRIMARY KEY.
* FOREIGN KEY.
* UNIQUE.
* NOT NULL.
* CHECK.
* Cardinalidades.
* Reglas de negocio.

No generar registros inválidos.

---

# REGLAS DE CLAVES

## PRIMARY KEY

Debe ser única.

No se permiten duplicados.

---

## FOREIGN KEY

Toda FK deberá existir previamente en la tabla padre.

Nunca generar referencias huérfanas.

---

## UNIQUE

Debe mantenerse la unicidad durante toda la carga.

---

# ORDEN DE GENERACION

Seguir siempre el siguiente criterio:

1. Catálogos.
2. Tablas maestras.
3. Tablas operativas.
4. Tablas detalle.
5. Tablas transaccionales.
6. Históricos.
7. Auditoría.

Si una tabla depende de otra aún no generada:

NO generar datos.

Reportar la dependencia faltante.

---

# REUTILIZACION DE DATOS PREVIOS

La generación de datos deberá reutilizar los registros
existentes de las tablas previamente cargadas.

No generar nuevos registros para resolver dependencias.

Utilizar exclusivamente claves válidas obtenidas de las
tablas padre.

Ejemplo:

ACMST depende de:

- CUMST
- APCLS
- CNTRLBRN

Los valores de:

- Cliente
- Producto
- Sucursal

deberán ser seleccionados de los registros ya generados
para dichas tablas.

---

# REGLAS DE DATOS

Los datos deben ser realistas.

Evitar:

* TEST
* PRUEBA
* XXXXX
* ABC
* 999999

Utilizar:

* Nombres reales.
* Apellidos reales.
* Empresas válidas.
* Direcciones válidas.
* Correos válidos.
* Teléfonos válidos.

---

# REGLAS DE FECHAS

Utilizar fechas coherentes.

Ejemplos:

* Apertura <= Actual.
* Vencimiento >= Apertura.
* Pago >= Apertura.

No generar fechas imposibles.

---

# REGLAS DE MONTOS

Los montos deberán ser consistentes.

Ejemplos:

* Saldo >= 0.
* Crédito válido.
* Débito válido.
* Interés válido.

Evitar números aleatorios sin lógica.

---

# DISTRIBUCION DE DATOS

Cuando el requerimiento indique porcentajes, estos deberán
respetarse.

Ejemplo:

Estado:

* ACTIVO = 80%
* INACTIVO = 15%
* BLOQUEADO = 5%

La distribución final deberá aproximarse a dichos valores.

---

# CASOS DE PRUEBA

Siempre incluir:

## Casos normales

80%

## Casos límite

15%

Ejemplos:

* Valor mínimo.
* Valor máximo.
* Fecha mínima.
* Fecha máxima.

## Casos excepcionales controlados

5%

Ejemplos:

* Inactivo.
* Suspendido.
* Bloqueado.
* Reversado.

---

# TABLAS CONTABLES

Para tablas contables:

* GLMST
* GLBLN
* INPUT
* INPT2
* NXINP

Aplicar:

* Cuadre contable.
* Integridad contable.
* Consistencia de saldos.

---

# CONCILIACION

Cuando corresponda:

* Débitos = Créditos.
* Totales cuadran.
* Saldos consistentes.
* Referencias válidas.
* Trazabilidad completa.

---

# GENERACION DE INSERT

Utilizar únicamente:

```sql
INSERT INTO TABLA
(CAMPO1,CAMPO2)
VALUES
(VALOR1,VALOR2);
```

No utilizar INSERT multirregistro.

No utilizar MERGE.

No utilizar procedimientos almacenados.

No utilizar bloques dinámicos.

---

# MANEJO DE NULL

Cuando un campo permita NULL:

Utilizar NULL únicamente cuando tenga sentido de negocio.

No poblar indiscriminadamente con NULL.

---

# COMMIT

Asumir:

```sql
COMMIT(*NONE)
```

Salvo indicación contraria.

---

# VALIDACIONES OBLIGATORIAS

Antes de entregar validar:

* PK.
* FK.
* UNIQUE.
* NOT NULL.
* Fechas.
* Montos.
* Cardinalidades.
* Reglas de negocio.

---

# FORMATO DE RESPUESTA DEL AGENTE

El resultado deberá contener:

## 1. Resumen

* Tabla.
* Cantidad de registros.
* Dependencias utilizadas.

## 2. Validaciones

* PK OK.
* FK OK.
* UNIQUE OK.

## 3. Script SQL

Listo para ejecutar.

## 4. Observaciones

Supuestos realizados.

Restricciones identificadas.

---

# PRINCIPIO GENERAL

La prioridad es generar datos consistentes y utilizables
para pruebas funcionales, integración, migración,
conciliación bancaria y conciliación contable.

Nunca sacrificar consistencia por volumen.
Nunca generar registros huérfanos.
Nunca ignorar restricciones del modelo.
