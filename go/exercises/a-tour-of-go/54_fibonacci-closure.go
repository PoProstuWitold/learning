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
	for i := 0; i < 10; i++ {
		fmt.Println(f())
	}
}
