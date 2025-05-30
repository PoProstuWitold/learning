package main

import "fmt"

func pointers() {
	// Go has pointers. A pointer holds the memory address of a value.
	// The type *T is a pointer to a T value. Its zero value is nil.
	// var p *int

	// The & operator generates a pointer to its operand.
	// i := 42
	// p = &i
	// fmt.Println(*p) // 42

	// The * operator denotes the pointer's underlying value.
	// fmt.Println(*p) // read i through the pointer p
	// *p = 21         // set i through the pointer p
	// fmt.Println(*p) // 21

	// This is known as "dereferencing" or "indirecting".

	// Unlike C, Go has no pointer arithmetic.
	i, j := 42, 2701

	p := &i         // point to i
	fmt.Println(*p) // read i through the pointer; 42
	*p = 21         // set i through the pointer
	fmt.Println(i)  // see the new value of i; 21

	p = &j         // point to j
	*p = *p / 37   // divide j through the pointer
	fmt.Println(j) // see the new value of j; 73
}
