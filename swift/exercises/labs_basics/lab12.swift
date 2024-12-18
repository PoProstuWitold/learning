import Foundation

// Zadanie 12.1.
// Polecenie 1. Utwórz protokół LiczbaZepolona, która zawiera dwie właściwości: re (część
// rzeczywistą liczby) oraz im (część urojoną liczby).
// Polecenie 2. Utwórz klasę OperacjeNaLiczbachZespolonych, która zaimplementuje
// dodawanie dwóch liczb, odejmowanie dwóch liczb oraz wyświetlanie liczby zespolonej.
// Klasa musi adoptować zdefiniowany protokół.

// 1. Definicja protokołu LiczbaZespolona
protocol ComplexNumber {
    var re: Double { get set } // rzeczywista
    var im: Double { get set } // urojona
}

// 2. Klasa implementująca protokół ComplexNumber
class OperationsOnComplexNumbers: ComplexNumber {
    var re: Double
    var im: Double

    init?(re: Double, im: Double) {
        guard re.isFinite, im.isFinite else {
            print("Części liczby zespolonej muszą być liczbami skończonymi.")
            return nil
        }
        self.re = re
        self.im = im
    }

    func add(_ other: OperationsOnComplexNumbers) -> OperationsOnComplexNumbers? {
        guard let result = OperationsOnComplexNumbers(
			re: self.re + other.re, im: self.im + other.im
		) else {
            print("Błąd podczas dodawania liczb zespolonych.")
            return nil
        }
        return result
    }

    func subtract(_ other: OperationsOnComplexNumbers) -> OperationsOnComplexNumbers? {
        guard let result = OperationsOnComplexNumbers(
			re: self.re - other.re, im: self.im - other.im
		) else {
            print("Błąd podczas odejmowania liczb zespolonych.")
            return nil
        }
        return result
    }

    func display() {
        let sign = im >= 0 ? "+" : ""
        print(String(format: "Liczba zespolona: %.2f \(sign) %.2fi", re, im))
    }
}

func zadanie12_1() {
    // 3. Testowanie funkcji klasy

    print("Podaj część rzeczywistą pierwszej liczby zespolonej:")
    guard let re1Input = readLine(), let re1 = Double(re1Input) else {
        print("Nieprawidłowa część rzeczywista.")
        return
    }

    print("Podaj część urojoną pierwszej liczby zespolonej:")
    guard let im1Input = readLine(), let im1 = Double(im1Input) else {
        print("Nieprawidłowa część urojona.")
        return
    }

    guard let complex1 = OperationsOnComplexNumbers(re: re1, im: im1) else {
        print("Nie udało się utworzyć pierwszej liczby zespolonej.")
        return
    }

    print("Podaj część rzeczywistą drugiej liczby zespolonej:")
    guard let re2Input = readLine(), let re2 = Double(re2Input) else {
        print("Nieprawidłowa część rzeczywista.")
        return
    }

    print("Podaj część urojoną drugiej liczby zespolonej:")
    guard let im2Input = readLine(), let im2 = Double(im2Input) else {
        print("Nieprawidłowa część urojona.")
        return
    }

    guard let complex2 = OperationsOnComplexNumbers(
		re: re2, im: im2
	) else {
        print("Nie udało się utworzyć drugiej liczby zespolonej.")
        return
    }

    print("Pierwsza liczba zespolona:")
    complex1.display()

    print("Druga liczba zespolona:")
    complex2.display()

    if let sum = complex1.add(complex2) {
        print("Suma liczb zespolonych:")
        sum.display()
    }

    if let difference = complex1.subtract(complex2) {
        print("Różnica liczb zespolonych:")
        difference.display()
    }
}

// Tworzenie liczby zespolonej (pierwszej liczby):
//     Część rzeczywista: 3.5
//     Część urojona: 4.2

// Tworzenie liczby zespolonej (drugiej liczby):
//     Część rzeczywista: -2.1
//     Część urojona: 1.8

// Oczekiwane wyniki po operacjach:
//     Dodawanie: (3.5 - 2.1) + (4.2 + 1.8)i = 1.4 + 6.0i
//     Odejmowanie: (3.5 - (-2.1)) + (4.2 - 1.8)i = 5.6 + 2.4i
zadanie12_1()

// Zadanie 12.3.
// Polecenie 1. Zdefiniuj typ wyliczeniowy do obsługi błędów dotyczących: dzielenia przez 0
// oraz obliczenie pierwiastka z liczby niedodatniej.
// Polecenie 2. Utwórz funkcję, która wywoła odpowiednie błędy.
// Polecenie 3. Obsłuż błędy za pomocą instrukcji do-catch.
// Polecenie 4. Utwórz program składający wykonujący operację dzielenia dwóch liczb
// całkowitych oraz pierwiastkowania.
func zadanie12_3() {
    // 1. Typ wyliczeniowy do obsługi błędów
    enum MathError: Error {
        case divisionByZero
        case negativeSquareRoot
    }

    // 2. Funkcja, która wywołuje odpowiednie błędy
    func performDivision(_ a: Double, _ b: Double) throws -> Double {
        guard b != 0 else {
            throw MathError.divisionByZero
        }
        return a / b
    }

    func performSquareRoot(_ number: Double) throws -> Double {
        guard number >= 0 else {
            throw MathError.negativeSquareRoot
        }
        return sqrt(number)
    }

    // 3. Obsługa błędów za pomocą instrukcji do-catch
    print("Podaj dwie liczby do podzielenia:")
    guard let input1 = readLine(), let a = Double(input1),
          let input2 = readLine(), let b = Double(input2) else {
        print("Nieprawidłowe dane wejściowe.")
        return
    }

    do {
        let result = try performDivision(a, b)
        print(String(format: "Wynik dzielenia %.2f przez %.2f wynosi: %.2f", a, b, result))
    } catch MathError.divisionByZero {
        print("Błąd: Próba dzielenia przez 0.")
    } catch {
        print("Nieznany błąd podczas dzielenia.")
    }

    print("Podaj liczbę do obliczenia pierwiastka:")
    guard let input3 = readLine(), let number = Double(input3) else {
        print("Nieprawidłowe dane wejściowe.")
        return
    }

    do {
        let result = try performSquareRoot(number)
        print(String(format: "Pierwiastek z %.2f wynosi: %.2f", number, result))
    } catch MathError.negativeSquareRoot {
        print("Błąd: Próba obliczenia pierwiastka z liczby ujemnej.")
    } catch {
        print("Nieznany błąd podczas obliczania pierwiastka.")
    }
}
// zadanie12_3()

