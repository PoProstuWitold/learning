import Foundation

// Zadanie 10.5.
// Polecenie 1. Utwórz klasę Osoba, zawierającą imię, nazwisko, rok urodzenia.
// Polecenie 2. Utwórz metodę init().
// Polecenie 3. Utwórz funkcję obliczającą wiek osoby.
// Polecenie 4. Utwórz funkcję wyświetlającą dane osoby.
// Polecenie 5. Przetestuj utworzone funkcje. Zdefiniuj dwie osoby. Wyświetl, która osoba jest
// starsza, a która młodsza, lub obie, jeśli są w tym samym wieku.
class Person {
	let firstName: String
	let lastName: String
	let birthYear: Int

	// 2. Metoda init
	init?(firstName: String, lastName: String, birthYear: Int) {
		guard !firstName.isEmpty, !lastName.isEmpty,
			firstName.allSatisfy({ $0.isLetter }), lastName.allSatisfy({ $0.isLetter }),
			birthYear > 0, birthYear < 2008 else {
			print("Imię i nazwisko muszą być prawidłowe, a rok urodzenia musi należeć do osoby 16+")
			return nil
		}
		self.firstName = firstName
		self.lastName = lastName
		self.birthYear = birthYear
	}

	// 3. Funkcja obliczająca wiek osoby
	func calculateAge(currentYear: Int = Calendar.current.component(.year, from: Date())) -> Int {
		return currentYear - birthYear
	}

	// 4. Funkcja wyświetlająca dane osoby
	func displayData() {
		print("Imię: \(firstName), Nazwisko: \(lastName), Rok urodzenia: \(birthYear), Wiek: \(self.calculateAge())")
	}
}

func zadanie10_5() {
	// 5. Testowanie
    print("Podaj dane pierwszej osoby:")
    print("Imię:")
    guard let firstName1 = readLine(), !firstName1.isEmpty else {
        print("Nieprawidłowe imię.")
		return
    }

    print("Nazwisko:")
    guard let lastName1 = readLine(), !lastName1.isEmpty else {
        print("Nieprawidłowe nazwisko.")
		return
    }

    print("Rok urodzenia:")
    guard let birthYear1Input = readLine(), let birthYear1 = Int(birthYear1Input), birthYear1 > 0 else {
        print("Nieprawidłowy rok urodzenia.")
		return
    }

    guard let person1 = Person(firstName: firstName1, lastName: lastName1, birthYear: birthYear1) else {
        print("Nie udało się utworzyć pierwszej osoby.")
		return
    }

    print("Podaj dane drugiej osoby:")
    print("Imię:")
    guard let firstName2 = readLine(), !firstName2.isEmpty else {
        print("Nieprawidłowe imię.")
		return
    }

    print("Nazwisko:")
    guard let lastName2 = readLine(), !lastName2.isEmpty else {
        print("Nieprawidłowe nazwisko.")
		return
    }

    print("Rok urodzenia:")
    guard let birthYear2Input = readLine(), let birthYear2 = Int(birthYear2Input), birthYear2 > 0 else {
        print("Nieprawidłowy rok urodzenia.")
		return
    }

    guard let person2 = Person(firstName: firstName2, lastName: lastName2, birthYear: birthYear2) else {
        print("Nie udało się utworzyć drugiej osoby.")
		return
    }

    print("\nDane osób:")
    person1.displayData()
    person2.displayData()

    // Porównanie wieku
    let age1 = person1.calculateAge()
    let age2 = person2.calculateAge()

    if age1 > age2 {
        print("\nOsoba starsza: \(person1.firstName) \(person1.lastName)")
        print("Osoba młodsza: \(person2.firstName) \(person2.lastName)")
    } else if age1 < age2 {
        print("\nOsoba starsza: \(person2.firstName) \(person2.lastName)")
        print("Osoba młodsza: \(person1.firstName) \(person1.lastName)")
    } else {
        print("\nObie osoby są w tym samym wieku.")
    }
}
// zadanie10_5()

// Zadanie 10.6.
// Polecenie 1. Utwórz klasę Pracownik, dziedziczącą po klasie Osoba i zawierającą datę rok
// zatrudnienia, stanowisko, stawkę za godzinę i liczbę zrealizowanych godzin oraz nazwę
// firmy. Stanowisko powinno być z góry zdefiniowane jako typ wyliczeniowy.
// Polecenie 2. Utwórz metodę init() korzystając z tej z klasy Osoba.
// Polecenie 3. Utwórz funkcję zwracającą liczbę lat pracy w danej firmie.
// Polecenie 4. Utwórz funkcję zwracającą wysokość pensji za przeprowadzone godziny,
// według stawki.
// Polecenie 5. Utwórz funkcję wyświetlającą dane pracownika, nadpisując funkcję z klasy
// Osoba.
// Polecenie 6. Przetestuj utworzone funkcje.
enum Position: String {
    case manager = "Manager"
    case developer = "Developer"
    case intern = "Intern"
	case ceo = "CEO"
}

