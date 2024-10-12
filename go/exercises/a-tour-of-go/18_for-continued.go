package main

import "fmt"

// The init and post statements are optional.
func forContinued() {
	sum := 1
	for sum < 1000 {
		sum += sum
	}
	fmt.Println(sum)
}
