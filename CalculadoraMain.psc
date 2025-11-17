Proceso CalculadoraMultifuncional
    Definir opcion Como Entero
    
    Repetir
        // Menú principal
        Escribir "--- CALCULADORA MULTIFUNCIONAL ---"
        Escribir "Seleccione una opción:"
        Escribir "1. Operaciones Básicas"
        Escribir "2. Geometría"
        Escribir "3. Estadística Básica"
        Escribir "4. Sucesión de Fibonacci"
        Escribir "5. Salir"
        Leer opcion
        
        // Limpiar pantalla para mejor legibilidad
        LimpiarPantalla
        
        Segun opcion Hacer
            1:
                // Módulo de Operaciones Básicas
                OperacionesBasicas()
            2:
                // Módulo de Geometría
                Geometria()
            3:
                // Módulo de Estadística
                EstadisticaBasica()
            4:
                // Módulo de Fibonacci
                Fibonacci()
            5:
                Escribir "HASTA LUEGO"
            De Otro Modo:
                Escribir "Opción no válida. Intente de nuevo."
        FinSegun
        
        // Pausa para que el usuario pueda leer el resultado antes de volver al menú
        Si opcion <> 5 Entonces
            Escribir "Presione Enter para continuar..."
            Esperar Tecla
            LimpiarPantalla
        FinSi
        
    Hasta Que opcion = 5
FinProceso

//  1 OPERACIONES BÁSICAS 
SubProceso OperacionesBasicas
    Definir num1, num2, resultado Como Real
    Definir operador Como Caracter
    
    Escribir "---|| OPERACIONES BÁSICAS|| ---"
    Escribir "Ingrese el primer número:"
    Leer num1
    Escribir "Ingrese el segundo número:"
    Leer num2
    
    Repetir
        Escribir "Ingrese la operación (+, -, *, /):"
        Leer operador
        Si operador <> "+" Y operador <> "-" Y operador <> "*" Y operador <> "/" Entonces
            Escribir "Operador no válido."
        FinSi
    Hasta Que operador = "+" O operador = "-" O operador = "*" O operador = "/"
    
    Segun operador Hacer
        "+":
            resultado <- num1 + num2
        "-":
            resultado <- num1 - num2
        "*":
            resultado <- num1 * num2
        "/":
            // Validación de división por cero
            Si num2 = 0 Entonces
                Escribir "Error: No se puede dividir por cero."
                resultado <- 0 // O un valor de error
            Sino
                resultado <- num1 / num2
            FinSi
    FinSegun
    
    // Solo muestra el resultado si la operación fue válida
    Si operador <> "/" O (operador = "/" Y num2 <> 0) Entonces
        Escribir "El resultado es: ", resultado
    FinSi
FinSubProceso

//  2 GEOMETRÍA 
SubProceso Geometria
    Definir opcion_geo Como Entero
    
    Repetir
        Escribir "--- ||GEOMETRÍA|| ---"
        Escribir "1. Círculo (Área, Diámetro y Radio)"
        Escribir "2. Cuadrado (Área)"
        Escribir "3. Triángulo (Área)"
        Escribir "4. Trapecio (Área)"
        Escribir "5. Volver al menú principal"
        Leer opcion_geo
        
        LimpiarPantalla
        
        Segun opcion_geo Hacer
            1: // Círculo
                Definir radio, diametro, area, valor_dado Como Real
                Definir opcion_circulo Como Entero
                
                Escribir "||CÁLCULO DE CÍRCULO||"
                Escribir "¿Qué dato posee?"
                Escribir "1. Radio"
                Escribir "2. Diámetro"
                Escribir "3. Área"
                Leer opcion_circulo
                
                Segun opcion_circulo Hacer
                    1: // Dio el Radio
                        Escribir "Ingrese el radio:"
                        Leer radio
                        diametro <- radio * 2
                        area <- PI * (radio^2)
                    2: // Dio el Diámetro
                        Escribir "Ingrese el diámetro:"
                        Leer diametro
                        radio <- diametro / 2
                        area <- PI * (radio^2)
                    3: // Dio el Área
                        Escribir "Ingrese el área:"
                        Leer area
                        radio <- raiz(area / PI)
                        diametro <- radio * 2
                    De Otro Modo:
                        Escribir "Opción no válida."
                FinSegun
                
                Si opcion_circulo >= 1 Y opcion_circulo <= 3 Entonces
                    Escribir "Resultados:"
                    Escribir "Radio: ", radio
                    Escribir "Diámetro: ", diametro
                    Escribir "Área: ", area
                FinSi
                
            2: // Cuadrado
                Definir lado, area_cuadrado Como Real
                Escribir "||ÁREA DE CUADRADO||"
                Escribir "Ingrese la longitud del lado:"
                Leer lado
                area_cuadrado <- lado * lado
                Escribir "El área del cuadrado es: ", area_cuadrado
                
            3: // Triángulo
                Definir base, altura, area_triangulo Como Real
                Escribir "||ÁREA DE TRIÁNGULO||"
                Escribir "Ingrese la base:"
                Leer base
                Escribir "Ingrese la altura:"
                Leer altura
                area_triangulo <- (base * altura) / 2
                Escribir "El área del triángulo es: ", area_triangulo
                
            4: // Trapecio
                Definir base_mayor, base_menor, altura_trap, area_trapecio Como Real
                Escribir "||ÁREA DE TRAPECIO||"
                Escribir "Ingrese la base mayor (B):"
                Leer base_mayor
                Escribir "Ingrese la base menor (b):"
                Leer base_menor
                Escribir "Ingrese la altura (h):"
                Leer altura_trap
                area_trapecio <- ((base_mayor + base_menor) * altura_trap) / 2
                Escribir "El área del trapecio es: ", area_trapecio
				
            5:
                Escribir "Volviendo al menú principal..."
            De Otro Modo:
                Escribir "Opción no válida."
        FinSegun
        
        Si opcion_geo <> 5 Entonces
            Escribir "Presione Enter para continuar..."
            Esperar Tecla
            LimpiarPantalla
        FinSi
        
    Hasta Que opcion_geo = 5