class Employee: Person {
    let hireYear: Int
    let position: Position
    let hourlyRate: Double
    let hoursWorked: Int
    let companyName: String

    // 2. Metoda init
    init?(
		firstName: String, lastName: String, birthYear: Int, 
		hireYear: Int, position: Position, hourlyRate: Double, 
		hoursWorked: Int, companyName: String
	) {
        guard hireYear > 0, hireYear < 2024, hourlyRate > 0, hoursWorked >= 0, !companyName.isEmpty else {
            print("Rok zatrudnienia, stawka, liczba godzin i nazwa firmy muszą być poprawne.")
			return nil
        }
        self.hireYear = hireYear
        self.position = position
        self.hourlyRate = hourlyRate
        self.hoursWorked = hoursWorked
        self.companyName = companyName
        super.init(firstName: firstName, lastName: lastName, birthYear: birthYear)
    }

    // 3. Funkcja zwracająca liczbę lat pracy
    func yearsWorked(currentYear: Int = Calendar.current.component(.year, from: Date())) -> Int {
        return currentYear - hireYear
    }

    // 4. Funkcja zwracająca wysokość pensji
    func calculateSalary() -> Double {
        return Double(hoursWorked) * hourlyRate
    }

    // 5. Nadpisanie funkcji wyświetlającej dane
    override func displayData() {
        super.displayData()
        print("Nazwa firmy: \(companyName), Stanowisko: \(position.rawValue), Rok zatrudnienia: \(hireYear)")
        print("Stawka za godzinę: \(String(format: "%.2f", hourlyRate)) PLN, Liczba godzin: \(hoursWorked)")
        print("Lata pracy: \(self.yearsWorked()), Wysokość pensji: \(String(format: "%.2f", self.calculateSalary())) PLN")
    }
}
func zadanie10_6() {
    print("Podaj dane pracownika:")

    print("Imię:")
    guard let firstName = readLine(), !firstName.isEmpty else {
        print("Nieprawidłowe imię.")
		return
    }

    print("Nazwisko:")
    guard let lastName = readLine(), !lastName.isEmpty else {
        print("Nieprawidłowe nazwisko.")
		return
    }

    print("Rok urodzenia:")
    guard let birthYearInput = readLine(), let birthYear = Int(birthYearInput), birthYear > 0 else {
        print("Nieprawidłowy rok urodzenia.")
		return
    }

    print("Rok zatrudnienia:")
    guard let hireYearInput = readLine(), let hireYear = Int(hireYearInput), hireYear > 0 else {
        print("Nieprawidłowy rok zatrudnienia.")
		return
    }

    print("Stanowisko (dostępne: Manager, Developer, Intern, CEO):")
    guard let positionInput = readLine(), let position = Position(rawValue: positionInput) else {
        print("Nieprawidłowe stanowisko.")
		return
    }

    print("Stawka za godzinę:")
    guard let hourlyRateInput = readLine(), let hourlyRate = Double(hourlyRateInput), hourlyRate > 0 else {
        print("Nieprawidłowa stawka za godzinę.")
		return
    }

    print("Liczba przepracowanych godzin:")
    guard let hoursWorkedInput = readLine(), let hoursWorked = Int(hoursWorkedInput), hoursWorked >= 0 else {
        print("Nieprawidłowa liczba przepracowanych godzin.")
		return
    }

    print("Nazwa firmy:")
    guard let companyName = readLine(), !companyName.isEmpty else {
        print("Nieprawidłowa nazwa firmy.")
		return
    }

	guard let employee = Employee(
		firstName: firstName, lastName: lastName, birthYear: birthYear, 
		hireYear: hireYear, position: position, hourlyRate: hourlyRate, 
		hoursWorked: hoursWorked, companyName: companyName
	) else {
		print("Nie udało się utworzyć pracownika.")
		return
	}

    print("\nDane pracownika:")
    employee.displayData()
}
// zadanie10_6()

