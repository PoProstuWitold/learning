package main

import "fmt"

type Vertex5 struct {
	Lat, Long float64
}

var m map[string]Vertex5

func maps() {
	// A map maps keys to values.
	// The zero value of a map is nil. A nil map has no keys, nor can keys be added.
	// The make function returns a map of the given type, initialized and ready for use.

	m = make(map[string]Vertex5)
	m["Bell Labs"] = Vertex5{
		40.68433, -74.39967,
	}
	fmt.Println(m["Bell Labs"]) // {40.68433 -74.39967}
}
