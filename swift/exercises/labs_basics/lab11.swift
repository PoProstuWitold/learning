import Foundation
// Zadanie 11.1.
// Polecenie 1. Utwórz klasę Prostokąt, scharakteryzowaną przez długości boków.
// Polecenie 2. Utwórz metodę init().
// Polecenie 3. Utwórz funkcję zwracającą pole figury.
// Polecenie 4. Utwórz funkcję zwracającą obwód figury.
// Polecenie 3. Utwórz funkcję wyświetlająca dane figury.
// Polecenie 7. Przetestuj utworzone funkcje.
func zadanie11_1() {
    // Klasa Prostokąt
    class Rectangle {
        let length: Double
        let width: Double

        // 2. Metoda init
        init?(length: Double, width: Double) {
            guard length > 0, width > 0 else {
                print("Długości boków muszą być większe od zera.")
                return nil
            }
            self.length = length
            self.width = width
        }

        // 3. Funkcja zwracająca pole figury
        func area() -> Double {
            return length * width
        }

        // 4. Funkcja zwracająca obwód figury
        func perimeter() -> Double {
            return 2 * (length + width)
        }

        // 5. Funkcja wyświetlająca dane figury
        func display() {
            print("Prostokąt:")
            print("- Długość: \(length)")
            print("- Szerokość: \(width)")
            print("- Pole: \(area())")
            print("- Obwód: \(perimeter())")
        }
    }

    // 7. Test funkcji
    print("Podaj długość prostokąta:")
    guard let lengthInput = readLine(), let length = Double(lengthInput) else {
        print("Nieprawidłowa długość.")
        return
    }

    print("Podaj szerokość prostokąta:")
    guard let widthInput = readLine(), let width = Double(widthInput) else {
        print("Nieprawidłowa szerokość.")
        return
    }

    if let rectangle = Rectangle(length: length, width: width) {
        rectangle.display()
    }
}
zadanie11_1()

// Zadanie 11.2.
// Polecenie 1. Utwórz klasę Prostopadłościan, dziedziczącą po klasie Prostokat
// i scharakteryzowaną dodatkowo przez wysokość.
// Polecenie 2. Utwórz metodę init().
// Polecenie 3. Utwórz funkcję zwracającą pole całkowite bryły.
// Polecenie 4. Utwórz funkcję zwracającą sumę krawędzi.
// Polecenie 5. Utwórz funkcję zwracającą objętość bryły.
// Polecenie 6. Utwórz funkcję wyświetlająca dane bryły.
// Polecenie 7. Przetestuj utworzone funkcje.
func zadanie11_2() {
    // Klasa Prostokąt
    class Rectangle {
        let length: Double
        let width: Double

        init?(length: Double, width: Double) {
            guard length > 0, width > 0 else {
                print("Długości boków muszą być większe od zera.")
                return nil
            }
            self.length = length
            self.width = width
        }

        func area() -> Double {
            return length * width
        }

        func perimeter() -> Double {
            return 2 * (length + width)
        }

        func display() {
            print("Prostokąt:")
            print("- Długość: \(length)")
            print("- Szerokość: \(width)")
            print("- Pole: \(area())")
            print("- Obwód: \(perimeter())")
        }
    }

    // Klasa Prostopadłościan
    class Cuboid: Rectangle {
        let height: Double

        // 2. Metoda init
        init?(length: Double, width: Double, height: Double) {
            guard height > 0 else {
                print("Wysokość musi być większa od zera.")
                return nil
            }
            self.height = height
            super.init(length: length, width: width)
        }

        // 3. Funkcja zwracająca pole całkowite bryły
        func totalSurfaceArea() -> Double {
            return 2 * (length * width + length * height + width * height)
        }

        // 4. Funkcja zwracająca sumę krawędzi
        func totalEdgeLength() -> Double {
            return 4 * (length + width + height)
        }

        // 5. Funkcja zwracająca objętość bryły
        func volume() -> Double {
            return length * width * height
        }

        // 6. Funkcja wyświetlająca dane bryły
        override func display() {
            print("Prostopadłościan:")
            print("- Długość: \(length)")
            print("- Szerokość: \(width)")
            print("- Wysokość: \(height)")
            print("- Pole całkowite: \(totalSurfaceArea())")
            print("- Suma krawędzi: \(totalEdgeLength())")
            print("- Objętość: \(volume())")
        }
    }

    // 7. Test funkcji
    print("Podaj długość prostopadłościanu:")
    guard let lengthInput = readLine(), let length = Double(lengthInput) else {
        print("Nieprawidłowa długość.")
        return
    }

    print("Podaj szerokość prostopadłościanu:")
    guard let widthInput = readLine(), let width = Double(widthInput) else {
        print("Nieprawidłowa szerokość.")
        return
    }

    print("Podaj wysokość prostopadłościanu:")
    guard let heightInput = readLine(), let height = Double(heightInput) else {
        print("Nieprawidłowa wysokość.")
        return
    }

    if let cuboid = Cuboid(length: length, width: width, height: height) {
        cuboid.display()
    }
}
zadanie11_2()

