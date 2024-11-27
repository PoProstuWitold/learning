import Foundation

// NA KOLOKWIUM BĘDZIE:
// Jeśli zbiór ma mieć 10 elementów, to trzeba sprawdzać czy ma długość 10

// 1 or 2
// 3 or 4

// Zadanie 9.2.
// Polecenie 1. Napisz program konsolowy, który zdefiniuje strukturę rzutOszczepem składającą
// się z identyfikatora osoby, trzech prób rzutów.
// Polecenie 2. Wczytaj dane dla 2-3 zawodników.
// Polecenie 3. Wyświetl zawodnika, który uzyskał największą średnią swoich rzutów.
// Polecenie 4. Usuń zawodnika, który uzyskał najmniejszą średnią swoich rzutów.

// Polecenie 1. Napisz program konsolowy, który zdefiniuje strukturę rzutOszczepem składającą
// się z identyfikatora osoby, trzech prób rzutów.
struct JavelinThrow {
    var id: String
    var throwsArray: [Int: Double]
    
    func average() -> Double {
        let sum = throwsArray.values.reduce(0, +)
        return sum / Double(throwsArray.count)
    }
}

func zadanie9_2() {
    // Polecenie 2. Wczytaj dane dla 2-3 zawodników.
    var athletes = [String: JavelinThrow]()
    var enteredIDs = Set<String>()

    print("Podaj liczbę zawodników (2-3):")
    guard let input = readLine(), let athleteCount = Int(input), athleteCount >= 2, athleteCount <= 3 else {
        print("Nieprawidłowa liczba zawodników.")
        return
    }

    for i in 1...athleteCount {
        var id: String
        repeat {
            print("Podaj id zawodnika \(i):")
            guard let inputID = readLine(), !inputID.isEmpty else {
                print("Nieprawidłowe id.")
                return
            }
            if enteredIDs.contains(inputID) {
                print("Id już istnieje. Podaj inne id.")
                continue
            }
            id = inputID
            enteredIDs.insert(id)
            break
        } while true

        var throwsArray = [Int: Double]()
        for j in 1...3 {
            print("Podaj wynik rzutu \(j):")
            guard let result = readLine(), let throwResult = Double(result) else {
                print("Nieprawidłowy wynik rzutu.")
                return
            }
            throwsArray[j] = throwResult
        }
        athletes[id] = JavelinThrow(id: id, throwsArray: throwsArray)
    }

    // Polecenie 3. Wyświetl zawodnika, który uzyskał największą średnią swoich rzutów.
    var maxAverage = 0.0
    var maxAthlete: JavelinThrow?

    for (_, athlete) in athletes {
        let average = athlete.average()
        if average > maxAverage {
            maxAverage = average
            maxAthlete = athlete
        }
    }
    if let maxAthlete = maxAthlete {
        print("Największa średnia: \(maxAverage) dla zawodnika id: \(maxAthlete.id)")
    }

    // Polecenie 4. Usuń zawodnika, który uzyskał najmniejszą średnią swoich rzutów.
    var minAverage = 1000000000000.0
    var minAthleteID: String?

    for (id, athlete) in athletes {
        let average = athlete.average()
        if average < minAverage {
            minAverage = average
            minAthleteID = id
        }
    }
    if let minAthleteID = minAthleteID {
        athletes.removeValue(forKey: minAthleteID)
        print("Usunięto zawodnika z najmniejszą średnią rzutów z id: \(minAthleteID)")
    }

	print("Zawodnicy:")
	for (_, athlete) in athletes {
		print("Zawodnik \(athlete.id):")
		for (throwNumber, throwResult) in athlete.throwsArray {
			print("Rzut \(throwNumber): \(throwResult)")
		}
	}
}
// zadanie9_2()

// Zadanie 9.3.
// Polecenie 1. Napisz program konsolowy, który zdefiniuje zbiór samochody składającą z
// modeli samochodów.
// Polecenie 2. Wprowadź nazwy dla 2-3 samochodów.
// Polecenie 3. Wyświetl wszystkie elementy zbioru.
// Polecenie 4. Wczytaj model samochodu od użytkownika i usuń go ze zbioru. Należy
// sprawdzić, czy element taki istnieje w zbiorze.
func zadanie9_3() {
    // Polecenie 1. Zdefiniuj zbiór samochody składającą z modeli samochodów.
    var carModels: Set<String> = []

    // Polecenie 2. Wprowadź nazwy dla 2-3 samochodów.
    print("Podaj liczbę samochodów (2-3):")
    guard let input = readLine(), let carCount = Int(input), carCount >= 2, carCount <= 3 else {
        print("Nieprawidłowa liczba samochodów.")
        return
    }

    for i in 1...carCount {
        print("Podaj nazwę samochodu \(i):")
        guard let carModel = readLine(), !carModel.isEmpty else {
            print("Nieprawidłowa nazwa samochodu.")
            return
        }
        carModels.insert(carModel)
    }

    // Polecenie 3. Wyświetl wszystkie elementy zbioru.
    print("Modele samochodów w zbiorze:")
    for carModel in carModels {
        print(carModel)
    }

    // Polecenie 4. Wczytaj model samochodu od użytkownika i usuń go ze zbioru.
    print("Podaj model samochodu do usunięcia:")
    guard let modelToRemove = readLine(), !modelToRemove.isEmpty else {
        print("Nieprawidłowy model samochodu.")
        return
    }

    if carModels.contains(modelToRemove) {
        carModels.remove(modelToRemove)
        print("Usunięto model samochodu: \(modelToRemove)")
    } else {
        print("Model samochodu nie istnieje w zbiorze.")
    }

    // Wyświetl pozostałe elementy zbioru.
    print("Pozostałe modele samochodów w zbiorze:")
    for carModel in carModels {
        print(carModel)
    }
}
zadanie9_3()