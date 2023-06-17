def sumar_elementos(lista):
    suma = sum(lista)
    return suma

def obtener_promedio(lista):
    promedio = sum(lista) / len(lista)
    return promedio

def obtener_maximo(lista):
    maximo = max(lista)
    return maximo

def obtener_minimo(lista):
    minimo = min(lista)
    return minimo

def duplicar_elementos(lista):
    duplicados = [num * 2 for num in lista]
    return duplicados

numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
resultado_suma = sumar_elementos(numeros)
resultado_promedio = obtener_promedio(numeros)
resultado_maximo = obtener_maximo(numeros)
resultado_minimo = obtener_minimo(numeros)
resultado_duplicados = duplicar_elementos(numeros)

print("Lista de números:", numeros)
print("Suma de los elementos:", resultado_suma)
print("Promedio de los elementos:", resultado_promedio)
print("Valor máximo:", resultado_maximo)
print("Valor mínimo:", resultado_minimo)
print("Duplicados:", resultado_duplicados)