// Typ wyliczeniowy dla kierunku studiów
enum FieldOfStudy: String, CaseIterable {
    case informatics = "Informatyka"
    case mathematics = "Matematyka"
    case physics = "Fizyka"
	case economics = "Ekonomia"
}

// Klasa Osoba (zad. 10.5)
class Person {
    let firstName: String
    let lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

    class Student: Person {
        let indexNumber: String
        let fieldOfStudy: FieldOfStudy
        let yearOfStudy: Int
        var grades: [Double]

        // 2. Inicjalizator
        init(firstName: String, lastName: String, indexNumber: String, fieldOfStudy: FieldOfStudy, yearOfStudy: Int, grades: [Double]) {
            guard grades.count == 5, grades.allSatisfy({ $0 >= 2.0 && $0 <= 5.0 }) else {
                fatalError("Nieprawidłowe oceny. Musi być dokładnie 5 ocen w zakresie od 2.0 do 5.0.")
            }
            self.indexNumber = indexNumber
            self.fieldOfStudy = fieldOfStudy
            self.yearOfStudy = yearOfStudy
            self.grades = grades
            super.init(firstName: firstName, lastName: lastName)
        }

        // 3. Wyznaczanie średniej
        func calculateAverage() -> Double {
            return grades.reduce(0, +) / Double(grades.count)
        }

