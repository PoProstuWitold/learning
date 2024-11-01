import Foundation

// Zadanie 6.1
func zadanie6_1() {
	// poprawka: 
	// let zamiast var, bo tab nie jest modyfikowana
	// repeating: 1 zamiast repeating: 1.0, bo nie zgadza się typ (double zamiast int)
    let tab: [Int] = Array(repeating: 1, count: 12)
	for i in tab {
		print(i)
	}
}
// zadanie6_1()

// Zadanie 6.2
func zadanie6_2() {
	let errorMessage = "Nieprawidłowa liczba całkowita"
    var tab: [Int] = Array(repeating: 0, count: 10) // Tablica domyślnie wypełniona zerami
    
    print("Podaj liczbę całkowitą dla indeksu 0:")
    guard let input0 = readLine(), let number0 = Int(input0) else {
        print(errorMessage)
        return
    }
    tab[0] = number0
    
    let randomIndex = Int.random(in: 0..<10)
    print("Podaj liczbę całkowitą dla indeksu \(randomIndex):")
    guard let inputRand = readLine(), let numberRand = Int(inputRand) else {
        print(errorMessage)
        return
    }
    tab[randomIndex] = numberRand
    
    print("Tablica po modyfikacjach: \(tab)")
}

// zadanie6_2()

// Zadanie 6.3
func zadanie6_3() {
    print("Podaj liczbę elementów tablicy:")
    guard let input = readLine(), let count = Int(input), count > 0 else {
        print("Nieprawidłowa liczba elementów.")
        return
    }

    var tab = [Int]()
    for i in 0..<count {
        print("Podaj element \(i):")
        guard let input = readLine(), let number = Int(input) else {
            print("Nieprawidłowa wartość. Przerwanie wprowadzania danych.")
            return
        }
        tab.append(number)
    }

    print("Podaj liczbę do sprawdzenia:")
    guard let input = readLine(), let number = Int(input) else {
        print("Nieprawidłowa liczba do sprawdzenia.")
        return
    }

    if number == tab.first {
        print("Liczba \(number) jest pierwszym elementem.")
    } else {
		print("Liczba \(number) nie jest pierwszym elementem.")
	}

    if number == tab.last {
        print("Liczba \(number) jest ostatnim elementem.")
    } else {
		print("Liczba \(number) nie jest ostatnim elementem.")
	}
}
// zadanie6_3()

// Zadanie 6.4
func zadanie6_4() {
    print("Podaj liczbę elementów tablicy:")
    guard let input = readLine(), let count = Int(input), count > 0 else {
        print("Nieprawidłowa liczba elementów.")
        return
    }

    var tab1 = [Int]()
    var tab2 = [Int]()
    
    for i in 0..<count {
        print("Tablica 1, element \(i):")
        guard let input = readLine(), let number = Int(input) else {
            print("Nieprawidłowy element tablicy.")
            return
        }
        tab1.append(number)
    }
    
    for i in 0..<count {
        print("Tablica 2, element \(i):")
        guard let input = readLine(), let number = Int(input) else {
            print("Nieprawidłowy element tablicy.")
            return
        }
        tab2.append(number)
    }

	// == wartości
	// === referencje
    if tab1 == tab2 {
        print("Tablice są identyczne.")
    } else {
        print("Tablice różnią się.")
    }
}
// zadanie6_4()

// Zadanie 6.5
func zadanie6_5() {
    print("Podaj liczbę elementów tablicy:")
    guard let input = readLine(), let count = Int(input), count > 0 else {
        print("Nieprawidłowa liczba elementów.")
        return
    }

    var tab = [Double]()
    for i in 0..<count {
        print("Podaj element \(i):")
        guard let input = readLine(), let number = Double(input) else {
            print("Nieprawidłowy element.")
            return
        }
        tab.append(number)
    }
	
	// tablica nie jest pusta, możemy bezpiecznie użyć metod min() i max()
    let minElement = tab.min()!
	let maxElement = tab.max()!
    
    print("Najmniejsza liczba: \(minElement), największa liczba: \(maxElement)")
}
// zadanie6_5()

