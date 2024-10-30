import Foundation
// 3, 4, 6
// Zadanie 5.1 - Wyświetlenie kolejnych liczb
func zadanie5_1() {
	for i in 1...25 {
		print(i)
	}
	print("\n")

	var j = 1
	while j <= 25 {
		print(j)
		j += 1
	}
	print("\n")

	var k = 1
	repeat {
		print(k)
		k += 1
	} while k <= 25
	print("\n")
}
// zadanie5_1()

// Zadanie 5.2 - Wyświetlenie liczb
func zadanie5_2() {
	for i in stride(from: 1, through: 25, by: 3) {
		print(i)
	}
	print("\n")

	var j = 1
	while j <= 25 {
		print(j)
		j += 3
	}
	print("\n")

	var k = 1
	repeat {
		print(k)
		k += 3
	} while k <= 25

}
// zadanie5_2()

// Zadanie 5.3 - Ciąg Fibonacciego
func fibonacciSequence() {
	let maxValue = 922337203685477580
	// let maxValue = Int.max // nie działa
	print("Maksymalna dopuszczalna wartość: \(maxValue)")

    print("Podaj maksymalną wartość dla ciągu Fibonacciego:")
    guard let input = readLine(), let limit = Int(input), limit > 0 else {
        print("Błędne dane. Podaj dodatnią liczbę całkowitą.")
        return
    }
    
    var a = 0
    var b = 1
    while a <= limit {
        print(a)
        let temp = a
        a = b
        b = temp + b
    }
}
// fibonacciSequence()


// Zadanie 5.4 - Liczba pierwsza
func isPrimeNumber() {
    print("Podaj liczbę do sprawdzenia:")
    guard let input = readLine(), let number = Int(input), number > 1 else {
        print("Błędne dane. Podaj liczbę całkowitą większą od 1.")
        return
    }
    
    var isPrime = true
    if number < 2 {
        isPrime = false
    } else {
		// 2 .. sqrt(47)
		// 2 .. sqrt(number) + 1, bo bez tego nie działa rzutowane na liczbę całkowitą
        for i in 2..<Int(sqrt(Double(number))) + 1 {
            if number % i == 0 {
                isPrime = false
                break
            }
        }
    }
    
    if isPrime {
        print("Liczba \(number) jest pierwsza.")
    } else {
        print("Liczba \(number) nie jest pierwsza.")
    }
}
// isPrimeNumber()


// Zadanie 5.5 - Suma cyfr
func averageOfDigits() {
    var number: Int?

    while true {
        print("Podaj liczbę co najmniej trzycyfrową:")
        if let input = readLine(), let intInput = Int(input), intInput >= 100 {
            number = intInput
            break
        } else {
            print("Błędne dane. Upewnij się, że podałeś liczbę co najmniej trzycyfrową.")
        }
    }

    guard let number = number else { return }

    let digits = String(number).compactMap { $0.wholeNumberValue }
    let sumOfDigits = digits.reduce(0, +)
    let average = Double(sumOfDigits) / Double(digits.count)

    print("Średnia arytmetyczna cyfr liczby \(number) wynosi \(average).")
}
// averageOfDigits()


// Zadanie 5.6 - Palindrom
func isPalindrome() {
    print("Podaj ciąg znaków:")
    guard let input = readLine() else {
        print("Błąd wczytywania danych.")
        return
    }

    let cleanedInput = input.lowercased().filter { $0.isLetter || $0.isNumber }
    let reversedInput = String(cleanedInput.reversed())

    if cleanedInput == reversedInput {
        print("Ciąg '\(input)' jest palindromem.")
    } else {
        print("Ciąg '\(input)' nie jest palindromem.")
    }
}
isPalindrome()

// Zadanie 5.7 - Popraw program
func zadanie5_7() {
	var sum = 0
	var i = 0
	while i <= 7 {
		if i % 2 == 0 {
			i += 1 // dodanie tej linii
			continue
		}
		print(i)
		sum += i
		i += 1
	}
	print("Suma elementów wynosi \(sum)")
}
// zadanie5_7()