package main

import "golang.org/x/tour/pic"

func Pic(dx, dy int) [][]uint8 {
	pic := make([][]uint8, dy) // tworzymy zewnętrzny slice
	for y := 0; y < dy; y++ {
		row := make([]uint8, dx) // wewnętrzny slice dla każdego wiersza
		for x := 0; x < dx; x++ {
			row[x] = uint8(x ^ y) // dowolna funkcja, np. XOR
		}
		pic[y] = row // przypisujemy wiersz do wyniku
	}
	return pic
}

func slicesExercise() {
	pic.Show(Pic)
}