FinSubProceso

// 3 ESTADÍSTICA BÁSICA
SubProceso EstadisticaBasica
    Definir n, i Como Entero
    Definir suma, media, mediana Como Real
    
    Escribir "--- ||ESTADÍSTICA BÁSICA|| ---"
    Repetir
        Escribir "¿Cuántos números desea ingresar? (Debe ser al menos 1)"
        Leer n
        Si n <= 0 Entonces
            Escribir "Error: debe ingresar al menos 1 número."
        FinSi
    Hasta Que n > 0
    
    // Declarar el arreglo después de saber su tamaño
    Dimension numeros[n]
    
    // Leer los números
    Escribir "Ingrese los ", n, " números:"
    suma <- 0
    Para i <- 0 Hasta n-1 Hacer
        Leer numeros[i]
        suma <- suma + numeros[i]
    FinPara
    
    //  CÁLCULO DE MEDIA 
    media <- suma / n
    Escribir "1. Media (Promedio): ", media
    
    // - CÁLCULO DE MEDIANA -
    // PSeInt no tiene un "sort" nativo, implementamos un Ordenamiento Burbuja
    Para i <- 0 Hasta n-2 Hacer
        Para j <- 0 Hasta n-2-i Hacer
            Si numeros[j] > numeros[j+1] Entonces
                Definir aux Como Real
                aux <- numeros[j]
                numeros[j] <- numeros[j+1]
                numeros[j+1] <- aux
            FinSi
        FinPara
    FinPara
    
    // Escribir "Arreglo ordenado:"
    // Para i<-0 Hasta n-1 Hacer
    //    Escribir Sin Saltar numeros[i], ", "
    // FinPara
    // Escribir ""
    
    Si n % 2 = 0 Entonces // N es par
        mediana <- (numeros[(n/2)-1] + numeros[n/2]) / 2
    Sino // N es impar
        mediana <- numeros[Trunc(n/2)]
    FinSi
    Escribir "2. Mediana: ", mediana
    
    // --- CÁLCULO DE MODA ---
    // Se asume que el arreglo ya está ordenado
    Definir conteo_actual, conteo_maximo Como Entero
    Definir moda Como Real
    
    conteo_maximo <- 0
    conteo_actual <- 1
    moda <- numeros[0]
    
    Para i <- 1 Hasta n-1 Hacer
        Si numeros[i] = numeros[i-1] Entonces
            conteo_actual <- conteo_actual + 1
        Sino
            // Se encontró un número diferente, comparar conteos
            Si conteo_actual > conteo_maximo Entonces
                conteo_maximo <- conteo_actual
                moda <- numeros[i-1]
            FinSi
            conteo_actual <- 1 // Reiniciar conteo para el nuevo número
        FinSi
    FinPara
    
    // Comprobación final para el último grupo de números
    Si conteo_actual > conteo_maximo Entonces
        conteo_maximo <- conteo_actual
        moda <- numeros[n-1]
    FinSi
    
    Escribir "3. Moda: ", moda, " (apareció ", conteo_maximo, " veces)"
    
FinSubProceso

// 4: SUCESIÓN DE FIBONACCI 
SubProceso Fibonacci
    Definir num_inicial, cant_terminos, terminos_impresos Como Entero
    Definir a, b, siguiente Como Entero
    
    Escribir "--- ||SUCESIÓN DE FIBONACCI|| ---"
    Escribir "La sucesión real de Fibonacci es: 0, 1, 1, 2, 3, 5, 8, 13..."
    Escribir "Se generarán números de esta sucesión."
    
    Repetir
        Escribir "Ingrese el número inicial (desde dónde empezar a mostrar):"
        Leer num_inicial
        Si num_inicial < 0 Entonces
            Escribir "El número debe ser 0 o positivo."
        FinSi
    Hasta Que num_inicial >= 0
    
    Repetir
        Escribir "¿Cuántos términos desea generar (mostrar)?"
        Leer cant_terminos
        Si cant_terminos <= 0 Entonces
            Escribir "Debe generar al menos 1 término."
        FinSi
    Hasta Que cant_terminos > 0
    
    // Lógica para generar la sucesión REAL
    a <- 0
    b <- 1
    siguiente <- 0
    terminos_impresos <- 0
    
    Escribir "Generando ", cant_terminos, " términos de la sucesión de Fibonacci a partir de ", num_inicial, ":"
    
    // Bucle para generar la sucesión
    Mientras terminos_impresos < cant_terminos Hacer
        
        // Comprobar si el término actual debe imprimirse
        Si siguiente >= num_inicial Entonces
            Escribir "Término ", terminos_impresos + 1, ": ", siguiente
            terminos_impresos <- terminos_impresos + 1
        FinSi
        
        // Casos especiales de inicio (0 y 1)
        Si siguiente = 0 Entonces
            siguiente <- 1
        Sino
            // Generar el siguiente término
            a <- b
            b <- siguiente
            siguiente <- a + b
        FinSi
        
        // Control de bucle infinito (si el num_inicial es muy grande y no se encuentra)
        // Esto es un seguro, pero con números enteros grandes podría ser un problema.
        Si siguiente > num_inicial * 1000000 Y terminos_impresos = 0 Y num_inicial > 1 Entonces
            Escribir "El número inicial es muy grande y no se encontraron términos cercanos."
            terminos_impresos <- cant_terminos // Forzar salida
        FinSi
    FinMientras
    
FinSubProceso