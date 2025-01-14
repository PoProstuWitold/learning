import Foundation

// Zadanie 1
// Stwórz program, który zdefiniuje typ wyliczeniowy "RokAkademicki" z wartościami: "SemestrLetni" i "SemestrZimowy".
// Utwórz strukturę "Przedmiot" przechowującą nazwę przedmiotu, liczbę godzin oraz typ "RokAkademicki".
// Dodaj tablicę z 5 przedmiotami i oblicz łączną liczbę godzin przypadających na SemestrLetni i SemestrZimowy.

enum AcademicYear: String {
    case semestrLetni = "Semestr Letni"
    case semestrZimowy = "Semestr Zimowy"
}

struct Subject {
    let name: String
    let hours: Int
    let semester: AcademicYear
}

func zadanie1() {
    let subjects = [
        Subject(name: "Matematyka", hours: 30, semester: .semestrLetni),
        Subject(name: "Fizyka", hours: 20, semester: .semestrZimowy),
        Subject(name: "Informatyka", hours: 50, semester: .semestrLetni),
        Subject(name: "Chemia", hours: 25, semester: .semestrZimowy),
        Subject(name: "Biologia", hours: 10, semester: .semestrLetni)
    ]

    let totalLetni = subjects.filter { $0.semester == .semestrLetni }.reduce(0) { $0 + $1.hours }
    let totalZimowy = subjects.filter { $0.semester == .semestrZimowy }.reduce(0) { $0 + $1.hours }

    print("Łączna liczba godzin w Semestrze Letnim: \(totalLetni)")
    print("Łączna liczba godzin w Semestrze Zimowym: \(totalZimowy)")
}

zadanie1()

// Zadanie 2
// Napisz program, który przechowuje dane pracowników w tablicy słowników (nazwisko, stanowisko, wynagrodzenie).
// Stwórz typ wyliczeniowy dla stanowisk: "Manager", "Developer", "Tester".
// Oblicz średnie wynagrodzenie dla każdego typu stanowiska.

enum Position: String {
    case manager = "Manager"
    case developer = "Developer"
    case tester = "Tester"
}

typealias Employee = [String: Any]

func zadanie2() {
    let employees: [Employee] = [
        ["name": "Anna", "position": Position.manager, "salary": 12000],
        ["name": "Piotr", "position": Position.developer, "salary": 8000],
        ["name": "Zofia", "position": Position.tester, "salary": 6000],
        ["name": "Tomasz", "position": Position.developer, "salary": 8500],
        ["name": "Maria", "position": Position.manager, "salary": 13000]
    ]

    func averageSalary(for position: Position) -> Double {
        let filtered = employees.filter { $0["position"] as? Position == position }
        let totalSalary = filtered.reduce(0) { $0 + ($1["salary"] as? Int ?? 0) }
        return Double(totalSalary) / Double(filtered.count)
    }

    print("Średnie wynagrodzenie:")
    print("Manager: \(String(format: "%.2f", averageSalary(for: .manager))) PLN")
    print("Developer: \(String(format: "%.2f", averageSalary(for: .developer))) PLN")
    print("Tester: \(String(format: "%.2f", averageSalary(for: .tester))) PLN")
}

zadanie2()

// Zadanie 3
// Stwórz protokół "Figura" z właściwościami: "pole" i "obwód" oraz funkcją wyświetlającą dane figury.
// Zaadoptuj protokół w klasach "Kwadrat" i "Koło".

protocol Shape {
    var area: Double { get }
    var perimeter: Double { get }
    func display()
}

class Square: Shape {
    let side: Double

    init(side: Double) {
        guard side > 0 else {
            fatalError("Długość boku musi być dodatnia.")
        }
        self.side = side
    }

    var area: Double {
        return side * side
    }

    var perimeter: Double {
        return 4 * side
    }

    func display() {
        print("Kwadrat - Bok: \(side), Pole: \(String(format: "%.2f", area)), Obwód: \(String(format: "%.2f", perimeter))")
    }
}

class Circle: Shape {
    let radius: Double

    init(radius: Double) {
        guard radius > 0 else {
            fatalError("Promień musi być dodatni.")
        }
        self.radius = radius
    }

    var area: Double {
        return Double.pi * radius * radius
    }

    var perimeter: Double {
        return 2 * Double.pi * radius
    }

    func display() {
        print("Koło - Promień: \(radius), Pole: \(String(format: "%.2f", area)), Obwód: \(String(format: "%.2f", perimeter))")
    }
}

func zadanie3() {
    let square = Square(side: 5.0)
    let circle = Circle(radius: 3.0)

    square.display()
    circle.display()
}

zadanie3()

// Zadanie 4
// Zaimplementuj obsługę błędów przy dzieleniu liczby przez inną liczbę. Zdefiniuj typ wyliczeniowy "MathError" dla błędów.
// Dodaj funkcję wykonującą dzielenie i obsłuż błędy za pomocą instrukcji do-catch.

enum MathError: Error {
    case divisionByZero
}

func divide(_ a: Double, by b: Double) throws -> Double {
    guard b != 0 else {
        throw MathError.divisionByZero
    }
    return a / b
}

func zadanie4() {
    print("Podaj liczbę a:")
    guard let aInput = readLine(), let a = Double(aInput) else {
        print("Nieprawidłowa liczba.")
        return
    }

    print("Podaj liczbę b:")
    guard let bInput = readLine(), let b = Double(bInput) else {
        print("Nieprawidłowa liczba.")
        return
    }

    do {
        let result = try divide(a, by: b)
        print("Wynik dzielenia: \(String(format: "%.2f", result))")
    } catch MathError.divisionByZero {
        print("Błąd: Próba dzielenia przez zero.")
    } catch {
        print("Nieznany błąd.")
    }
}

zadanie4()
