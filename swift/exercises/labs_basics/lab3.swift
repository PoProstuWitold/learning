// Zadanie 3.1. Utwórz aplikację konsolową – napisy jedno i wieloliniowe
/*
let jednoliniowy = "To jest jednoliniowy napis."
let wieloliniowy = """
To jest napis
wieloliniowy, który ma
więcej niż jedną linię.
"""

print(jednoliniowy)
print("\n")
print(wieloliniowy)
*/

// Zadanie 3.2. Utwórz aplikację konsolową – formatowanie tekstu
/*
let sformatowanyTekst = """
\tNauka kodowania to nie tylko nauka języka technologii.

\tTo odkrywanie nowych sposobów myślenia

\tI urzeczywistnianie rozmaitych koncepcji.
"""

print("\n" + sformatowanyTekst + "\n")
*/

// Zadanie 3.3. Utwórz aplikację konsolową – łączenie tekstów
/*
import Foundation

print("Podaj swoje imię:")
let firstName = readLine() ?? ""
print("Podaj swoje drugie imię:")
let middleName = readLine() ?? ""
print("Podaj swoje nazwisko:")
let lastName = readLine() ?? ""
print("Podaj swój rok urodzenia:")
let birthYearStr = readLine() ?? ""
let birthYear = Int(birthYearStr) ?? 0

let fullData = "\(firstName) \(middleName) \(lastName) urodzony w \(birthYear)"
print("\nPelne dane: \(fullData)")

let noMiddlename = "\(firstName) \(lastName) urodzony w \(birthYear)"
print("\nBez drugiego imienia: \(noMiddlename)")

let currentYear = 2024
let age = currentYear - birthYear
let withAge = "\(firstName) \(lastName), wiek: \(age)"
print("\nZ wiekiem: \(withAge)")

if firstName.hasPrefix("D") {
    print("\nImię zaczyna się na literę D.")
} else {
    print("\nImię nie zaczyna się na literę D.")
}
*/

// Zadanie 3.4. Utwórz aplikację konsolową – szukanie znaku
/*
import Foundation

print("Podaj dowolny ciąg znaków:")
let string = readLine() ?? ""
print("Podaj pojedynczy znak:")
let char = readLine() ?? ""
print("Podaj liczbę całkowitą:")
let intStr = readLine() ?? ""
let int = Int(intStr) ?? 0

if string.first == Character(char) {
    print("Znak znajduje się na początku ciągu.")
} else {
    print("Znak nie znajduje się na początku ciągu.")
}

if string.last == Character(char) {
    print("Znak znajduje się na końcu ciągu.")
} else {
    print("Znak nie znajduje się na końcu ciągu.")
}

if int >= 0 && int < string.count {
    let indexFromStart = string.index(string.startIndex, offsetBy: int)
    if string[indexFromStart] == Character(char) {
        print("Znak znajduje się na indeksie \(int) od początku ciągu.")
    } else {
        print("Znak nie znajduje się na indeksie \(int) od początku ciągu.")
    }
} else {
    print("Podana liczba jest spoza zakresu długości ciągu.")
}

if int >= 0 && int < string.count {
    let indexFromEnd = string.index(string.endIndex, offsetBy: -int - 1)
    if string[indexFromEnd] == Character(char) {
        print("Znak znajduje się na indeksie \(int) od końca ciągu.")
    } else {
        print("Znak nie znajduje się na indeksie \(int) od końca ciągu.")
    }
} else {
    print("Podana liczba jest spoza zakresu długości ciągu.")
}
// przykłady:
// 1) ala ma kota, a, 0
// 2) kajak, a, 1
// 3) programowanie, p, 4
*/

// Zadanie 3.5. Utwórz aplikację konsolową – porównywanie ciągów
/*
import Foundation

print("Podaj pierwszy ciąg:")
let firstStr = readLine() ?? ""
print("Podaj drugi ciąg:")
let secondStr = readLine() ?? ""

// firstStr.compare(secondStr) == ComparisonResult.orderedSame
// firstStr.caseInsensitiveCompare(secondStr) == ComparisonResult.orderedSame	
if firstStr == secondStr {
    print("Ciągi są identyczne.")
} else {
    print("Ciągi są różne.")
}

print("Podaj prefiks:")
let prefiks = readLine() ?? ""

if firstStr.hasPrefix(prefiks) {
    print("Prefiks występuje w pierwszym ciągu.")
} else {
    print("Prefiks nie występuje w pierwszym ciągu.")
}

if secondStr.hasPrefix(prefiks) {
    print("Prefiks występuje w drugim ciągu.")
} else {
    print("Prefiks nie występuje w drugim ciągu.")
}

print("Podaj sufiks:")
let sufiks = readLine() ?? ""

if firstStr.hasSuffix(sufiks) {
    print("Sufiks występuje w pierwszym ciągu.")
} else {
    print("Sufiks nie występuje w pierwszym ciągu.")
}

if secondStr.hasSuffix(sufiks) {
    print("Sufiks występuje w drugim ciągu.")
} else {
    print("Sufiks nie występuje w drugim ciągu.")
}
// przykłady:
// 1) Witold, Lublin, Wit, lin
*/

// Zadanie 3.6. Utwórz aplikację konsolową – obwód i pole prostokąta
/*
import Foundation

print("Podaj długość prostokąta:")
let lengthStr = readLine() ?? "0"
let length = Double(lengthStr) ?? 0.0

print("Podaj szerokość prostokąta:")
let widthStr = readLine() ?? "0"
let width = Double(widthStr) ?? 0.0

let circumference = 2 * (length + width)
let area = length * width

let result = """
Wymiary prostokąta:
Długość: \(length)
Szerokość: \(width)
Obwód: \(circumference)
Pole: \(area)
"""

print(result)
*/

// Zadanie 3.7. Utwórz aplikację konsolową – kalkulator walut
import Foundation

print("Podaj kwotę w PLN:")
let plnStr = readLine() ?? "0"
let pln = Double(plnStr) ?? 0.0

let usdToPln = 3.94
let euroToPln = 4.29

let plnAsUsd = pln / usdToPln
let plnAsEuro = pln / euroToPln

print("Kwota w dolarach: $\(String(format: "%.2f", plnAsUsd))")
print("Kwota w euro: \(String(format: "%.2f", plnAsEuro))€")
