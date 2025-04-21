package main

import "fmt"

type Vertex7 struct {
	Lat, Long float64
}

var m3 = map[string]Vertex7{
	"Bell Labs": {40.68433, -74.39967},
	"Google":    {37.42202, -122.08408},
}

func mapLiteralsContinued() {
	// If the top-level type is just a type name, you can omit it from the elements of the literal.
	fmt.Println(m3) // map[Bell Labs:{40.68433 -74.39967} Google:{37.42202 -122.08408}]
}
