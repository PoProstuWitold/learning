package main

import "fmt"

func appendingToSlice() {
	// Appending to a slice
	// It is common to append new elements to a slice, and so Go provides a built-in append function.
	// The documentation of the built-in package describes append.
	// func append(s []T, vs ...T) []T
	// The first parameter s of append is a slice of type T, and the rest are T values to append to the slice.
	// The resulting value of append is a slice containing all the elements
	// of the original slice plus the provided values.

	// If the backing array of s is too small to fit all the given values a bigger array will be allocated.
	// The returned slice will point to the newly allocated array.

	// (To learn more about slices, read the Slices: usage and internals article.)

	var s []int
	printSlice3(s) // len=0 cap=0 []

	// append works on nil slices.
	s = append(s, 0)
	printSlice3(s) // len=1 cap=1 [0]

	// The slice grows as needed.
	s = append(s, 1)
	printSlice3(s) // len=2 cap=2 [0 1]

	// We can add more than one element at a time.
	s = append(s, 2, 3, 4)
	printSlice3(s) // len=5 cap=6 [0 1 2 3 4]
}

func printSlice3(s []int) {
	fmt.Printf("len=%d cap=%d %v\n", len(s), cap(s), s)
}
