// Zadanie 4.1 – Rok przestępny
/*
import Foundation

func czyRokPrzestepny(_ rok: Int) -> Bool {
	// jest podzielny przez 4, ale nie jest podzielny przez 100
    if rok % 4 == 0 && rok % 100 != 0 {
		return true
	}
	// jest podzielny przez 400
	if rok % 400 == 0 {
		return true
	}

    return false
}

print("Podaj rok:")
if let input = readLine(), let rok = Int(input) {
	guard rok >= 0 else {
		// fatalError("Rok musi być liczbą dodatnią.")
		print("Rok musi być liczbą dodatnią.")
		exit(1)
	}

    if czyRokPrzestepny(rok) {
        print("\(rok) jest rokiem przestępnym.")
    } else {
        print("\(rok) nie jest rokiem przestępnym.")
    }
} else {
    print("Rok nie jest liczbą całkowitą.")
}
*/

// Zadanie 4.2 – Wiek
/*
import Foundation

func wiek(zRoku rok: Int) -> Int {
    return (rok - 1) / 100 + 1
}

print("Podaj rok (z zakresu 2-3010):")
if let input = readLine(), let rok = Int(input), rok >= 2 && rok <= 3010 {
    let wiekRoku = wiek(zRoku: rok)
    print("Rok \(rok) - wiek \(wiekRoku)")
} else {
    print("Nieprawidłowy rok.")
}
*/

// Zadanie 4.3 – Stypendium
/*
import Foundation

func obliczStypendium(zeSredniej srednia: Double) -> Int {
    switch srednia {
		case 4.5...5.0:
			return 200
		case 4.0..<4.5:
			return 150
		case 3.0..<4.0:
			return 100
		default:
			return 0
    }
}

print("Podaj średnią:")
guard let input = readLine(), let srednia = Double(input), srednia >= 0.0 && srednia <= 5.0 else {
    print("Nieprawidłowa średnia.")
    exit(1)
}

let stypendium = obliczStypendium(zeSredniej: srednia)
print("Stypendium: \(stypendium) zł")
*/

// Zadanie 4.4 - Kalkulator
/*
import Foundation

print("Podaj dwie liczby:")
if let input1 = readLine(), let liczba1 = Int(input1),
   let input2 = readLine(), let liczba2 = Int(input2) {

    print("Wybierz operację: 1-dodawanie, 2-odejmowanie, 3-mnożenie, 4-dzielenie")
    if let opcja = readLine(), let opcjaNum = Int(opcja) {
        switch opcjaNum {
        case 1:
            print("Wynik dodawania: \(liczba1 + liczba2)")
        case 2:
            print("Wynik odejmowania: \(liczba1 - liczba2)")
        case 3:
            print("Wynik mnożenia: \(liczba1 * liczba2)")
        case 4:
            if liczba2 != 0 {
                print("Wynik dzielenia: \(liczba1 / liczba2)")
            } else {
                print("Błąd: dzielenie przez 0.")
            }
        default:
            print("Nieprawidłowa operacja.")
        }
    }
} else {
    print("Nieprawidłowe liczby.")
}
*/

// Zadanie 4.5 - Województwa Polski
// https://pl.wikipedia.org/wiki/Kody_pocztowe_w_Polsce
import Foundation

func miastoDlaKodu(kod: String) -> String {
    switch kod.prefix(2) {
    case "00"..."04":
        return "Warszawa"
    case "05":
        return "Powiaty wokół Warszawy"
    case "10":
        return "Olsztyn"
    case "15":
        return "Białystok"
    case "20":
        return "Lublin"
    case "25":
        return "Kielce"
    case "30"..."31":
        return "Kraków"
    case "35":
        return "Rzeszów"
    case "40":
        return "Katowice"
    case "45":
        return "Opole"
    case "50"..."54":
        return "Wrocław"
    case "60"..."61":
        return "Poznań"
    case "65":
        return "Zielona Góra"
    case "70"..."71":
        return "Szczecin"
    case "75":
        return "Koszalin"
    case "80":
        return "Gdańsk"
    case "81":
        if kod.hasPrefix("81-7") || kod.hasPrefix("81-8") {
            return "Sopot"
        } else {
            return "Gdynia"
        }
    case "85":
        return "Bydgoszcz"
    case "90"..."94":
        return "Łódź"
    default:
        return "Nieznane miasto"
    }
}

print("Podaj kod pocztowy (XX-XXX):")
if let kod = readLine(), kod.count == 6, kod.contains("-") {
    let miasto = miastoDlaKodu(kod: kod)
    print("Kod \(kod) - Miasto: \(miasto)")
} else {
    print("Nieprawidłowy kod pocztowy.")
}

// Zadanie 4.6 – Znak z klawiatury
/*
import Foundation

func typZnaku(_ znak: Character) -> String {
    switch znak.lowercased() {
    case "a", "e", "i", "o", "u", "y":
        return "samogłoska"
    case "0"..."9":
        return "cyfra"
    case "b"..."z":
        return "spółgłoska"
    default:
        return "inny znak"
    }
}

print("Podaj znak:")
if let input = readLine(), let znak = input.first {
    let wynik = typZnaku(znak)
    print("\(znak) to \(wynik).")
} else {
    print("Nieprawidłowy znak.")
}
*/

// Zadanie 4.7 – Płeć (PESEL)
/*
import Foundation

func plecZPeselu(numerPesel pesel: String) -> String {
    let tylkoCyfry = pesel.allSatisfy { $0.isNumber }

    guard pesel.count == 11, tylkoCyfry, 
	let cyfra = Int(pesel[pesel.index(pesel.startIndex, offsetBy: 9)].description) else {
        return "Nieprawidłowy PESEL"
    }
    return cyfra % 2 == 0 ? "Kobieta" : "Mężczyzna"
}

print("Podaj PESEL:")
guard let pesel = readLine() else {
    print("Nieprawidłowy PESEL.")
    exit(1)
}

let plec = plecZPeselu(numerPesel: pesel)
print("Płeć: \(plec)")
*/