import math

# Math operators
friends = 0

friends += 2
# friends -= 2
# friends *= 2
# friends /= 2
# friends **= 2
remainder = friends % 3

print(friends, remainder)

# Math functions
x = 3.14
y = 4
z = 5

# result = round(x)
# result = abs(-x)
# result = max(x, y, z)
# result = min(x, y, z)
result = pow(x, y)

print(result)
print(math.pi)
print(math.e)
print(math.inf)
print(math.sqrt(9.1))
print(math.ceil(3.1))
print(math.floor(3.9))

# Cirle circumference
radius = float(input("Enter the radius of the circle: "))
circumference = 2 * math.pi * radius

print(f"The circumference of the circle is {round(circumference, 2)}cm")

# Cirlce area
area = math.pi * radius ** 2
print(f"The area of the circle is {round(area, 2)}cm^2")