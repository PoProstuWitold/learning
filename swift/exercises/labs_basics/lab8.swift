import Foundation

// Zadanie 8.1.
// Polecenie 1. Napisz program konsolowy, który zdefiniuje krotkę osoba składającą się
// z elementów takich jak: imię, nazwisko, rok urodzenia.
// Polecenie 2. Utwórz dwie krotki. Wyświetl, która osoba jest starsza, a która młodsza, lub
// obie, jeśli są w takim samym wieku.
func zadanie8_1() {
    // Definiowanie krotek osoby
    let person1 = (firstName: "Witold", lastName: "Zawada", birthYear: 2003)
    let person2 = (firstName: "Anna", lastName: "Kowalska", birthYear: 2002)

    // Wyświetlanie porównania wieku osób
    print("Porownanie wieku:")
    if person1.birthYear < person2.birthYear {
        print("Osoba '\(person1.firstName) \(person1.lastName)' jest MLODSZA niz \(person2.firstName) \(person2.lastName).")
    } else if person1.birthYear > person2.birthYear {
        print("Osoba '\(person2.firstName) \(person2.lastName)' jest MLODSZA niz \(person1.firstName) \(person1.lastName).")
    } else {
        print("\(person1.firstName) \(person1.lastName) oraz \(person2.firstName) \(person2.lastName) sa w tym samym wieku.")
    }
}
zadanie8_1()

// Zadanie 8.2.
// Polecenie 1. Napisz program konsolowy, który zdefiniuje krotkę student składającą się
// z elementów takich jak: nazwisko oraz trzech ocen.
// Polecenie 2. Wczytaj dane trzech studentów. Wyświetl dane studentów w kolejności
// malejącej według uzyskanej średniej. Należy zapewnić poprawne wprowadzenie ocen.
func zadanie8_2() {
    typealias Student = (lastName: String, grade1: Double, grade2: Double, grade3: Double)

    func calculateAverage(for student: Student) -> Double {
        return (student.grade1 + student.grade2 + student.grade3) / 3.0
    }

    var students = [Student]()

    for i in 1...3 {
        print("Podaj nazwisko studenta \(i):")
        guard let lastName = readLine(), !lastName.isEmpty else {
            print("Nieprawidłowe nazwisko.")
            return
        }

        var grades = [Double]()
        for j in 1...3 {
            print("Podaj ocenę \(j) dla studenta \(i):")
            guard let input = readLine(), let grade = Double(input), grade >= 2 && grade <= 5 else {
                print("Nieprawidłowa ocena. Ocena musi być liczbą od 2 do 5.")
                return
            }
            grades.append(grade)
        }
        let student = Student(lastName: lastName, grade1: grades[0], grade2: grades[1], grade3: grades[2])
        students.append(student)
    }

    // Sortowanie studentów według średniej malejąco
    students.sort { calculateAverage(for: $0) > calculateAverage(for: $1) }

    print("Studenci posortowani według średniej ocen malejaco:")
    for student in students {
        let average = calculateAverage(for: student)
		let calculated = String(format: "%.2f", average)
        print("Nazwisko: \(student.lastName), Średnia ocen: \(calculated))")
    }
}
// zadanie8_2()

// Zadanie 8.3.
// Polecenie 1. Wprowadź od użytkownika liczbę mieszkań, a następnie wczytaj dane mieszkań
// do tablicy. Każde mieszkanie składa się z elementów takich jak: lokalizacja, powierzchnia
// oraz cena za metr.
// Polecenie 2. Wyświetl mieszkanie najdroższe oraz najtańsze.
func zadanie8_3() {
    typealias Apartment = (location: String, area: Double, pricePerSquareMeter: Double)
    
    var apartments = [Apartment]()

    print("Podaj liczbę mieszkań:")
    guard let input = readLine(), let apartmentCount = Int(input), apartmentCount > 0 else {
        print("Nieprawidłowa liczba mieszkań.")
        return
    }
    
    for i in 1...apartmentCount {
        print("Podaj lokalizację mieszkania \(i):")
		// Lokalizacja nie może zaczynać się od cyfry ani być pusta
        guard let location = readLine(), !location.isEmpty, !location.first!.isNumber else {
            print("Nieprawidłowa lokalizacja.")
            return
        }

        print("Podaj powierzchnię mieszkania \(i) (w metrach kwadratowych):")
        guard let areaInput = readLine(), let area = Double(areaInput), area > 0 else {
            print("Nieprawidłowa powierzchnia.")
            return
        }

        print("Podaj cenę za metr kwadratowy mieszkania \(i):")
        guard let priceInput = readLine(), let pricePerSquareMeter = Double(priceInput), pricePerSquareMeter > 0 else {
            print("Nieprawidłowa cena za metr kwadratowy.")
            return
        }

        let apartment = Apartment(location: location, area: area, pricePerSquareMeter: pricePerSquareMeter)
        apartments.append(apartment)
    }

    // Mieszkanie najdroższe i najtańsze
    guard 
	let mostExpensive = apartments.max(by: { $0.pricePerSquareMeter < $1.pricePerSquareMeter }),
    let cheapest = apartments.min(by: { $0.pricePerSquareMeter < $1.pricePerSquareMeter }) 
	else {
        print("Brak mieszkań do porównania.")
        return
    }

    print("Najdroższe mieszkanie:")
    print("Lokalizacja: \(mostExpensive.location)")
	print("Powierzchnia: \(mostExpensive.area) m^2")
	print("Cena za metr: \(mostExpensive.pricePerSquareMeter) PLN")

    print("Najtańsze mieszkanie:")
	print("Lokalizacja: \(cheapest.location)")
	print("Powierzchnia: \(cheapest.area) m^2")
	print("Cena za metr: \(cheapest.pricePerSquareMeter) PLN")
}
// zadanie8_3()

