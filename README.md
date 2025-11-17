# Calculadora Multifuncional en PSeInt

**Proyecto de la optativa de Programación Estructurada**
**Autor(es):** [Tu Nombre / Nombres del Equipo]
**Fecha:** 16 de noviembre de 2025

---

## 1. Descripcion del proyecto

Este proyecto es una Calculadora Multifuncional desarrollada en PSeInt. El objetivo principal no es solo crear una herramienta funcional, sino también demostrar un código limpio, fácil de entender, que sea modular y, sobre todo, una documentación profesional.

La calculadora incluye cuatro módulos principales:

1.  Operaciones Básicas: Suma, resta, multiplicación y división, con validación de división por cero.
2.  Geometría:
    * Cálculo de Área, Diámetro y Radio para un Círculo (permitiendo al usuario ingresar cualquiera de los tres datos).
    * Cálculo de Área para Cuadrado, Triángulo y Trapecio.
3.  Estadística Básica: Permite al usuario ingresar una serie de números y calcula la Media, Mediana y Moda.
4.  Sucesión de Fibonacci: Solicita un número inicial y una cantidad de términos, y muestra los números de la sucesión *real* de Fibonacci que cumplan esos criterios(Solo aplica en numeros de la secuencia).

---

## 2. Cómo lo hicimos (Arquitectura y Lógica)

### Arquitectura General

El código está estructurado de forma modular utilizando "SubProceso" (funciones) de PSeInt.

* Proceso CalculadoraMultifuncional (Principal): Contiene el menú principal que se ejecuta en un bucle Repetir-Hasta Que. Utiliza una estructura Segun (switch) para navegar entre los diferentes módulos.
* SubProceso OperacionesBasicas(): Módulo aislado para las cuatro operaciones aritméticas.
* SubProceso Geometria(): Contiene su propio submenú para las diferentes figuras geométricas.
* SubProceso EstadisticaBasica(): Módulo para cálculos estadísticos.
* SubProceso Fibonacci(): Módulo para la generación de la sucesión.

Esta arquitectura modular permite que cada parte del código sea independiente, fácil de probar y fácil de documentar.

### Lógica Destacada por Módulo

#### Geometría (Círculo)
Para cumplir el requisito de "calcular área, diámetro y radio", se implementó un submenú que pregunta al usuario qué dato posee (radio, diámetro o área). Basado en su respuesta, el programa calcula los otros dos utilizando las fórmulas de despeje correspondientes.

#### Estadística (Media, Mediana y Moda)
* Media: Se calcula sumando todos los números de un arreglo y dividiendo por la cantidad de elementos.
* Mediana:
    1.  Se implementó un algoritmo de ordenamiento Burbuja (Bubble Sort), ya que PSeInt no posee una función `sort()` nativa.
    2.  Una vez ordenado el arreglo, se comprueba si `n` es par o impar para encontrar el valor central.
* Moda:
    1.  Aprovechando que el arreglo ya está ordenado, se recorre una sola vez.
    2.  Se utilizan variables (`conteo_actual`, `conteo_maximo`) para contar las apariciones de números consecutivos.

#### Sucesión de Fibonacci
La lógica clave fue respetar el requisito de generar la sucesión real (0, 1, 1, 2, 3...).
1.  El programa genera la sucesión desde sus semillas (a=0, b=1) internamente.
2.  El "número inicial" ingresado por el usuario se usa como un filtro de impresión.
3.  El bucle `Mientras` genera la sucesión y solo muestra el número en pantalla si es mayor o igual al "número inicial".

---

## 3. Para qué lo hicimos (Propósito)

El propósito de este proyecto fue aplicar los fundamentos de la programación estructurada y las buenas prácticas de desarrollo de software.

* Propósito General: Demostrar la capacidad de escribir código legible, mantenible y transferible.
* Propósito de los Módulos:
    * Básicas / Geometría: Aplicar fórmulas matemáticas y estructurar menús.
    * Estadística: Implementar algoritmos fundamentales (ordenamiento, análisis de frecuencia).
    * Fibonacci: Demostrar el manejo de bucles y la correcta interpretación de requisitos.

---

## 4. Dificultades Encontradas y Soluciones

1.  Dificultad: PSeInt no tiene una función nativa para ordenar arreglos (`sort()`).
    * Solución: Se implementó un algoritmo de ordenamiento Burbuja/Bubble Sort . //Lo vimos con el sapo

2.  Dificultad: La lógica para calcular la Moda (el valor más frecuente).
    * Solución: Se resolvió aprovechando el ordenamiento previo. Al recorrer el arreglo ordenado, solo necesitamos contar elementos idénticos consecutivos.

3.  Dificultad: Interpretar el requisito de "número inicial" de Fibonacci.
    * Solución: Se determinó que el requisito pedía filtrar la sucesión *real*. La solución genera la secuencia correcta y solo imprime los términos que son mayores o iguales al "número inicial".

4.  Dificultad: Evitar que la calculadora "se rompa" (manejo de errores).
    * Solución: Se implementaron validaciones en puntos clave:
        * División por cero.
        * Entradas de menú inválidas (con bucles `Repetir-Hasta Que`).
        * Valores numéricos inválidos (ej. cantidad de términos <= 0).