// Zadanie 11.1.
// Polecenie 1. Utwórz klasę Prostokąt, scharakteryzowaną przez długości boków.
// Polecenie 2. Utwórz metodę init().
// Polecenie 3. Utwórz funkcję zwracającą pole figury.
// Polecenie 4. Utwórz funkcję zwracającą obwód figury.
// Polecenie 3. Utwórz funkcję wyświetlająca dane figury.
// Polecenie 7. Przetestuj utworzone funkcje.
func zadanie11_1() {
    // Klasa Prostokąt
    class Rectangle {
        let length: Double
        let width: Double

        // 2. Metoda init
        init?(length: Double, width: Double) {
            guard length > 0, width > 0 else {
                print("Długości boków muszą być większe od zera.")
                return nil
            }
            self.length = length
            self.width = width
        }

        // 3. Funkcja zwracająca pole figury
        func area() -> Double {
            return length * width
        }

        // 4. Funkcja zwracająca obwód figury
        func perimeter() -> Double {
            return 2 * (length + width)
        }

        // 5. Funkcja wyświetlająca dane figury
        func display() {
            print("Prostokąt:")
            print("- Długość: \(length)")
            print("- Szerokość: \(width)")
            print("- Pole: \(area())")
            print("- Obwód: \(perimeter())")
        }
    }

    // 7. Test funkcji
    print("Podaj długość prostokąta:")
    guard let lengthInput = readLine(), let length = Double(lengthInput) else {
        print("Nieprawidłowa długość.")
        return
    }

    print("Podaj szerokość prostokąta:")
    guard let widthInput = readLine(), let width = Double(widthInput) else {
        print("Nieprawidłowa szerokość.")
        return
    }

    if let rectangle = Rectangle(length: length, width: width) {
        rectangle.display()
    }
}
zadanie11_1()

// Zadanie 11.2.
// Polecenie 1. Utwórz klasę Prostopadłościan, dziedziczącą po klasie Prostokat
// i scharakteryzowaną dodatkowo przez wysokość.
// Polecenie 2. Utwórz metodę init().
// Polecenie 3. Utwórz funkcję zwracającą pole całkowite bryły.
// Polecenie 4. Utwórz funkcję zwracającą sumę krawędzi.
// Polecenie 5. Utwórz funkcję zwracającą objętość bryły.
// Polecenie 6. Utwórz funkcję wyświetlająca dane bryły.
// Polecenie 7. Przetestuj utworzone funkcje.
func zadanie11_2() {
    // Klasa Prostokąt
    class Rectangle {
        let length: Double
        let width: Double

        init?(length: Double, width: Double) {
            guard length > 0, width > 0 else {
                print("Długości boków muszą być większe od zera.")
                return nil
            }
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
            print("Prostokąt:")
            print("- Długość: \(length)")
            print("- Szerokość: \(width)")
            print("- Pole: \(area())")
            print("- Obwód: \(perimeter())")
        }
    }

    // Klasa Prostopadłościan
    class Cuboid: Rectangle {
        let height: Double

        // 2. Metoda init
        init?(length: Double, width: Double, height: Double) {
            guard height > 0 else {
                print("Wysokość musi być większa od zera.")
                return nil
            }
            self.height = height
            super.init(length: length, width: width)
        }

        // 3. Funkcja zwracająca pole całkowite bryły
        func totalSurfaceArea() -> Double {
            return 2 * (length * width + length * height + width * height)
        }

        // 4. Funkcja zwracająca sumę krawędzi
        func totalEdgeLength() -> Double {
            return 4 * (length + width + height)
        }

        // 5. Funkcja zwracająca objętość bryły
        func volume() -> Double {
            return length * width * height
        }

        // 6. Funkcja wyświetlająca dane bryły
        override func display() {
            print("Prostopadłościan:")
            print("- Długość: \(length)")
            print("- Szerokość: \(width)")
            print("- Wysokość: \(height)")
            print("- Pole całkowite: \(self.totalSurfaceArea())")
            print("- Suma krawędzi: \(self.totalEdgeLength())")
            print("- Objętość: \(self.volume())")
        }
    }

    // 7. Test funkcji
    print("Podaj długość prostopadłościanu:")
    guard let lengthInput = readLine(), let length = Double(lengthInput) else {
        print("Nieprawidłowa długość.")
        return
    }

    print("Podaj szerokość prostopadłościanu:")
    guard let widthInput = readLine(), let width = Double(widthInput) else {
        print("Nieprawidłowa szerokość.")
        return
    }

    print("Podaj wysokość prostopadłościanu:")
    guard let heightInput = readLine(), let height = Double(heightInput) else {
        print("Nieprawidłowa wysokość.")
        return
    }

    if let cuboid = Cuboid(length: length, width: width, height: height) {
        cuboid.display()
    }
}
zadanie11_2()