package main

import "fmt"

func deferStacking() {
	// Deferred function calls are pushed onto a stack. When a function returns,
	// its deferred calls are executed in last-in-first-out order.

	// more info: https://go.dev/blog/defer-panic-and-recover
	fmt.Println("counting")

	for i := 0; i < 10; i++ {
		defer fmt.Println(i)
	}

	fmt.Println("done")

	// Output:
	// counting
	// done
	// 9
	// ..
	// 1
	// 0
}
