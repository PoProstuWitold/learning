import Foundation

// GRUPA A, Witold Zawada

// 1. Wylosuj trzy liczby z przedziału [3,4] z dokładnością do części setnych.
// Wykorzystaj do tego Int.random
// Wyświetl te liczby, oblicz i wyświetl ich średnią arytmetyczną

func zadanie1() {
	// losuje liczbe z przedzialu [300, 400] i dzieli przez 100
	// myslalem tez, zeby uzyc formatowania stringow,
	// ale wtedy trzeba by znowu konwertowac na liczbe
	// wiec uznalem, ze bedzie szybciej w ten sposob
	let a = Double(Int.random(in: 300...400)) / 100
	let b = Double(Int.random(in: 300...400)) / 100
	let c = Double(Int.random(in: 300...400)) / 100
	print(a, b, c)
	// czesci setne
	let result = Double(String(format: "%.2f", (a + b + c) / 3))!
	print("Srednia arytmetyczna: \(result)")
}
// zadanie1()

// 2. Napisz program, w którym wczytasz od użytkownika ciąg znaków oraz pojedynczy znak. Sprawdź i wyświetl ile razy
// podany znak występuje w ciągu. Jeżeli nie występuje ani razu wyświetl stosowny komunikat.
func zadanie2() {
	print("Podaj ciag znakow:")
	guard let string = readLine(), string.count > 0 else {
		print("Nie podano ciagu")
		return
	}

	print("Podaj znak:")
	guard let char = readLine(), char.count == 1 else {
		print("Nie podano znaku")
		return
	}

	let count = string.filter { $0 == Character(char) }.count

	if count == 0 {
		print("Podany znak nie wystepuje w ciagu")
	} else {
		print("Podany znak wystepuje \(count) razy")
	}
}
// zadanie2()

// 3. Napisz program, w którym wczytasz od użytkownika PESEL. Na jego podstawie określ rok urodzenia użytkownika.
// Wyświetl użytkownikowi informację o roku urodzenia.
func zadanie3() {
	print("Podaj PESEL:")
	guard let pesel = readLine(), pesel.count == 11 else {
		print("PESEL ma niepoprawną długość")
		return
	}

	// guard mi z tym nie działał :/
	let isNumberOnly = pesel.allSatisfy { $0.isNumber }
	if !isNumberOnly {
		print("PESEL zawiera nieprawidlowe znaki")
		return
	}
	
	print("Podany PESEL: \(pesel)")
	// (03)|24|2604739
	// (03) - rok
	// |24| - stulecie i miesiac
	// let startIndex = pesel.index(pesel.startIndex, offsetBy: 0)
	let year = pesel.prefix(2)
	// print(year) // 1 i 2
	let century = pesel.prefix(3).suffix(1)
	// print(century) // 3
    // 0 	2 	2 	7 	1 	4, z wikipedii o PESEL'u początek numeru osoby urodzonej w 2002 roku
	switch century {
		case "0", "1":
			print("rok: 19\(year)")
		case "2", "3":
			print("rok: 20\(year)")
		case "4", "5":
			print("rok: 21\(year)")
		case "6", "7":
			print("rok: 22\(year)")
		default:
			print("Nieznane stulecie")
	}
	
	
	// dla osób urodzonych w latach 1900 do 1999 – miesiąc zapisywany jest w sposób naturalny, tzn. dwucyfrowo od 01 do 12
	// dla osób urodzonych w innych latach niż 1900–1999 dodawane są do numeru miesiąca następujące wielkości:

    // dla lat 1800–1899 – 80
    // dla lat 2000–2099 – 20
    // dla lat 2100–2199 – 40
    // dla lat 2200–2299 – 60.
}
// zadanie3()

// 4. Napisz program, w którym sprawdzić czy liczba wpisana przez użykownika jest liczbą pierwszą.
// Wyświetl stosowny komunikat.
func zadanie4() {
	print("Podaj liczbe:")
	guard let number = readLine(), let n = Int(number), n > 0 else {
		print("Podano nieprawidlowa liczbe")
		return
	}

	var isPrime = true

	if n == 1 {
		isPrime = false
		print("Podana liczba NIE jest liczba pierwsza")
		return
	}

	for i in 2..<n {
		if n % i == 0 {
			isPrime = false
			break
		}
	}

	if isPrime {
		print("Podana liczba jest liczba pierwsza")
	} else {
		print("Podana liczba NIE jest liczba pierwsza")
	}
}
// zadanie4()

// 5. Napisz program, w którym wczytasz od użytkownika rozmiar tablicy oraz jej elementy zmiennoprzecinkowe.
// Wyświetl tablicę. Wczytaj od użytkownika indeks, na który wstawisz swój numer indeksu. Wyświetl tablicę.
// Przesuń wszystkie elementy tablicy o 1 indeks w lewo, początkowy element tablicy przesuń na koniec.
// Wyświetl tablicę. Znajdź i wyświetl najmniejszą i największą wartość w tablicy.
func zadanie5() {
	// wczytasz rozmiar tablicy
	print("Podaj rozmiar tablicy:")
	guard let size = readLine(), let n = Int(size), n > 0 else {
		print("Podano nieprawidlowy rozmiar tablicy")
		return
	}
	var array = [Double]()

    // oraz jej elementy zmiennoprzecinkowe
	for i in 0..<n {
		print("Podaj \(i) element tablicy:")
		guard let element = readLine(), let e = Double(element) else {
			print("Podano nieprawidlowy element tablicy")
			return
		}
		array.append(e)
	}

	// wyswietl tablice
	print("Tablica: \(array)")

	// wczytaj od uzytkownika indeks tablicy
	print("Podaj indeks:")
	guard let index = readLine(), let i = Int(index), i >= 0, i < n else {
		print("Podano nieprawidlowy indeks")
		return
	}

	// na ktory wstawisz swoj numer indeksu
	print("Podaj wartosc do wstawienia:")
	guard let input = readLine(), let value = Double(input) else {
		print("Podano nieprawidlowa wartosc")
		return
	}

	// wyswietl tablice
	array.insert(value, at: i)
	print("Tablica po wstawieniu: \(array)")

	// przesun wszystkie elementy tablicy o 1 indeks w lewo,
	// poczatkowy element tablicy przesun na koniec
	let first = array.removeFirst()
	array.append(first)

	// wyswietl tablice
	print("Tablica po przesunieciu: \(array)")

	// znajdz i wyswietl najmniejsza i najwieksza wartosc w tablicy
	let min = array.min()!
	let max = array.max()!
	print("Najmniejsza wartosc: \(min)")
	print("Najwieksza wartosc: \(max)")
}
// zadanie5()

// ZADANIA
// zadanie1()
// zadanie2()
// zadanie3()
zadanie4()
// zadanie5()