package main

import "fmt"

type Vertex2 struct {
	X int
	Y int
}

func structsFields() {
	// Struct fields are accessed using a dot.
	v := Vertex2{1, 2}
	v.X = 4
	fmt.Println(v.X, v.Y)
}
