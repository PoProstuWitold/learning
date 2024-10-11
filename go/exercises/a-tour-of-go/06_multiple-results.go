package main

import "fmt"

func swap(x, y string) (string, string) {
	return y, x
}

func multipleResults() {
	a, b := swap("21", "37")
	fmt.Println(a, b)
}
