# *args - allows you to pass multiple non-key arguments
# **kwargs - allows you to pass multiple keyword-arguments
# * - unpacking operator
# 1. positional, 2. default, 3. keyword, 4. ARBITRARY 

# ----- *ARGS Example 1 -----
def add(*nums):
    total = 0
    for num in nums:
        total += num
    return total

print(add(1, 2, 3, 4))

# ----- *ARGS Example 2 -----

def display_name(*args):
    print(f"Hello", end=" ")
    for arg in args:
        print(arg, end=" ")
display_name("dr", "inż.", "Janusz", "Adam", "Kowalski")

# ----- **KWARGS -----
def print_address(**kwargs):
    for value in kwargs.values():
        print(value, end=" ")

print_address(
    street="Unii Lubelskiej 2137", city="Lublin", voivodeship="LUB", zip="20-123", state="Poland"
)

# ----- EXERCISE -----
def shipping_label(*args, **kwargs):
    # Print the full name from positional arguments
    for arg in args:
        print(arg, end=" ")
    print()
    
    # Print the address from keyword arguments
    if "apt" in kwargs:
        print(f"{kwargs.get('street')} {kwargs.get('apt')}")
    elif "pobox" in kwargs:
        print(f"{kwargs.get('street')}")
        print(f"{kwargs.get('pobox')}")
    else:
        print(f"{kwargs.get('street')}")
    
    # Print the city, voivodeship, state, and zip code
    print(f"{kwargs.get('city')}, {kwargs.get('voivodeship')}, {kwargs.get('state')} {kwargs.get('zip')}")

print('\n\n')

shipping_label(
    "dr", "inż.", "Janusz", "Adam", "Kowalski",
    street="Unii Lubelskiej 2137", city="Lublin", voivodeship="LUB", zip="20-123", state="Poland"
)
