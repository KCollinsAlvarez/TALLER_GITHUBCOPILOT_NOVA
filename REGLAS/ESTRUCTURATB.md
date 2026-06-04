# Generador Corporativo de Tablas DB2 for IBM i

## Estándar Operativo para Agentes Generadores de SQL

### Versión 3.0

---

# 1. Objetivo

Este documento define las reglas obligatorias que debe seguir un agente de IA encargado de generar estructuras de base de datos para DB2 for IBM i.

El objetivo es asegurar que toda tabla generada:

* Cumpla estándares IBM i.
* Sea completamente documentada.
* Sea mantenible.
* Sea trazable.
* Sea compatible con auditorías técnicas.
* Cumpla los criterios de revisión automática del taller.

---

# 2. Alcance

El agente está autorizado para generar únicamente:

* CREATE OR REPLACE TABLE
* PRIMARY KEY
* CONSTRAIN CHECK
* FOREIGN KEY
* UNIQUE
* CHECK
* CREATE INDEX
* LABEL ON TABLE
* COMMENT ON TABLE
* LABEL ON COLUMN
* LABEL ON COLUMN TEXT IS
* COMMENT ON COLUMN

---

# 3. Objetos Prohibidos

El agente NO debe generar:

* DDS
* PF
* LF
* CRTPF
* CRTLF
* Archivos físicos tradicionales
* Archivos lógicos tradicionales

Si un requerimiento solicita DDS, el agente debe indicar incumplimiento del estándar.

---

# 4. Flujo Obligatorio de Generación

Para cada tabla el agente deberá:

1. Analizar definición funcional.
2. Identificar columnas.
3. Identificar PK.
3. Identificar FK. 
4. Identificar CHECK.
5. Inferir documentación.
6. Generar SQL.
7. Generar metadata.
8. Generar comentarios.
9. Generar labels.
10. Ejecutar validaciones finales.

---

# 5. Encabezado Obligatorio de Metadata

Toda tabla deberá iniciar con un bloque de documentación.

Reglas:

* Ninguna línea del encabezado deberá superar la columna 80.
* El contenido descriptivo deberá mantenerse preferiblemente dentro
  de las primeras 74 columnas.
* Cuando una descripción exceda el espacio disponible deberá
  continuarse en la siguiente línea respetando la indentación.
* Mantener alineación uniforme para facilitar lectura en IBM i,
  RDi, ACS, SEU y revisiones de código.

Formato obligatorio:

```sql
--======================================================================
-- Nombre de la Tabla : [nombre corto] - [titulo largo]
--
-- DESCRIPCIÓN:
-- Descripción funcional de la tabla.
--
-- Objetivo:
-- Explicación breve del propósito de negocio.
--
-- Tipo de Tabla:
-- Maestro / Transaccional / Histórico / Configuración.
--
-- Origen de los Datos:
-- Sistema o proceso que genera la información.
--
-- Permanencia de Datos:
-- Temporal o Permanente.
--
-- Uso de los Datos:
-- Explicación funcional del consumo de información.
--
-- Restricciones:
-- Reglas relevantes de negocio o integridad.
--
-- Hecho por: K. Collins Alvarez Herrera
--
-- Fecha: [aplica la fecha de creacion o generado]
--
-- Proyecto: Taller GitHub Copilot NOVA
--======================================================================
```

---

# 6. Regla de Metadata Completa

No se permiten:

```text
N/A
PENDIENTE
XXXXX
TBD
VACÍO
```

Si la información puede inferirse, el agente deberá hacerlo.

Si no puede inferirse, deberá solicitarla.

---

# 7. Reglas de Nombres

## 7.1 Nombre Corto de Tabla

Reglas:

* Máximo 10 caracteres.
* Obligatorio.
* Compatible con IBM i.

Ejemplos:

```text
CLTMST
DEALS
ACMST
GLBLN
```

---

### 7.2 Nombre Largo de Campo

Reglas:

* Máximo 20 caracteres.
* Obligatorio.
* Descriptivo.
* Debe representar claramente el propósito funcional del campo.
* Se permite el uso de guiones bajos (`_`) para mejorar la legibilidad.
* Debe mantener consistencia semántica con el negocio.
* Evitar términos ambiguos o genéricos; preferir nombres descriptivos como
  `NUMERO_OPCION` en lugar de `OPCION`.

Ejemplos:

```text
CODIGO_CLIENTE
SALDO_ACTUAL
FECHA_PROCESO
NUMERO_OPCION
```
---

# 7.3 Nombre Corto de Campo

Reglas:

* Longitud mínima: 6 caracteres.
* Longitud máxima: 10 caracteres.
* Obligatorio.
* Utilizado mediante FOR COLUMN.
* Debe derivarse mediante abreviaciones significativas de las palabras que conforman el nombre largo.
*POR EJEMPLO: COD = CODIGO , CLI = CLIENTE. Las abreviaciones se conforman con 3 letras de cada palabra pero estas no deben suplantar la abreviacion de otra que ya se le asigno.

Ejemplos:

