/*
var i int
j := i // j is an int

i := 42           // int
f := 3.142        // float64
g := 0.867 + 0.5i // complex128
*/

package main

import "fmt"

func typeInference() {
	v := 2137 // change me!
	fmt.Printf("v is of type %T\n", v)
}
