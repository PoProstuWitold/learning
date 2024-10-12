package main

import (
	"fmt"
	"math"
)

// https://go.dev/tour/flowcontrol/8
func Sqrt(x float64) float64 {
	z := 1.0
	prevZ := 0.0

	// Newton's method for square root
	// stops when the change is less than 0.000001
	for math.Abs(z-prevZ) > 1e-6 {
		prevZ = z
		z -= (z*z - x) / (2 * z)
	}
	return z
}

func loopsAndFunctionsExercise() {
	fmt.Println("My Sqrt:", Sqrt(2))
	fmt.Println("math.Sqrt:", math.Sqrt(2))
}
