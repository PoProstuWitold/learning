import Foundation

// 1. Na PESEL: tablica PESEL i informacje na podstawie numeru
func peselInfo() {
    let peselNumbers = ["99020312345", "88122412345", "02213054321"] // Przykładowa tablica numerów PESEL
    
    print("Dostępne indeksy PESEL (0-\(peselNumbers.count - 1)):")
    guard let indexInput = readLine(), let index = Int(indexInput), index >= 0 && index < peselNumbers.count else {
        print("Nieprawidłowy indeks.")
        return
    }
    
    let pesel = peselNumbers[index]
    guard pesel.count == 11 else {
        print("PESEL nieprawidłowy.")
        return
    }
    
    let yearStartIndex = pesel.startIndex
    let yearEndIndex = pesel.index(yearStartIndex, offsetBy: 2)
    let monthStartIndex = yearEndIndex
    let monthEndIndex = pesel.index(monthStartIndex, offsetBy: 2)
    let dayStartIndex = monthEndIndex
    let dayEndIndex = pesel.index(dayStartIndex, offsetBy: 2)
    
	let year = Int(pesel[yearStartIndex..<yearEndIndex])!
	let month = Int(pesel[monthStartIndex..<monthEndIndex])!
	let day = Int(pesel[dayStartIndex..<dayEndIndex])!
    
    let gender = Int(String(pesel[pesel.index(pesel.startIndex, offsetBy: 9)]))! % 2 == 0 ? "Kobieta" : "Mężczyzna"
    let birthYear = year + (month > 20 ? 2000 : 1900)
    let birthMonth = month % 20
    
    print("PESEL: \(pesel)")
    print("Płeć: \(gender), Rok urodzenia: \(birthYear), Miesiąc urodzenia: \(birthMonth), Dzień urodzenia: \(day)")
}
// peselInfo()

// 2. Liczba losowa z 3 miejscami po przecinku (1 do 3)
func randomDecimal() {
    let randomDecimal = Double.random(in: 1.0...3.0)
	let randomDecimalStr = String(format: "%.3f", randomDecimal)
    print("Losowa liczba od 1 do 3 z trzema miejscami po przecinku: \(randomDecimalStr)")
}
// randomDecimal()

// 3. Losowanie N liczb i liczenie średniej
func averageRandomNumbers() {
    print("Podaj liczbę losowych liczb do wygenerowania:")
    guard let input = readLine(), let count = Int(input), count > 0 else {
        print("Nieprawidłowa liczba.")
        return
    }
    
    var numbers = [Int]()
    for _ in 0..<count {
        let number = Int.random(in: 1...100)
        numbers.append(number)
    }
    let average = Double(numbers.reduce(0, +)) / Double(count)
    print("Wylosowane liczby: \(numbers)")
    print("Średnia: \(String(format: "%.2f", average))")
}
// averageRandomNumbers()

// 4. Ciąg Fibonacciego
func fibonacci() {
    print("Podaj liczbę elementów ciągu Fibonacciego:")
    guard let input = readLine(), let count = Int(input), count > 0 else {
        print("Nieprawidłowa liczba elementów.")
        return
    }
    
    var fibonacci = [0, 1]
    for i in 2..<count {
        fibonacci.append(fibonacci[i - 1] + fibonacci[i - 2])
    }
    print("Ciąg Fibonacciego do \(count) elementów: \(fibonacci.prefix(count))")
}
// maks: 93, później crash
// fibonacci()

// 4B. Ciąg Fibonacciego do liczby
func fibonacciUpToLimit() {
    print("Podaj maksymalną wartość dla ciągu Fibonacciego:")
    guard let input = readLine(), let maxValue = Int(input), maxValue > 0 else {
        print("Nieprawidłowa liczba.")
        return
    }
    
    var fibonacci = [0, 1]
    while true {
        let next = fibonacci[fibonacci.count - 1] + fibonacci[fibonacci.count - 2]
        if next > maxValue { break }
        fibonacci.append(next)
    }
    print("Ciąg Fibonacciego do wartości \(maxValue): \(fibonacci)")
}
// maks: 7540113804746346428, później crash
// fibonacciUpToLimit()

// 5. Sprawdzanie, czy zdanie jest palingramem
func palingramCheck() {
    print("Podaj zdanie do sprawdzenia:")
    guard let input = readLine(), !input.isEmpty else {
        print("Nieprawidłowe zdanie.")
        return
    }
    
    let cleanedInput = input.lowercased().replacingOccurrences(of: " ", with: "")
    let reversedInput = String(cleanedInput.reversed())
    if cleanedInput == reversedInput {
        print("Podane zdanie jest palingramem.")
    } else {
        print("Podane zdanie nie jest palingramem.")
    }
}
// palingramCheck()

// 6. Odwracanie tablicy
func reverseArray() {
    let numbers = [1, 2, 3, 4, 5]
    let reversedNumbers = Array(numbers.reversed())
    print("Oryginalna tablica: \(numbers)")
    print("Odwrócona tablica: \(reversedNumbers)")
}
// reverseArray()

// 7. Sprawdzanie, czy litera jest na początku lub końcu słowa
func checkFirstOrLastLetter() {
    print("Podaj słowo:")
    guard let word = readLine(), !word.isEmpty else {
        print("Nieprawidłowe słowo.")
        return
    }
    
    print("Podaj literę do sprawdzenia:")
    guard let letterInput = readLine(), letterInput.count == 1, let letter = letterInput.first else {
        print("Nieprawidłowa litera.")
        return
    }
    
    if word.first == letter {
        print("Litera '\(letter)' znajduje się na początku słowa '\(word)'.")
    } else {
        print("Litera '\(letter)' nie jest na początku słowa '\(word)'.")
    }

	if word.last == letter {
		print("Litera '\(letter)' znajduje się na końcu słowa '\(word)'.")
	} else {
		print("Litera '\(letter)' nie jest na końcu słowa '\(word)'.")
	}
}
checkFirstOrLastLetter()