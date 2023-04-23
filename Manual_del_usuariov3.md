## Manual del usuario: Simple Deterministic Finite Automaton (DFA) para validar expresiones aritméticas

Este programa escrito en el lenguaje de programación Racket se utiliza para validar expresiones aritméticas. En especifico, se encarga de identificar los diferentes tipos de tokens que se encuentran en una expresión, tales como números enteros, números decimales, variables, paréntesis y operadores. 

El programa implementa un Simple Deterministic Finite Automaton (DFA) que analiza cada carácter de la expresión y decide si pertenece a uno de los tipos de token definidos. Si la expresión es válida, el programa devolverá una lista con los tipos de token encontrados. Si la expresión no es válida, el programa no retornará nada.

A continuación, se detallan los requisitos y pasos para utilizar el programa.

## Requisitos para el funcionamiento del programa:

- Computadora con Racket v8.8 instalado.

## En caso de no contar con Racket instalado:
Descargar Racket desde la página oficial de Racket: https://racket-lang.org/.

## Pasos para el funcionamiento del programa:

1. Abrir Racket o su entorno de desarrollo preferido.
2. Copiar y pegar el código en el archivo.
3. Guardar el archivo por el nombre de su elección + .rkt.
4. Abrir una terminal.
5. Escribir la dirección de la ubicación donde guardó el archivo. Por ejemplo: cd Documents\Racket\
6. Teclear el siguiente comando: racket -it "nombre del archivo".rkt
7. Utilizar la función arithmetic-lexer y probar el programa.

Ejemplo:

(arithmetic-lexer "var=3*num-7.5/5")

En esta ocación, la lista resultante es '(var operator int operator var operator float operator int) 
lo que indica que la expresión contiene una variable, un operador, un número entero, otro operador, otra variable, un número decimal,
otro operador y un número entero.

## Datos importantes a considerar:

- El programa podría fallar si no se siguen las instrucciones o si se modifican partes del código.
- Programa realizado por: Domingo Mora Pérez, Ian Luis Vázquez Morán

Programa realizado por: 
- Domingo Mora Pérez
- Ian Luis Vázquez Morán