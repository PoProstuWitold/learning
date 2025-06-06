package main

import (
	"fmt"
	"math"
)

func compute(fn func(float64, float64) float64) float64 {
	return fn(3, 4)
}

func functionValues() {
	// Functions are values too. They can be passed around just like other values.
	// Function values may be used as function arguments and return values.

	hypot := func(x, y float64) float64 {
		return math.Sqrt(x*x + y*y)
	}
	fmt.Println(hypot(5, 12)) // 13

	fmt.Println(compute(hypot))    // 5
	fmt.Println(compute(math.Pow)) // 81
}