```text
CODIGO_CLIENTE => CODCLI
SALARIOACTUAL  => SALACT
FECHA_PROCESO => FECPROC
NUMERO_OPCION => NUMOPC
```

---

# 8. Reglas de Columnas

Toda columna debe definirse utilizando:

```sql
NOMBRE_LARGO FOR COLUMN NOMCORTO
```
*Deben tener DEFAULT menos aquellas que son parte de la
primary key.

Ejemplo:

```sql
CODIGO_CLIENTE FOR COLUMN CODCLI CHAR(10)
                          NOT NULL
```

---

# 9. Tipos de Datos Permitidos

## Caracteres

```sql
CHAR(n)U
VARCHAR(n)
```

## Numéricos

```sql
SMALLINT
INTEGER
BIGINT
DECIMAL(p, s)
```

## Fechas

```sql
DATE
TIME
TIMESTAMP
```

---

# 10. Reglas de PK

Toda tabla debe tener PRIMARY KEY.

Formato:

```text
<TABLA>_PK
```

Ejemplo:

```sql
CONSTRAINT DEALS_PK PRIMARY KEY (ID_DEAL)
```

---

# 11. Reglas de FK

Regla:
Si la tabla padre cuanta con una PK compuesta
debes crear las FK hija con la misma composicion
aun cuando la metadata de la tabla hija no se indique.

Formato:

```text
<TABLA_HIJA>_<TABLA_PADRE>_FK
```

Ejemplo:

```sql
CONSTRAINT DEALS_CLIENTE_FK FOREIGN KEY (CODIGO_CLIENTE)
REFERENCES CLIENTE (CODIGO_CLIENTE)
```

---

# 12. Reglas de Constraints

Agregar antes de la subsección CHECK:

### Regla General para CHECK Constraints

* Ningún CHECK CONSTRAINT debe declararse dentro de la definición de una columna.
* Todos los CHECK CONSTRAINTS deben declararse como restricciones independientes a nivel de tabla.
* Deben ubicarse después de la definición de columnas y después de las restricciones PRIMARY KEY y FOREIGN KEY, manteniendo una estructura ordenada y consistente.

Ejemplo:

```sql
CREATE OR REPLACE TABLE CLIENTE (
    ESTADO FOR COLUMN ESTCLI CHAR(1) NOT NULL,
    --OTROS CAMPOS
    --PRIMARY KEY
    --FORENKING
    CONSTRAINT CLIENTE_ESTCLI_CST CHECK (ESTCLI IN ('A','I'))
) RCDFMT RCLIENTE;


```


## UNIQUE

Formato:

```text
<TABLA>_<CAMPO>_UK
```

---

# 13. Reglas de Índices


## Evaluación Obligatoria de Índices

La generación de índices no es obligatoria.

Antes de crear un índice el agente deberá evaluar si existe un beneficio funcional o de rendimiento justificado.

No se deben generar índices por defecto.

Solamente deberán generarse índices cuando:

* Existan búsquedas frecuentes sobre la columna.
* La columna participe en JOINs relevantes.
* Existan filtros recurrentes identificados en los requerimientos.
* El volumen de datos justifique optimización de acceso.
* Se demuestre un beneficio operativo o técnico.

Si no se identifica un beneficio claro, el índice deberá omitirse.

Puede considerarse la creación de índices para:

* PK compuestas.
* FK.
* JOIN frecuentes.
* Campos de búsqueda.

Formato:

```text
<TABLA>01
<TABLA>02
<TABLA>03
```

Ejemplo:

```sql
CREATE INDEX DEALS01 ON DEALS (CODIGO_CLIENTE);
```

---

# 14. Campos de Auditoría

Cuando la tabla sea transaccional:

Regla:
* si se encuentra dentro de los datos obtenidos,
  usar los campos de auditoría estándar en español para mantener coherencia.
  por ejemplo: CREATED_AT,UPDATED_AT,USUARIO_CREACION, USUARIO_ACTUALIZACION.
  cambialos por los que estan abajo.
  y tamano de 18 para los user

```sql
USUARIO_INGRESO FOR COLUMN USRING CHAR(18)
                    NOT NULL DEFAULT USER,

FECHA_INGRESO FOR COLUMN FECING TIMESTAMP 
                    NOT NULL WITH DEFAULT,

USUARIO_ACTUALIZA FOR COLUMN USRACT CHAR(18) 
                      NOT NULL DEFAULT USER,

FECHA_ACTUALIZA FOR COLUMN FECACT TIMESTAMP
                    NOT NULL WITH DEFAULT
```

---

# 15. CREATE TABLE Obligatorio

El agente debe utilizar:

```sql
CREATE OR REPLACE TABLE
```

Nunca:

```sql
CREATE TABLE
```

---

# 16. RCDFMT Obligatorio

Toda tabla debe definir:

```sql
RCDFMT R<NOMBRE_CORTO>
```

Ejemplo:

```sql
RCDFMT RDEALS
```

---

# 17. Alias de Sistema Obligatorio

Reglas:

