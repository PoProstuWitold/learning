package main

import "fmt"

func zeroValues() {
	var i int     // int 0
	var f float64 // float64 0
	var b bool    // bool false
	var s string  // string ""

	fmt.Printf("values: %v %v %v %q\n", i, f, b, s)
	fmt.Printf("types: %T %T %T %T\n", i, f, b, s)
}
