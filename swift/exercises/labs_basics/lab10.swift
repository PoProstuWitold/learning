import Foundation

// Zadanie 10.1.
// Polecenie 1. Napisz program konsolowy, który wygeneruje 3 liczby losowe.
// Polecenie 2. Napisz funkcję, którą zwróci największą liczbę z trzech podanych. Użyj
// utworzonej funkcji do wyświetlenia wyniku.
// Polecenie 3. Napisz funkcję, którą zwróci najmniejszą liczbę z trzech podanych. Użyj
// utworzonej funkcji do wyświetlenia wyniku.
// Polecenie 4. Napisz funkcję, którą zwróci jednocześnie najmniejszą oraz największą liczbę
// z trzech podanych. Użyj utworzonej funkcji do wyświetlenia wyniku.
func zadanie10_1() {
	// 1.
	func generateRandomNumbers() -> (Int, Int, Int) {
		let random1 = Int.random(in: 1...100)
		let random2 = Int.random(in: 1...100)
		let random3 = Int.random(in: 1...100)
		return (random1, random2, random3)
	}

	// 2.
	func findMax(of numbers: (Int, Int, Int)) -> Int {
		return max(numbers.0, numbers.1, numbers.2)
	}

	// 3.
	func findMin(of numbers: (Int, Int, Int)) -> Int {
		return min(numbers.0, numbers.1, numbers.2)
	}

	// 4
	func findMinMax(of numbers: (Int, Int, Int)) -> (Int, Int) {
		return (findMin(of: numbers), findMax(of: numbers))
	}

	let numbers = generateRandomNumbers()
	print("Wygenerowane liczby: \(numbers)")
	let minMax = findMinMax(of: numbers)
	print("Najmniejsza liczba: \(minMax.0), największa liczba: \(minMax.1)")
}
// zadanie10_1()

// Zadanie 10.3. - ZAMIAST KWADRATU OKRĄG
// Polecenie 1. Napisz program konsolowy, który wczyta współrzędne dwóch punktów układu
// współrzędnych (punkt układu jako struktura). Należy napisać funkcję wczytującą współrzędne i je zwracające.
// Polecenie 2. Napisz funkcję obliczającą odległość między wczytanymi punktami.
// Polecenie 3. Napisz funkcję zwracającą numer ćwiartki, w której leży dany punkt.
// Polecenie 4. Podaj promień jako parametr (okrąg rysowany od współrzędnych [0,0]), 
// napisz funkcję, która sprawdzi, czy dany punkt leży wewnątrz okręgu, na obwodzie okręgu
// czy poza okręgiem
// Polecenie 5. Przetestuj utworzone funkcje.
func zadanie10_3() {
	// 1.
	struct Point {
		var x: Double
		var y: Double
	}
	func readPoint() -> Point {
		print("Podaj współrzędną x:")
		guard let input = readLine(), let x = Double(input) else {
			print("Nieprawidłowa współrzędna x.")
			exit(1)
		}
		print("Podaj współrzędną y:")
		guard let input = readLine(), let y = Double(input) else {
			print("Nieprawidłowa współrzędna x.")
			exit(1)
		}
		return Point(x: x, y: y)
	}

	// 2.
	func calculateDistance(from point1: Point, to point2: Point) -> Double {
		return sqrt(pow(point2.x - point1.x, 2) + pow(point2.y - point1.y, 2))
	}

	// 3.
	func determineQuarter(of point: Point) -> Int {
		if point.x > 0 && point.y > 0 {
			return 1
		} else if point.x < 0 && point.y > 0 {
			return 2
		} else if point.x < 0 && point.y < 0 {
			return 3
		} else if point.x > 0 && point.y < 0 {
			return 4
		} else {
			return 0
		}
	}

	// 4.
	func determineCirclePosition(of point: Point, withRadius radius: Double) -> String {
		let distance = calculateDistance(from: Point(x: 0, y: 0), to: point)
		if distance < radius {
			return "Punkt leży wewnątrz okręgu."
		} else if distance == radius {
			return "Punkt leży na obwodzie okręgu."
		} else {
			return "Punkt leży poza okręgiem."
		}
	}

	// 5.
	let point1 = readPoint()
	let point2 = readPoint()
	print("Odległość między punktami: \(calculateDistance(from: point1, to: point2))")
	print("Punkt 1 leży w ćwiartce: \(determineQuarter(of: point1))")
	print("Punkt 2 leży w ćwiartce: \(determineQuarter(of: point2))")

	print("Podaj promień okręgu:")
	guard let input = readLine(), let radius = Double(input) else {
		print("Nieprawidłowy promień okręgu.")
		return
	}

	print("Punkt 1: \(determineCirclePosition(of: point1, withRadius: radius))")
	print("Punkt 2: \(determineCirclePosition(of: point2, withRadius: radius))")
}
// zadanie10_3()

