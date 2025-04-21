package main

import "fmt"

func makingSlices() {
	// Creating a slice with make
	// Slices can be created with the built-in make function; this is how you create dynamically-sized arrays.
	// The make function allocates a zeroed array and returns a slice that refers to that array:

	// a := make([]int, 5)  // len(a)=5

	// To specify a capacity, pass a third argument to make:
	// b := make([]int, 0, 5) // len(b)=0, cap(b)=5
	// b = b[:cap(b)] // len(b)=5, cap(b)=5
	// b = b[1:]      // len(b)=4, cap(b)=4

	a := make([]int, 5)
	printSlice2("a", a) // a len=5 cap=5 [0 0 0 0 0]

	b := make([]int, 0, 5)
	printSlice2("b", b) // b len=0 cap=5 []

	c := b[:2]
	printSlice2("c", c) // c len=2 cap=5 [0 0]

	d := c[2:5]
	printSlice2("d", d) // d len=3 cap=3 [0 0 0]
}

func printSlice2(s string, x []int) {
	fmt.Printf("%s len=%d cap=%d %v\n",
		s, len(x), cap(x), x)
}
