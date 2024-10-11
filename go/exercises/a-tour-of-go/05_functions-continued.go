package main

import "fmt"

// x int, y int == to x, y int
func add2(x, y int) int {
	return x + y
}

func functionsContinued() {
	fmt.Println(add2(21, 37))
}
