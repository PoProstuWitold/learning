# ----------  EXAMPLE 1  ---------- 
def display_invoice(username, amount, due_date):
   print(f"Hello {username}")
   print(f"Your bill of ${amount:.2f} is due: {due_date}")

display_invoice("Witold", 21.37, "20/10/2024")
display_invoice("Sara", 100.01, "21/11/2024")

# ----------  EXAMPLE 2  ---------- 

def create_name(first, last):
    first = first.capitalize()
    last = last.capitalize()
    return first + " " + last

full_name = create_name("John", "Doe")
print(full_name)