// Zadanie 12.4.
// Polecenie 1. Zdefiniuj typ wyliczeniowy do obsługi błędów podczas wypłacania pieniędzy z
// bankomatu: niewystarczające środki na koncie, brak kwoty w bankomacie, przekroczenie
// kwoty dziennego limitu, brak możliwości wypłacenia kwoty (brak nominałów), inny błąd (np.
// błędna kwota).
// Polecenie 2. Utwórz funkcję, która wywoła odpowiednie błędy.
// Polecenie 3. Obsłuż błędy za pomocą instrukcji do-catch.
// Polecenie 4. Utwórz program, który wczyta od użytkownika kwotę do wypłaty w bankomacie
// oraz wyświetli informacje o poprawnie wykonanej operacji lub o błędzie, który wystąpił.
// Kwota w bankomacie oraz nominały można zdefiniować w programie jako stałe.
func zadanie12_4() {
    // 1. Typ wyliczeniowy do obsługi błędów
    enum ATMError: Error {
        case insufficientFunds // klient nie ma kasy
        case insufficientATMFunds // bankomat nie ma kasy
        case dailyLimitExceeded // przekroczono dzienny limit
        case invalidDenomination // brak możliwości wypłaty w posiadanych przez bankomat nominałach
        case invalidAmount // nieprawidłowa kwota
    }

    // 2. Funkcja obsługująca wypłatę z bankomatu
    func withdraw(
		amount: Int, 
		accountBalance: inout Int, 
		atmBalance: inout Int, 
		dailyLimit: inout Int, 
		denominations: [Int]
	) throws -> [Int: Int] {
        guard amount > 0 else {
            throw ATMError.invalidAmount
        }
        guard amount % denominations.min()! == 0 else {
            throw ATMError.invalidDenomination
        }
        guard amount <= accountBalance else {
            throw ATMError.insufficientFunds
        }
        guard amount <= atmBalance else {
            throw ATMError.insufficientATMFunds
        }
        guard amount <= dailyLimit else {
            throw ATMError.dailyLimitExceeded
        }

		// algorytm obliczający liczbę nominałów
		var remainingAmount = amount // kwota do wypłaty, która będzie redukowana w trakcie algorytmu
		var notesToDispense: [Int: Int] = [:] // słownik, który przechowuje ilość banknotów dla każdego nominału

		// lista dostępnych nominałów posortowana malejąco (np. [100, 50, 20, 10])
		for denomination in denominations.sorted(by: >) {
			let count = remainingAmount / denomination // ilość banknotów danego nominału, którą możemy wypłacić
			if count > 0 { // jeśli dla tego nominału możemy wypłacić co najmniej jeden banknot
				notesToDispense[denomination] = count // dodajemy liczbę banknotów do słownika
				remainingAmount -= count * denomination // redukujemy pozostałą kwotę o wartość wypłaconych banknotów
			}
		}

        if remainingAmount != 0 {
            throw ATMError.invalidDenomination
        }

        // Aktualizacja stanu konta, bankomatu i limitu
        accountBalance -= amount
        atmBalance -= amount
        dailyLimit -= amount

        return notesToDispense
    }

    // 3. Dane bankomatu i klienta
    var accountBalance = 10000
    var atmBalance = 2000
    var dailyLimit = 2500
    let denominations = [100, 50, 20, 10]

    // 4. Interakcja z użytkownikiem
    print("Dostępne nominały: \(denominations.map { "\($0) PLN" }.joined(separator: ", "))")
    print("Podaj kwotę do wypłaty:")
    guard let input = readLine(), let amount = Int(input) else {
        print("Kwota musi być liczbą całkowitą")
        return
    }

    do {
        let notes = try withdraw(
			amount: amount, 
			accountBalance: &accountBalance, 
			atmBalance: &atmBalance, 
			dailyLimit: &dailyLimit, 
			denominations: denominations
		)

        print("Wypłata zakończona sukcesem. Otrzymane nominały:")
        for (denomination, count) in notes {
            print("\(count) x \(denomination) PLN")
        }

        print("Pozostały stan konta: \(accountBalance) PLN")
        print("Pozostały limit dzienny: \(dailyLimit) PLN")
        print("Pozostała kwota w bankomacie: \(atmBalance) PLN")
    } catch ATMError.insufficientFunds {
        print("Błąd: Niewystarczające środki na koncie.")
    } catch ATMError.insufficientATMFunds {
        print("Błąd: Niewystarczająca kwota w bankomacie.")
    } catch ATMError.dailyLimitExceeded {
        print("Błąd: Przekroczono dzienny limit wypłat.")
    } catch ATMError.invalidDenomination {
        print("Błąd: Bankomat nie może wypłacić podanej kwoty.")
    } catch ATMError.invalidAmount {
        print("Błąd: Nieprawidłowa kwota do wypłaty.")
    } catch {
        print("Nieznany błąd.")
    }
}
// zadanie12_4()