// Zadanie 8.4.
// Polecenie 1. Zdefiniuj typ wyliczeniowy Miesiac, który zawiera 12 miesięcy.
// Polecenie 2. Dopasuj porę roku dla danego miesiąca za pomocą instrukcji switch. Załóż, że
// dany miesiąc jest przyporządkowany do jednej pory roku.
func zadanie8_4() {
    enum Month: Int {
        case january = 0, february, march, april, may, june, july, august, september, october, november, december
    }

    func determineSeason(for month: Month) {
        switch month {
			case .december, .january, .february:
				print("\(month) należy do zimy.")
			case .march, .april, .may:
				print("\(month) należy do wiosny.")
			case .june, .july, .august:
				print("\(month) należy do lata.")
			case .september, .october, .november:
				print("\(month) należy do jesieni.")
        }
    }

    print("Podaj numer miesiąca (0 - Styczeń, 1 - Luty, ..., 11 - Grudzień):")
    guard let input = readLine(), let monthNumber = Int(input), let month = Month(rawValue: monthNumber) else {
        print("Nieprawidłowy numer miesiąca.")
        return
    }

    determineSeason(for: month)
}
// zadanie8_4()

// Zadanie 8.5.
// Polecenie 1. Zdefiniuj typ wyliczeniowy Standard dla mieszkania (wysoki, średni, niski).
// Polecenie 2. Zmodyfikuj zad. 8.3 uzupełniając dane o standardzie mieszkania.
func zadanie8_5() {
    typealias Apartment = (location: String, area: Double, pricePerSquareMeter: Double, standard: Standard)

    enum Standard: String {
        case high = "h"
        case medium = "m"
        case low = "l"
    }

    var apartments = [Apartment]()

    print("Podaj liczbę mieszkań:")
    guard let input = readLine(), let apartmentCount = Int(input), apartmentCount > 0 else {
        print("Nieprawidłowa liczba mieszkań.")
        return
    }

    for i in 1...apartmentCount {
        print("Podaj lokalizację mieszkania \(i):")
        // Lokalizacja nie może zaczynać się od cyfry ani być pusta
        guard let location = readLine(), !location.isEmpty, !location.first!.isNumber else {
            print("Nieprawidłowa lokalizacja.")
            return
        }

        print("Podaj powierzchnię mieszkania \(i) (w metrach kwadratowych):")
        guard let areaInput = readLine(), let area = Double(areaInput), area > 0 else {
            print("Nieprawidłowa powierzchnia.")
            return
        }

        print("Podaj cenę za metr kwadratowy mieszkania \(i):")
        guard let priceInput = readLine(), let pricePerSquareMeter = Double(priceInput), pricePerSquareMeter > 0 else {
            print("Nieprawidłowa cena za metr kwadratowy.")
            return
        }

        // Dodanie pola standardu mieszkania
        print("Podaj standard mieszkania (h - wysoki, m - średni, l - Niski):")
        guard let standardInput = readLine(), let standard = Standard(rawValue: standardInput) else {
            print("Nieprawidłowy standard mieszkania.")
            return
        }

        // Dodanie mieszkania do tablicy z polem standardu
        let apartment = Apartment(location: location, area: area, pricePerSquareMeter: pricePerSquareMeter, standard: standard)
        apartments.append(apartment)
    }

    // Mieszkanie najdroższe i najtańsze
    guard 
	let mostExpensive = apartments.max(by: { $0.pricePerSquareMeter < $1.pricePerSquareMeter }),
    let cheapest = apartments.min(by: { $0.pricePerSquareMeter < $1.pricePerSquareMeter }) 
	else {
        print("Brak mieszkań do porównania.")
        return
    }

    print("Najdroższe mieszkanie:")
    print("Lokalizacja: \(mostExpensive.location)")
    print("Powierzchnia: \(mostExpensive.area) m^2")
    print("Cena za metr: \(mostExpensive.pricePerSquareMeter) PLN")
    print("Standard: \(mostExpensive.standard.rawValue)")

    print("Najtańsze mieszkanie:")
    print("Lokalizacja: \(cheapest.location)")
    print("Powierzchnia: \(cheapest.area) m^2")
    print("Cena za metr: \(cheapest.pricePerSquareMeter) PLN")
    print("Standard: \(cheapest.standard.rawValue)")
}
zadanie8_5()
