package main

import (
	"fmt"
	"math"
)

func pow2(x, n, lim float64) float64 {
	if v := math.Pow(x, n); v < lim {
		return v
	} else {
		fmt.Printf("%g >= %g\n", v, lim)
	}

	// can't use v here, though
	return lim
}

func ifAndElse() {
	fmt.Println(
		pow2(3, 2, 10),
		pow2(3, 3, 20),
	)
}
