package main

import "fmt"

func fibonacci() func() int {
	a, b := 0, 1
	return func() int {
		res := a
		a, b = b, a+b
		return res
	}
}

func fibonacciClosure() {
	f := fibonacci()
	for range 10 {
		fmt.Println(f())
	}
}