El nombre largo o título descriptivo de la tabla deberá:
* Representar claramente la información almacenada.
* Tener una longitud máxima de 20 caracteres.
* Poder utilizar guiones bajos (`_`) para mejorar la legibilidad.
* Evitar nombres genéricos, ambiguos o poco descriptivos.
* Facilitar la comprensión funcional del objeto.
* Mantener consistencia con el propósito de negocio de la tabla.

```sql
RENAME TABLE DEALS
TO <NOMBRE DEL TITULO LARGO>
FOR SYSTEM NAME DEALS;
```

o la sintaxis equivalente definida por el estándar del proyecto.

---

# 18. Documentación Obligatoria

### Regla General de Formato

Toda documentación generada por el agente deberá cumplir:

* Ninguna línea de texto podrá superar la columna 80.
* El contenido deberá mantenerse preferiblemente dentro de las
  primeras 74 columnas.

  * Metadata de tablas.
  * COMMENT ON TABLE.
  * COMMENT ON COLUMN.
  * LABEL TEXT IS.
  * Documentación auxiliar generada por el agente.

## COMMENT ON COLUMN

Obligatorio para todas las columnas.

Debe contener la descripción funcional completa y detallada del campo.

El COMMENT ON TABLE debe asignarle el titulo del punto 17

Los comentarios deben referirse a la columna por su nombre corto definido con FOR COLUMN.

Si la columna tiene un CHECK definido, el comentario debe incluir los valores válidos
y su significado funcional.

Se debe usar una cabecera de sección clara en el script para separar los bloques
COMMENT ON TABLE y COMMENT ON COLUMN, mejorando la legibilidad.

---

## LABEL ON COLUMN

Obligatorio para todas las columnas.

Debe contener una descripción breve y resumida del campo.

El LABEL ON TABLE debe asignarle el titulo del punto 17

---

## LABEL ON COLUMN TEXT IS

Obligatorio para todas las columnas.

Debe contener una descripción breve y resumida del campo.

---

# 19. Regla de Cobertura Total

El agente debe validar:

```text
Cantidad de Columnas
=
Cantidad de COMMENT ON COLUMN
=
Cantidad de LABEL ON COLUMN
=
Cantidad de LABEL TEXT IS
```

Si no coincide:

```text
ERROR
```

---

# 20. Reglas de Inferencia

El agente debe utilizar la descripción funcional recibida para generar:

* Labels.
* Comments.
* Objetivo.
* Tipo de tabla.
* Uso de datos.
* Restricciones.

Cuando el agente genere nombres largos y cortos de columnas deberá:

* Priorizar nombres descriptivos.
* Mantener coherencia funcional con la definición del negocio.
* Generar abreviaciones significativas para los nombres cortos.
* Garantizar que exista una relación evidente entre nombre largo y nombre corto.
* Respetar las restricciones de longitud definidas en las secciones 7.2 y 7.3.

No debe solicitar información ya disponible en la definición funcional.

---

# 21. Orden Obligatorio de Generación

1. Encabezado.
2. CREATE OR REPLACE TABLE.
3. Columnas.
4. PK.
5. FK. (En caso de que aplicar)
6. CHECK. (En caso de aplicar)
7. RCDFMT.
8. RENAME TABLE.
9. COMMENT ON TABLE.
10. LABEL ON TABLE.
11. COMMENT ON COLUMN.
12. LABEL ON COLUMN.
13. LABEL ON COLUMN TEXT IS.
14. Índices. (En caso de aplicar)

---

# 22. Validaciones Obligatorias Previas a la Entrega

El agente debe verificar:

* Existe metadata completa.
* Existe CREATE OR REPLACE TABLE.
* Existe FOR COLUMN.
* Existe PRIMARY KEY.
* Existe FOREIGN KEY. (En caso de aplicar)
* Existe CHECK. (En caso de aplicar)
* Existe RCDFMT.
* Existe COMMENT ON TABLE.
* Existe LABEL ON TABLE.
* Existe COMMENT ON COLUMN.
* Existe LABEL ON COLUMN.
* Existe LABEL TEXT IS.
* No existen PF.
* No existen LF.
* No existen DDS.
* Todos los nombres largos ≤ 20 caracteres.
* Todos los nombres cortos ≤ 10 caracteres.

---

# 23. Criterios de Rechazo

La generación debe marcar FAIL cuando:

* Falta metadata.
* Falta PK.
* Falta de FK. (En caso de aplicar)
* Falta de CHECK. (En caso de aplicar)
* Falta RCDFMT.
* Falta documentación.
* Falta cobertura total de comentarios.
* Existen nombres fuera del estándar.
* Se utilizan PF o LF.

---

# 24. Salida Esperada del Agente

La respuesta final deberá contener:

* Encabezado completo.
* SQL ejecutable.
* PK.
* FK. (En caso de aplicar)
* CHECK. (En caso de aplicar)
* Índices. (En caso de aplicar)
* Metadata.
* Comentarios.
* Labels.
* Validación final PASS.

No debe incluir explicaciones, análisis ni texto adicional fuera del resultado solicitado.
