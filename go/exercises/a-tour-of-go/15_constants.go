package main

import "fmt"

const Pi = 3.14

func constants() {
	const Name = "Witold"
	// Name := "Witold2" // cannot assign to Name
	fmt.Println("Hello", Name)
	fmt.Println("Happy", Pi, "Day")

	const Truth = true
	fmt.Println("Go rules?", Truth)
}
