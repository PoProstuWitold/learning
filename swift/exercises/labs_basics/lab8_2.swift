import Foundation
// 1, 3, 4, 5


// Zadanie 8.1.
// Polecenie 1. Napisz program konsolowy, który zdefiniuje krotkę osoba składającą się
// z elementów takich jak: imię, nazwisko, rok urodzenia.
// Polecenie 2. Utwórz dwie krotki. Wyświetl, która osoba jest starsza, a która młodsza, lub
// obie, jeśli są w takim samym wieku.
func zadanie8_1() {
	// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/types/#Type-Identifier
	typealias Person = (firstName: String, lastName: String, birthYear: Int)

    let person1: Person = (firstName: "Witold", lastName: "Zawada", birthYear: 2003)
    let person2: Person = Person(firstName: "John", lastName: "Doe", birthYear: 2002)

    print("Porownanie wieku:")
    if person1.birthYear < person2.birthYear {
        print("Osoba '\(person1.firstName) \(person1.lastName)' jest MLODSZA niz '\(person2.firstName) \(person2.lastName)'.")
    } else if person1.birthYear > person2.birthYear {
        print("Osoba '\(person2.firstName) \(person2.lastName)' jest MLODSZA niz '\(person1.firstName) \(person1.lastName)'.")
    } else {
        print("Osoby '\(person1.firstName) \(person1.lastName)' oraz '\(person2.firstName) \(person2.lastName)' sa w tym samym wieku.")
    }
}
// zadanie8_1()

// Zadanie 8.3.
// Polecenie 1. Wprowadź od użytkownika liczbę mieszkań, a następnie wczytaj dane mieszkań
// do tablicy. Każde mieszkanie składa się z elementów takich jak: lokalizacja, powierzchnia
// oraz cena za metr.
// Polecenie 2. Wyświetl mieszkanie najdroższe oraz najtańsze.
// Zadanie 8.5.
// Polecenie 1. Zdefiniuj typ wyliczeniowy Standard dla mieszkania (wysoki, średni, niski).
// Polecenie 2. Zmodyfikuj zad. 8.3 uzupełniając dane o standardzie mieszkania.
func zadanie8_3_5() {
	// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/types/#Type-Identifier
    typealias Apartment = (
		location: String, 
		area: Double, 
		pricePerSquareMeter: Double, 
		standard: Standard
	)
    enum Standard: String {
        case high = "h"
        case medium = "m"
        case low = "l"
    }
    var apartments = [Apartment]()

	// liczba mieszkań musi być liczbą całkowitą większą od 0
	print("Podaj liczbę mieszkań:")
    guard let input = readLine(), let apartmentCount = Int(input), apartmentCount > 0 else {
        print("Nieprawidłowa liczba mieszkań.")
        return
    }

	for i in 1...apartmentCount {
		// lokalizacja nie może być pusta i zaczynać się od liczby
        print("Podaj lokalizację mieszkania \(i):")
        guard let location = readLine(), !location.isEmpty, !location.first!.isNumber else {
            print("Nieprawidłowa lokalizacja.")
            return
        }

		// powierzchnia w metrach kwadratowych musi byc liczba zmiennoprzecinkową większą od 0
        print("Podaj powierzchnię mieszkania \(i) (m^2):")
        guard let areaInput = readLine(), let area = Double(areaInput), area > 0 else {
            print("Nieprawidłowa powierzchnia.")
            return
        }

		// cena za metr kwadratowy musi być liczbą zmiennoprzecinkową większą od 0
        print("Podaj cenę za metr kwadratowy mieszkania (PLN/m^2) \(i):")
        guard let priceInput = readLine(), let pricePerSquareMeter = Double(priceInput), pricePerSquareMeter > 0 else {
            print("Nieprawidłowa cena za metr kwadratowy.")
            return
        }

        // standard mieszkania musi być przekazywany jako "rawValue" z enuma Standard
		// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations/#Raw-Values
        print("Podaj standard mieszkania (h - wysoki, m - średni, l - niski):")
        guard let standardInput = readLine(), let standard = Standard(rawValue: standardInput) else {
            print("Nieprawidłowy standard mieszkania.")
            return
        }

        // Dodanie mieszkania do tablicy z polem standardu
        // let apartment = Apartment(
		// 	location: location, area: area, pricePerSquareMeter: pricePerSquareMeter, standard: standard
		// )
		let apartment = Apartment(
			location, area, pricePerSquareMeter, standard
		)
        apartments.append(apartment)
    }

	// unwrapuje, bo wiem w tym momencie, że tablica nie jest pusta
	// w najgorszym wypadku jedno mieszkanie bedzie najdroższe i najtańsze
	// najdroższe
	let mostExpensive = apartments.max(
		by: { 
			a, b in a.pricePerSquareMeter * a.area < b.pricePerSquareMeter * b.area 
		}
	)!
	let totalExpensive = mostExpensive.pricePerSquareMeter * mostExpensive.area
	let cheapest = apartments.min(
		by: {
			$0.pricePerSquareMeter * $0.area < $1.pricePerSquareMeter * $1.area
		}
	)!
	let totalCheapest = cheapest.pricePerSquareMeter * cheapest.area
	
	print("Najdroższe mieszkanie:")
    print("Lokalizacja: \(mostExpensive.location)")
    print("Powierzchnia: \(mostExpensive.area) m^2")
    print("Cena za metr: \(mostExpensive.pricePerSquareMeter) PLN")
    print("Standard: \(mostExpensive.standard.rawValue)")
	print("Całkowita cena: \(totalExpensive) PLN")

    print("Najtańsze mieszkanie:")
    print("Lokalizacja: \(cheapest.location)")
    print("Powierzchnia: \(cheapest.area) m^2")
    print("Cena za metr: \(cheapest.pricePerSquareMeter) PLN")
    print("Standard: \(cheapest.standard.rawValue)")
	print("Całkowita cena: \(totalCheapest) PLN")
}
// zadanie8_3_5()

