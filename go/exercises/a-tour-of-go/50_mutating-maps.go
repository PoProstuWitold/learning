package main

import "fmt"

func mutatingMaps() {
	// Mutating Maps

	// Insert or update an element in map m:
	// m[key] = elem

	// Retrieve an element:
	// elem = m[key]

	// Delete an element:
	// delete(m, key)

	// Test that a key is present with a two-value assignment:
	// elem, ok = m[key]

	// If key is in m, ok is true. If not, ok is false.
	// If key is not in the map, then elem is the zero value for the map's element type.

	// Note: If elem or ok have not yet been declared you could use a short declaration form:
	// elem, ok := m[key]

	m := make(map[string]int)

	m["Answer"] = 42
	fmt.Println("The value:", m["Answer"]) // The value: 42

	m["Answer"] = 48
	fmt.Println("The value:", m["Answer"]) // The value: 48

	delete(m, "Answer")
	fmt.Println("The value:", m["Answer"]) // The value: 0

	v, ok := m["Answer"]                         // ok is false
	fmt.Println("The value:", v, "Present?", ok) // The value: 0 Present? false
}
