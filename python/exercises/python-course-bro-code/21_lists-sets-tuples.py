#   List  = [] ordered and changeable. Duplicates OK
#   Set   = {} unordered and immutable, but Add/Remove OK. NO duplicates
#   Tuple = () ordered and unchangeable. Duplicates OK. FASTER

# List
fruits = ["apple", "banana", "cherry"]
print(fruits[0:2]) # ['apple', 'banana']
print(fruits[-1]) # cherry
# print(dir(fruits)) # methods
# print(help(fruits)) # help on method

for fruit in fruits:
	print(fruit)

# Set
fruits2 = {"apple", "banana", "cherry"}
print(fruits2) # {'banana', 'apple', 'cherry'}
# print(dir(fruits2)) # methods
# print(help(fruits2)) # help on method
# print(fruits2[0]) # TypeError: 'set' object is not subscriptable

for fruit in fruits2:
	print(fruit)

# Tuple
fruits3 = ("apple", "banana", "cherry")
print(fruits3) # ('apple', 'banana', 'cherry')
# print(dir(fruits3)) # methods
# print(help(fruits3)) # help on method
# print(fruits3[0]) # apple
print("apple" in fruits3) # True