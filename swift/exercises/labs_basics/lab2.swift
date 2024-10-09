print("Wpisz ocene nr 1 studenta 1: ")
var strOcena_1_Student1 = readLine()!
let ocena1_student1: Double? = Double(strOcena_1_Student1)
print("Jaka waga?: ")
var strWagaOceny_1_Student1 = readLine()!
let WagaOceny_1_Student1: Double? = Double(strWagaOceny_1_Student1)

print("Wpisz ocene nr 2 studenta 1: ")
var strOcena_2_Student1 = readLine()!
let ocena2_student1: Double? = Double(strOcena_2_Student1)
print("Jaka waga?: ")
var strWagaOceny_2_Student1 = readLine()!
let WagaOceny_2_Student1: Double? = Double(strWagaOceny_2_Student1)

print("Wpisz ocene nr 3 studenta 1: ")
var strOcena_3_Student1 = readLine()!
let ocena3_student1: Double? = Double(strOcena_3_Student1)
print("Jaka waga?: ")
var strWagaOceny_3_Student1 = readLine()!
let WagaOceny_3_Student1: Double? = Double(strWagaOceny_3_Student1)

let wagaOcenCalkowitaStudenta1: Double = (ocena1_student1! * WagaOceny_1_Student1! + ocena2_student1! * WagaOceny_2_Student1! + ocena3_student1! * WagaOceny_3_Student1!) / (WagaOceny_1_Student1! + WagaOceny_2_Student1! + WagaOceny_3_Student1!)

print("Waga calkowita obu uczniow wynosi: \(wagaOcenCalkowitaStudenta1)")