// Lokalizacja: Lublin
// Powierzchnia: 30.0 m^2
// Cena za metr: 8000.0 PLN
// Standard: h
// Całkowita cena: 240000.0 PLN
// Najtańsze mieszkanie:
// Lokalizacja: Deblin
// Powierzchnia: 70.0 m^2
// Cena za metr: 3000.0 PLN
// Standard: m
// Całkowita cena: 210000.0 PLN

// Zadanie 8.4.
// Polecenie 1. Zdefiniuj typ wyliczeniowy Miesiac, który zawiera 12 miesięcy.
// Polecenie 2. Dopasuj porę roku dla danego miesiąca za pomocą instrukcji switch. Załóż, że
// dany miesiąc jest przyporządkowany do jednej pory roku.
func zadanie8_4() {
    enum Month: Int {
        case styczen = 1, luty, marzec, kwiecien, maj, czerwiec, lipiec, sierpien, wrzesien, pazdziernik, listopad, grudzien
    }

    func determineSeason(monthAsNumber month: Month) {
        switch month {
			case .grudzien, .styczen, .luty:
				print("\(month) należy do zimy.")
			case .marzec, .kwiecien, .maj:
				print("\(month) należy do wiosny.")
			case .czerwiec, .lipiec, .sierpien:
				print("\(month) należy do lata.")
			case .wrzesien, .pazdziernik, .listopad:
				print("\(month) należy do jesieni.")
        }
    }

	// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations/#Raw-Values
    print("Podaj numer miesiąca (1 - styczeń, 2 - luty, ..., 12 - grudzień):")
    guard let input = readLine(), let monthNumber = Int(input), let month = Month(rawValue: monthNumber) else {
        print("Nieprawidłowy numer miesiąca.")
        return
    }

    determineSeason(monthAsNumber: month)
}
zadanie8_4()
