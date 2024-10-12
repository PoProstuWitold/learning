package main

import (
	"fmt"
	"math"
)

func pow(x, n, lim float64) float64 {
	if v := math.Pow(x, n); v < lim {
		return v
	}

	return lim
}

func ifWithShortStatement() {
	var result1 float64 = pow(3, 2, 10)
	//assignment mismatch: 2 variables but pow returns 1 value
	var result2 float64 = pow(3, 3, 20)

	fmt.Println(
		result1, result2,
	)
}
