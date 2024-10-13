# ---------- main.py ----------
import example

result = example.pi
result = example.square(3)
result = example.cube(3)
result = example.circumference(3)
result = example.area(3)

print(result)

# ---------- example.py ----------
pi = 3.14159

def square(x):
   return x ** 2

def cube(x):
   return x ** 3

def circumference(radius):
   return 2 * pi * radius

def area(radius):
   return pi * radius ** 2