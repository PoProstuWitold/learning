package main

import "fmt"

type Vertex3 struct {
	X int
	Y int
}

func pointersToStructs() {
	//  Struct fields can be accessed through a struct pointer.

	// To access the field X of a struct when we have the struct pointer p we could write (*p).X
	// However, that notation is cumbersome, so the language permits us instead to write just p.X
	// without the explicit dereference.
	v := Vertex3{1, 2}
	p := &v
	p.X = 1e9
	fmt.Println(v)
}
