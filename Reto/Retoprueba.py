# Keyword: as
import math as m

# Keywords: False, None, True, and, class, def, is, lambda, not, or, as, assert, async, await,
# break, continue, del, elif, else, if, except, finally, for, from, global, import, in, pass, raise, return, try, while, with, yield

# Definition of a class
class MiClase:
    def __init__(self):
        self.valor = None

    def establecer_valor(self, nuevo_valor):
        self.valor = nuevo_valor

# Creation of an instance of the class
objeto = MiClase()

# Usage of keywords
if objeto.valor is None or objeto.valor == False:
    objeto.establecer_valor(True)
    print("The value has been changed to True")

# Usage of lambda
suma = lambda x, y: x + y
resultado = suma(3, 5)
print("The result of the sum is:", resultado)

# Definition of a function
def ejemplo_funcion():
    variable_externa = "External"

    def funcion_interna():
        variable_interna = "Internal"
        print("Internal value:", variable_interna)
        print("External value:", variable_externa)

        variable_externa = variable_externa.upper()
        print("Modified external value:", variable_externa)

    funcion_interna()

# Usage of keywords
ejemplo_funcion()

# Usage of 'not' and 'and'
condition_1 = True
condition_2 = False

if not condition_1 and condition_2:
    print("Both conditions are true.")
else:
    print("At least one of the conditions is false.")

# Keyword: assert
valor = 10
assert valor > 0, "The value must be greater than zero"

# Keywords: async and await
import asyncio

async def my_function():
    print("Starting my_function")
    await asyncio.sleep(2)
    print("Finishing my_function")

asyncio.run(my_function())

# Keywords: break and continue
for i in range(1, 11):
    if i == 5:
        break
    if i % 2 == 0:
        continue
    print(i)

# Keyword: del
my_list = [1, 2, 3, 4, 5]
print(my_list)
del my_list[2]
print(my_list)

# Keywords: elif and else
value = 15

if value < 10:
    print("The value is less than 10")
elif value < 20:
    print("The value is between 10 and 19")
else:
    print("The value is greater or equal to 20")

# Keyword: if
number = 7
if number % 2 == 0:
    print("The number is even")
else:
    print("The number is odd")

# Keywords: except and raise
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Error: division by zero")
    raise

# Keyword: finally
try:
    print("Try block")
finally:
    print("Finally block")

# Keyword: for
for j in range(1, 6):
    print(j)

# Keywords: from and import
from math import pi as pi_value
print("The value of pi is:", pi_value)

# Keyword: global
my_global_variable = 5

def my_function():
    global my_global_variable
    my_global_variable = 10

my_function()
print("The value of my_global_variable is:", my_global_variable)

# Keyword: in
my_number_list = [1, 2, 3, 4, 5]
if 3 in my_number_list:
    print("The number 3 is in the list")

# Keyword: pass
comparison_value = 10
if comparison_value > 5:
    pass
else:
    print("The value is less than or equal to 5")

# Keyword: return
def sum(a, b):
    return a + b

sum_result = sum(3, 4)
print("The result of the sum is:", sum_result)

# Keyword: try
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Error: division by zero")

# Keyword: while
while_counter = 0
while while_counter < 5:
    print("Counter:", while_counter)
    while_counter += 1

# Keyword: with
with open("file.txt", "r") as text_file:
    file_content = text_file.read()
    print("File content:", file_content)

# Keyword: yield
def number_generator():
    yield 1
    yield 2
    yield 3

for num in number_generator():
    print(num)