// Zadanie 6.6
func zadanie6_6() {
    print("Podaj liczbę elementów tablicy:")
    
    guard let input = readLine(), let count = Int(input), count > 0 else {
        print("Nieprawidłowa liczba elementów.")
        return
    }

    var tab = [Int]()
    
    for i in 0..<count {
        print("Podaj element \(i):")
        
        guard let input = readLine(), let number = Int(input) else {
            print("Nieprawidłowy element.")
            return
        }
        
        tab.append(number)
    }

    var longestIncreasing = [Int]() // Zmienna przechowująca najdłuższy podciąg rosnący
    var currentIncreasing = [Int]() // Zmienna przechowująca aktualny podciąg rosnący
    
    // Przechodzimy przez elementy tablicy i budujemy najdłuższy rosnący podciąg
    for number in tab {
        // Sprawdzamy, czy dodawać element do aktualnego podciągu
        if currentIncreasing.isEmpty || number > currentIncreasing.last! {
            currentIncreasing.append(number)
        } else {
            // Zapisujemy, jeśli bieżący podciąg jest najdłuższy, i zaczynamy nowy
            longestIncreasing = currentIncreasing.count > longestIncreasing.count ? currentIncreasing : longestIncreasing
            currentIncreasing = [number]
        }
    }
    
    // Sprawdzamy końcowy podciąg
    longestIncreasing = currentIncreasing.count > longestIncreasing.count ? currentIncreasing : longestIncreasing

    // Wyświetlamy wynik
    // if longestIncreasing.isEmpty {
    //     print("Brak podciągu rosnącego.")
    // } else {
    //     print("Najdłuższy podciąg rosnący: \(longestIncreasing)")
    // }

	// Zawsze będzie istniał podciąg rosnący, bo zawsze będzie istniał podciąg z jednym elementem
	print("Najdłuższy podciąg rosnący: \(longestIncreasing)")
}
// zadanie6_6()

// Zadanie 6.7
func zadanie6_7() {
    let mac: [[Int]] = [[21, 37, 420], [-21, -37, -420]]
    for i in 0..<mac.count {
        for j in 0..<mac[i].count {
            print("\(mac[i][j])", terminator: " ")
        }
        print()
    }
}
// zadanie6_7()

// Zadanie 6.8
func zadanie6_8() {
    print("Podaj liczbę wierszy macierzy:")
    guard let rowInput = readLine(), let rows = Int(rowInput), rows > 0 else {
        print("Nieprawidłowa liczba wierszy.")
        return
    }

    print("Podaj liczbę kolumn macierzy:")
    guard let colInput = readLine(), let cols = Int(colInput), cols > 0 else {
        print("Nieprawidłowa liczba kolumn.")
        return
    }

    var matrix = [[Int]]()
    for i in 0..<rows {
        var row = [Int]()
        for j in 0..<cols {
            print("Element (\(i), \(j)):")
            guard let input = readLine(), let number = Int(input) else {
                print("Nieprawidłowa wartość. Przerywam wczytywanie macierzy.")
                return
            }
            row.append(number)
        }
        matrix.append(row)
    }

    // Znajdujemy wiersz o największej sumie elementów
    var maxRowSum = Int.min
    var maxRowIndex = -1
    for i in 0..<rows {
        let rowSum = matrix[i].reduce(0, +) // Sumujemy elementy wiersza
        if rowSum > maxRowSum { // Jeśli suma jest większa, aktualizujemy wartości
            maxRowSum = rowSum
            maxRowIndex = i
        }
    }

    // Sprawdzamy i wyświetlamy wynik
    if maxRowIndex != -1 {
        print("Wiersz \(maxRowIndex) ma największą sumę: \(maxRowSum)")
    } else {
        print("Nie znaleziono wiersza z największą sumą.")
    }
}
zadanie6_8()