        // 4. Wyświetlanie danych
        func displayData() {
            print("Student: \(firstName) \(lastName)")
            print("Numer indeksu: \(indexNumber)")
            print("Kierunek: \(fieldOfStudy.rawValue)")
            print("Rok studiów: \(yearOfStudy)")
            print("Oceny: \(grades.map { String(format: "%.2f", $0) }.joined(separator: ", "))")
            print("Średnia ocen: \(String(format: "%.2f", calculateAverage()))")
        }
    }

// Zadanie 11.3.
// Polecenie 1. Utwórz klasę Student, dziedziczącą po klasie Osoba (zad. 10.5)
// i scharakteryzowaną przez: numer indeksu, kierunek studiów, rok studiów, oceny z 5
// przedmiotów.
// Polecenie 2. Utwórz metodę init(). Kierunek studiów powinien być zdefiniowany jako typ
// wyliczeniowy. Należy zapewnić poprawność danych wprowadzonych ocen.
// Polecenie 3. Utwórz funkcję wyznaczającą średnią studenta na podstawie jego ocen.
// Polecenie 4. Utwórz funkcję wyświetlającą dane studenta.
// Polecenie 5. Utwórz tablicę studentów. Liczbę studentów należy pobrać od użytkownika.
// Należy wczytać dan studentów. Należy utworzyć odpowiednią funkcję.
// Polecenie 6. Wyświetl wszystkich studentów studiujących na podanym przez użytkownika
// kierunku. Należy utworzyć odpowiednią funkcję.
func zadanie11_3() {
    // 5. Wczytywanie danych studentów
    func readStudents() -> [Student] {
        print("Podaj liczbę studentów:")
        guard let input = readLine(), let studentCount = Int(input), studentCount > 0 else {
            fatalError("Nieprawidłowa liczba studentów.")
        }

        var students = [Student]()
        for i in 1...studentCount {
            print("Podaj dane studenta \(i):")

            print("Imię:")
            guard let firstName = readLine(), !firstName.isEmpty else {
                fatalError("Nieprawidłowe imię.")
            }

            print("Nazwisko:")
            guard let lastName = readLine(), !lastName.isEmpty else {
                fatalError("Nieprawidłowe nazwisko.")
            }

            print("Numer indeksu:")
            guard let indexNumber = readLine(), !indexNumber.isEmpty else {
                fatalError("Nieprawidłowy numer indeksu.")
            }

            print("Kierunek studiów (dostępne: \(FieldOfStudy.allCases.map { $0.rawValue }.joined(separator: ", "))):")
            guard let fieldInput = readLine(), let fieldOfStudy = FieldOfStudy(rawValue: fieldInput) else {
                fatalError("Nieprawidłowy kierunek studiów.")
            }

            print("Rok studiów:")
            guard let yearInput = readLine(), let yearOfStudy = Int(yearInput), yearOfStudy > 0 else {
                fatalError("Nieprawidłowy rok studiów.")
            }

            print("Podaj 5 ocen:")
            var grades = [Double]()
            for j in 1...5 {
                print("Ocena \(j):")
                guard let gradeInput = readLine(), let grade = Double(gradeInput), grade >= 2.0 && grade <= 5.0 else {
                    fatalError("Nieprawidłowa ocena. Oceny muszą być w zakresie od 2.0 do 5.0.")
                }
                grades.append(grade)
            }

            let student = Student(firstName: firstName, lastName: lastName, indexNumber: indexNumber, fieldOfStudy: fieldOfStudy, yearOfStudy: yearOfStudy, grades: grades)
            students.append(student)
        }

        return students
    }

    // 6. Wyświetlanie studentów na określonym kierunku
    func displayStudents(onField field: FieldOfStudy, from students: [Student]) {
        let filteredStudents = students.filter { $0.fieldOfStudy == field }
        if filteredStudents.isEmpty {
            print("Brak studentów na kierunku \(field.rawValue).")
        } else {
            print("Studenci na kierunku \(field.rawValue):")
            filteredStudents.forEach { $0.displayData() }
        }
    }

    // Testowanie
    let students = readStudents()
    students.forEach { $0.displayData() }

    print("Podaj kierunek studiów do wyszukania:")
    guard let fieldInput = readLine(), let fieldOfStudy = FieldOfStudy(rawValue: fieldInput) else {
        print("Nieprawidłowy kierunek studiów.")
        return
    }

    displayStudents(onField: fieldOfStudy, from: students)
}
zadanie11_3()

// Zadanie 11.4.
// Polecenie 1. Utwórz klasę StudentNaErasmusie, dziedziczącą po klasie Student (zad. 11.3)
// i scharakteryzowaną przez: nazwę uczelni za granicą, datę rozpoczęcia Erasmusa, datę
// zakończenia Erasmusa oraz kursy w których student brał udział (w postaci tablicy
// zawierającej nazwę kursu oraz uzyskanej oceny).
// Polecenie 2. Utwórz metodę init().
// Polecenie 3. Utwórz funkcję wyświetlającą dane studenta na Erasmus, korzystając z funkcji
// dziedziczonych.
// Polecenie 4. Utwórz funkcję wyznaczającą czas spędzony na Erasmusie.
// Polecenie 5. Utwórz funkcję wyznaczającą ocenę studenta na podstawie uczestnictwa w
// kurach.
// Średnia Ocena
// [4,6-5,0] bardzo dobra
// [3,6-4,5] dobra
// [3,0-3,5] dostateczna
// < 3,0 niedostateczna
func zadanie11_4() {
    class ErasmusStudent: Student {
        let foreignUniversity: String
        let startDate: String
        let endDate: String
        var courses: [(courseName: String, grade: Double)]

        init(firstName: String, lastName: String, indexNumber: String, fieldOfStudy: FieldOfStudy, yearOfStudy: Int, grades: [Double], foreignUniversity: String, startDate: String, endDate: String, courses: [(courseName: String, grade: Double)]) {
            guard startDate < endDate else {
                fatalError("Data rozpoczęcia musi być wcześniejsza od daty zakończenia.")
            }
            self.foreignUniversity = foreignUniversity
            self.startDate = startDate
            self.endDate = endDate
            self.courses = courses
            super.init(firstName: firstName, lastName: lastName, indexNumber: indexNumber, fieldOfStudy: fieldOfStudy, yearOfStudy: yearOfStudy, grades: grades)
        }

        func displayErasmusData() {
            displayData()
            print("Uczelnia zagraniczna: \(foreignUniversity)")
            print("Data rozpoczęcia: \(startDate)")
            print("Data zakończenia: \(endDate)")
            print("Kursy:")
            courses.forEach { print("\($0.courseName): \(String(format: "%.2f", $0.grade))") }
        }

        func timeSpentOnErasmus() -> Int {
            let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = "yyyy-MM-dd"
			
			guard let start = dateFormatter.date(from: startDate),
				let end = dateFormatter.date(from: endDate) else {
				print("Nieprawidłowy format daty. Oczekiwany format: yyyy-MM-dd.")
				return 0
			}
			
			let components = Calendar.current.dateComponents([.day], from: start, to: end)
			return components.day ?? 0
        }

        func erasmusGradeEvaluation() -> String {
            let average = courses.map { $0.grade }.reduce(0, +) / Double(courses.count)
            switch average {
            case 4.6...5.0: return "bardzo dobra"
            case 3.6..<4.6: return "dobra"
            case 3.0..<3.6: return "dostateczna"
            default: return "niedostateczna"
            }
        }
    }

    // Testowanie
    print("Tworzenie studentów na Erasmusie...")

    let student1 = ErasmusStudent(
        firstName: "Jan",
        lastName: "Kowalski",
        indexNumber: "123456",
        fieldOfStudy: .informatics,
        yearOfStudy: 2,
        grades: [4.0, 5.0, 3.5, 4.5, 5.0],
        foreignUniversity: "University of Oxford",
        startDate: "2023-01-10",
        endDate: "2023-06-20",
        courses: [("Matematyka", 4.5), ("Fizyka", 4.0)]
    )

    let student2 = ErasmusStudent(
        firstName: "Anna",
        lastName: "Nowak",
        indexNumber: "654321",
        fieldOfStudy: .economics,
        yearOfStudy: 3,
        grades: [3.5, 3.0, 4.0, 3.5, 4.0],
        foreignUniversity: "Harvard University",
        startDate: "2023-02-01",
        endDate: "2023-08-15",
        courses: [("Ekonomia", 3.8), ("Zarządzanie", 4.2)]
    )

    let erasmusStudents = [student1, student2]

    print("=== Dane studentów na Erasmusie ===")
    for student in erasmusStudents {
        student.displayErasmusData()
        print("Czas spędzony na Erasmusie: \(student.timeSpentOnErasmus()) dni")
        print("Ocena ogólna: \(student.erasmusGradeEvaluation())")
        print("----------------------------------")
    }
}
zadanie11_4()