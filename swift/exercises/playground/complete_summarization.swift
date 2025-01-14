import Foundation

// Lab 2: Zmienne i stałe
//     Definicje:
//         let — deklaracja stałej.
//         var — deklaracja zmiennej.
//     Typy danych: Int, Double, Float, String, Bool.
//     Optionals: Typ pozwalający na brak wartości (nil). Rozpakowanie za pomocą if let lub guard let.
// Przykład zadania: Napisz program, który wczyta od użytkownika rok urodzenia 
// i obliczy wiek na podstawie bieżącego roku (2025).
func calculateAge() {
    let currentYear = 2025
    print("Podaj rok urodzenia:")
    guard let input = readLine(), let birthYear = Int(input), 
	birthYear > 1900, birthYear <= currentYear else {
        print("Nieprawidłowy rok urodzenia.")
        return
    }
    print("Masz \(currentYear - birthYear) lat.")
}
// calculateAge()

// Lab 3: Łańcuchy znakowe
//     String: Ciągi znaków jako struktura.
//     Operacje: Konkatenacja (+), interpolacja (\(zmienna)).
//     Metody: count, hasPrefix, hasSuffix, manipulacje (append, remove).
// Przykład zadania: Wczytaj ciąg znaków oraz znak od użytkownika. Sprawdź, ile razy dany znak występuje w ciągu.
func countCharacter() {
    print("Podaj ciąg znaków:")
    guard let string = readLine(), !string.isEmpty else {
        print("Nie podano ciągu znaków.")
        return
    }

    print("Podaj znak do wyszukania:")
    guard let charInput = readLine(), charInput.count == 1, let char = charInput.first else {
        print("Nieprawidłowy znak.")
        return
    }

    let count = string.filter { $0 == char }.count
    print(count > 0 ? "Znak '\(char)' występuje \(count) razy." : "Znak '\(char)' nie występuje w ciągu.")
}
// countCharacter()

// Lab 4: Instrukcje warunkowe
//     if, else if, else: Do prostych warunków.
//     switch: Obsługuje wiele przypadków, wspiera zakresy i wyrażenia warunkowe.
//     guard: Chroni przed błędami poprzez wczesne wyjście z funkcji.
// Przykład zadania: Napisz program, który sprawdzi, czy liczba jest parzysta.
func checkEven() {
    print("Podaj liczbę całkowitą:")
    guard let input = readLine(), let number = Int(input) else {
        print("Nieprawidłowa liczba.")
        return
    }

    if number % 2 == 0 {
        print("Liczba \(number) jest parzysta.")
    } else {
        print("Liczba \(number) jest nieparzysta.")
    }
}
// checkEven()

// Lab 5-7: Pętle i kolekcje
//     Tablice (Array), zbiory (Set), słowniki (Dictionary): Przechowywanie wielu wartości.
//     Pętle: for, while, repeat-while.
// Przykład zadania: Wczytaj od użytkownika tablicę liczb, znajdź najmniejszą i największą wartość.
func findMinMax() {
    print("Podaj rozmiar tablicy:")
    guard let sizeInput = readLine(), let size = Int(sizeInput), size > 0 else {
        print("Nieprawidłowy rozmiar tablicy.")
        return
    }

    var numbers = [Int]()
    for i in 1...size {
        print("Podaj liczbę \(i):")
        guard let numInput = readLine(), let num = Int(numInput) else {
            print("Nieprawidłowa liczba.")
            return
        }
        numbers.append(num)
    }

    print("Najmniejsza: \(numbers.min()!), Największa: \(numbers.max()!)")
}
// findMinMax()

// Lab 8-9: Krotki i wyliczenia
//     Krotki (tuples): Grupowanie wartości o różnych typach.
//     Wyliczenia (enum): Tworzenie typu z określonymi wartościami.
// Przykład zadania: Zdefiniuj wyliczenie dni tygodnia. Napisz funkcję, która sprawdzi, czy dany dzień jest roboczy.
enum Weekday: String {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday

    func isWorkingDay() -> Bool {
        switch self {
        case .saturday, .sunday:
            return false
        default:
            return true
        }
    }
}

func checkWorkingDay() {
    print("Podaj dzień tygodnia (np. monday):")
    guard let input = readLine(), let day = Weekday(rawValue: input.lowercased()) else {
        print("Nieprawidłowy dzień tygodnia.")
        return
    }

    print(day.isWorkingDay() ? "\(day.rawValue.capitalized) jest dniem roboczym." : "\(day.rawValue.capitalized) nie jest dniem roboczym.")
}
// checkWorkingDay()

// Lab 10-11: Klasy i dziedziczenie
//     Klasa: Referencyjny typ danych z właściwościami i metodami.
//     Dziedziczenie: Rozszerzenie funkcjonalności klas bazowych.
// Przykład zadania: Stwórz klasę Rectangle z metodami obliczania pola i obwodu.
class Rectangle {
    let length: Double
    let width: Double

    init(length: Double, width: Double) {
        self.length = length
        self.width = width
    }

    func area() -> Double {
        return length * width
    }

    func perimeter() -> Double {
        return 2 * (length + width)
    }

    func display() {
        print("Długość: \(length), Szerokość: \(width), Pole: \(area()), Obwód: \(perimeter())")
    }
}

func testRectangle() {
	let rectangle = Rectangle(length: 5, width: 3)
	rectangle.display()
}
// testRectangle()

// Lab 12: Protokoły
//     Protokoły: Określają wymagane właściwości i metody dla klas, struktur i wyliczeń.
//     Zastosowanie: Polimorfizm, abstrakcja.
// Przykład zadania: Zaimplementuj protokół Shape z metodą do obliczania pola.
protocol Shape {
    func area() -> Double
}

class Circle: Shape {
    let radius: Double

    init(radius: Double) {
        self.radius = radius
    }

    func area() -> Double {
        return Double.pi * radius * radius
    }

    func display() {
        print("Promień: \(radius), Pole: \(String(format: "%.2f", area()))")
    }
}

func testCircle() {
	let circle = Circle(radius: 5)
	circle.display()
}
// testCircle()