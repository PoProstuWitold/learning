# dictionary =  a collection of {key:value} pairs
#               ordered and changeable. No duplicates

capitals = {
    "Poland": "Warsaw",
    "Lithuania": "Vilnius",
    "Ukraine": "Kyiv",
    "Belarus": "Minsk",
    "Latvia": "Riga"
}

# print(dir(capitals)) # methods available for dictionaries
# print(help(capitals)) # help on dictionaries

print(capitals.get("Poland")) # Warsaw

if capitals.get("Japan"):
    print("That capital is in the dictionary")
else:
    print("That capital is not in the dictionary")
    
capitals.update({"Slovakia": "Bratislava"})

print(capitals)

capitals.pop("Slovakia")

print(capitals)

print(capitals.keys()) # dict_keys(['Poland', 'Lithuania', 'Ukraine', 'Belarus', 'Latvia'])

for key in capitals.keys():
	print(key)
 
print(capitals.values()) # dict_values(['Warsaw', 'Vilnius', 'Kyiv', 'Minsk', 'Riga'])
for value in capitals.values():
	print(value)
 
print(capitals.items()) # dict_items([('Poland', 'Warsaw'), ('Lithuania', 'Vilnius'), 
						#			  ('Ukraine', 'Kyiv'), ('Belarus', 'Minsk'), ('Latvia', 'Riga')])
for key, value in capitals.items():
	print(f"{key}: {value}")
