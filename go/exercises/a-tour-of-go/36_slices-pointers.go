package main

import "fmt"

func slicesPointers() {
	// Slices are like references to arrays
	// A slice does not store any data, it just describes a section of an underlying array.
	// Changing the elements of a slice modifies the corresponding elements of its underlying array.
	// Other slices that share the same underlying array will see those changes.

	names := [4]string{
		"John",
		"Paul",
		"George",
		"Ringo",
	}
	fmt.Println(names) // [John Paul George Ringo]

	a := names[0:2]
	b := names[1:3]
	fmt.Println(a, b) // [John Paul] [Paul George]

	b[0] = "XXX"
	fmt.Println(a, b)  // [John XXX] [XXX George]
	fmt.Println(names) // [John XXX George Ringo]
}
