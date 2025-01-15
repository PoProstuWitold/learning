import Foundation

// Zadanie 1. (20pkt)
func zad1() {
    print("Zadanie 1. (20pkt)")
   
    func readArray(length: Int, arrayId: String) -> Array<Int> {
        var array: Array<Int> = Array(repeating: 0, count: length)
        for i in 0...length-1 {
            print("Podaj liczbe \(i) dla \(arrayId): ")
            guard let input = readLine(), let number = Int(input) else {
                print("Podaj liczbe calkowita")
                return []
            }
            array[i] = number
            print(number)
        }
        return array
    }
   
    func printArray(array: Array<Int>) {
        for i in 0...array.count-1 {
            print(array[i], terminator: " ")
        }
       
        print(" ")
    }
   
    func commonElements(a1: Array<Int>, a2: Array<Int>) -> Int {
        let common = a1.filter(a2.contains).count
        return common
    }
   
    let a1 = readArray(length: 5, arrayId: "arr1")
    let a2 = readArray(length: 10, arrayId: "arr2")
   
    printArray(array: a1)
    printArray(array: a2)
   
    let common = commonElements(a1: a1, a2: a2)
    print("Common elements count: \(common)")
   
}

// Zadanie 2. (30pk)
enum JezykProgramowania {
    case swift
    case go
    case ts
    case cpp
    case rust
}

func zad2() {
    print("Zadanie 2. (30pkt)")
    
    class Pracownik {
        var imie: String
        var nazwisko: String
        var rokZatrudnienia: Int
        var wynagrodzeniePodstawowe: Double
        
        init(imie: String, nazwisko: String, rokZatrudnienia: Int, wynagrodzeniePodstawowe: Double) {
            self.imie = imie
            self.nazwisko = nazwisko
            self.rokZatrudnienia = rokZatrudnienia
            self.wynagrodzeniePodstawowe = wynagrodzeniePodstawowe
        }
        
        func show() {
            print("imie", imie)
            print("nazwisko", nazwisko)
            print("rokZatrudnienia", rokZatrudnienia)
            print("wynagrodzeniePodstawowe", wynagrodzeniePodstawowe)
        }
        
        func wynagrodzenie() -> Double {
            return wynagrodzeniePodstawowe
        }
    }
    
    class Programista: Pracownik {
        var langs: Array<String>
        init(imie: String, nazwisko: String, rokZatrudnienia: Int, wynagrodzeniePodstawowe: Double, langs: Array<String>) {
            self.langs = langs
            super.init(imie: imie, nazwisko: nazwisko, rokZatrudnienia: rokZatrudnienia, wynagrodzeniePodstawowe: wynagrodzeniePodstawowe)
        }
        
        override func wynagrodzenie() -> Double {
            return wynagrodzeniePodstawowe + (Double(langs.count) * 0.10 * wynagrodzeniePodstawowe)
        }
    }
    
    class Manager: Pracownik {
        var employeesCount: Int
        
        init(imie: String, nazwisko: String, rokZatrudnienia: Int, wynagrodzeniePodstawowe: Double, employeesCount: Int) {
            self.employeesCount = employeesCount
            super.init(imie: imie, nazwisko: nazwisko, rokZatrudnienia: rokZatrudnienia, wynagrodzeniePodstawowe: wynagrodzeniePodstawowe)
        }
        
        override func wynagrodzenie() -> Double {
            return wynagrodzeniePodstawowe + (Double(employeesCount) * 0.05 * wynagrodzeniePodstawowe)
        }
    }
    
    let pracownik = Pracownik(imie: "Witold", nazwisko: "Zawada", rokZatrudnienia: 2024, wynagrodzeniePodstawowe: 4000)
    let programista = Programista(imie: "Witold", nazwisko: "Zawada", rokZatrudnienia: 2024, wynagrodzeniePodstawowe: 4000, langs: ["go", "ts", "swift"])
    let manager = Manager(imie: "Witold", nazwisko: "Zawada", rokZatrudnienia: 2024, wynagrodzeniePodstawowe: 4000, employeesCount: 10)
    
    pracownik.show()
    programista.show()
    manager.show()
    
    let wynagPrac = pracownik.wynagrodzenie()
    let wynagProg = programista.wynagrodzenie()
    let wynagMana = manager.wynagrodzenie()
    
    print("Zarobki:\n")
    print("Pracownik: \(wynagPrac), Programista: \(wynagProg), Manager: \(wynagMana)")
}

// Zadanie 3. (10pkt)
func zad3() {
    print("Zadanie 3. (10pkt)")
    
    protocol WielokatForemny {
        var dlugoscBoku: Double { get set }
        func obliczObwod() -> Double
        func obliczPole() -> Double
        func opiszWielokat()
    }
    
    class TrojkatRownoboczny: WielokatForemny {
        var dlugoscBoku: Double
        init(dlugoscBoku: Double) {
            self.dlugoscBoku = dlugoscBoku
        }
        func obliczObwod() -> Double {
            return dlugoscBoku * 3
        }
        func obliczPole() -> Double {
            return ((dlugoscBoku * dlugoscBoku)*sqrt(3))/4
        }
        func opiszWielokat() {
            print("trojkat - bok: \(dlugoscBoku), obwod: \(obliczObwod()), pole: \(obliczPole())")
        }
    }
    
    class Kwadrat: WielokatForemny {
        var dlugoscBoku: Double
        init(dlugoscBoku: Double) {
            self.dlugoscBoku = dlugoscBoku
        }
        func obliczObwod() -> Double {
            return dlugoscBoku * 4
        }
        func obliczPole() -> Double {
            return dlugoscBoku * dlugoscBoku
        }
        func opiszWielokat() {
            print("kwadrat - bok: \(dlugoscBoku), obwod: \(obliczObwod()), pole: \(obliczPole())")
        }
    }
    let trojkatRownoboczny = TrojkatRownoboczny(dlugoscBoku: 5)
    let kwadrat = Kwadrat(dlugoscBoku: 5)
    
    trojkatRownoboczny.opiszWielokat()
    kwadrat.opiszWielokat()
}

// Zadanie 4. (20pkt)
func zad4() {
    print("Zadanie 4. (20pkt)")
    struct NowyUzytkownik {
        var login: String
        var haslo: String
        var email: String
    }
    
    enum UserError: Error {
        case login
        case haslo
        case email
    }
    
    func validateUser(user: NowyUzytkownik) throws -> Bool {
        if user.login.count == 0 || user.haslo.count == 0 || user.email.count == 0 {
            return false
        }
        guard let login = Optional(user.login), login.count > 5 else {
            throw UserError.login
        }
        guard let haslo = Optional(user.haslo), haslo.count > 8 else {
            throw UserError.haslo
        }
        guard let email = Optional(user.email), email.count > 5, email.contains("@") else {
            throw UserError.email
        }
        
        return true
    }
    
    let user = NowyUzytkownik(login: "1234", haslo: "12345678", email: "email@poczta.pl")
    print(user)
    
//    guard let valid = validateUser(user: user) else {
//        throw fatalError()
//    }
}


// zadania
// zad1()
zad2()
zad3()
zad4()
