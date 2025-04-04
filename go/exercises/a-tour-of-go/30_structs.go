package main

import "fmt"

type Vertex struct {
	X int
	Y int
}

func structs() {
	// A struct is a collection of fields.
	fmt.Println(Vertex{1, 2})
}
