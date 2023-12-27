# Práctica de Planificación con IA

## Guía Mental

Para abordar el problema de planificación con FF y Planificación, es necesario contar con dos archivos distintos: uno para el Dominio y otro para el Problema.

### Fichero del Dominio

En este archivo se definen:

1. **Predicados:** Descripciones de relaciones entre objetos, como "EsPredecesor" o "HaSidoLeido".
2. **Acciones:** Operadores que permiten cambiar el estado del sistema. Cada acción consta de una precondición y, si se cumple, se ejecuta la acción.

### Fichero del Problema

En este archivo se especifica:

1. **Objetos del Problema:** Por ejemplo, X libros, junto con sus respectivos predicados si los tienen.
2. **Estado Inicial:** Representa el estado inicial del problema, es decir, la situación inicial, donde ningún libro está presente.
3. **Estado Goal:** Describe el estado al que se desea llegar, como el orden de los libros, entre otros.

---