// Zadanie 10.4.
// Polecenie 1. Napisz program konsolowy, który wczyta liczbę elementów tablicy oraz jej
// elementy całkowite, a następnie wyznaczy największy element, najmniejszy element oraz
// średnią arytmetyczną wszystkich elementów.
// Polecenie 2. Napisz funkcję, która wczyta elementy do tablicy i zwróci tą tablicę. Funkcja
// powinna posiadać parametr mówiący o liczbie elementów tablicy.
// Polecenie 3. Napisz funkcję, która wyświetli wszystkie elementy tablicy.
// Polecenie 4. Napisz funkcję, która wyznaczy i zwróci najmniejszy element tablicy oraz
// indeks, na którym się znajduje.
// Polecenie 5. Napisz funkcję, która wyznaczy i zwróci największy element tablicy oraz indeks,
// na którym się znajduje.
// Polecenie 6. Napisz funkcję, która zamieni miejscami element największy z najmniejszym.
// Polecenie 7. Napisz funkcję, która wyznaczy i zwróci średnią arytmetyczną wszystkich
// elementów tablicy.
// Polecenie 8. Przetestuj utworzone funkcje.
func zadanie10_4() {
	// 1.
    print("Podaj liczbę elementów tablicy:")
    guard let input = readLine(), let size = Int(input), size > 0 else {
        print("Nieprawidłowa liczba elementów.")
        return
    }
	guard size < 6 else {
		print("Hamuj sie. Mniej niz 6 elementow.")
		return
	}

	// 2.
    func readArray(ofSize size: Int) -> [Int] {
        var array = [Int]()
        for i in 1...size {
            print("Podaj element \(i):")
            guard let input = readLine(), let number = Int(input) else {
                print("Nieprawidłowa wartość, spróbuj ponownie.")
                return readArray(ofSize: size)
            }
            array.append(number)
        }
        return array
    }

	// 3.
	func displayArray(_ array: [Int]) {
        print("Elementy tablicy: \(array)")
    }

	// 4.
	func findMinElement(in array: [Int]) -> (value: Int, index: Int) {
        guard let minValue = array.min(), let index = array.firstIndex(of: minValue) else {
            exit(1)
        }
        return (value: minValue, index: index)
    }

    // 5.
    func findMaxElement(in array: [Int]) -> (value: Int, index: Int) {
        guard let maxValue = array.max(), let index = array.firstIndex(of: maxValue) else {
            exit(1)
        }
        return (value: maxValue, index: index)
    }

	// 6.
	// https://stackoverflow.com/questions/42540507/how-to-fix-can-not-use-mutating-member-on-immutable-value
	func swapMinMax(_ array: inout [Int]) {
		let min = findMinElement(in: array)
		let max = findMaxElement(in: array)
		array.swapAt(min.index, max.index)
	}

	// 7.
	func arithmeticMean(of array: [Int]) -> Double {
		let sum = array.reduce(0, +)
		return Double(sum) / Double(array.count)
	}

	// 8.
	var array = readArray(ofSize: size)
	displayArray(array)
	let min = findMinElement(in: array)
	let max = findMaxElement(in: array)
	print("Najmniejszy element: \(min.value), indeks: \(min.index)")
	print("Największy element: \(max.value), indeks: \(max.index)")
	print("Średnia arytmetyczna: \(arithmeticMean(of: array))")
	swapMinMax(&array)
	displayArray(array)
}
zadanie10_4()