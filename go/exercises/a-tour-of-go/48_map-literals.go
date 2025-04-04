package main

import "fmt"

type Vertex6 struct {
	Lat, Long float64
}

var m2 = map[string]Vertex6{
	"Bell Labs": Vertex6{
		40.68433, -74.39967,
	},
	"Google": Vertex6{
		37.42202, -122.08408,
	},
}

func mapLiterals() {
	// Map literals are like struct literals, but the keys are required.
	fmt.Println(m2) // map[Bell Labs:{40.68433 -74.39967} Google:{37.42202 -122.08408}]
}
