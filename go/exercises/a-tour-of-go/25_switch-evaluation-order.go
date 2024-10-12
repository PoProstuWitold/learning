package main

import (
	"fmt"
	"time"
)

func switchEvaluationOrder() {
	fmt.Println("When's Saturday?")
	// today := time.Now().Weekday()
	var today time.Weekday = time.Now().Weekday()

	// Switch cases evaluate cases from top to bottom, stopping when a case succeeds.
	switch time.Saturday {
	case today + 0:
		fmt.Println("Today.")
	case today + 1:
		fmt.Println("Tomorrow.")
	case today + 2:
		fmt.Println("In two days.")
	default:
		fmt.Println("Too far away.")
	}

	// FUN FACT
	// Note: Time in the Go playground always appears to start at 2009-11-10 23:00:00 UTC,
	// a value whose significance is left as an exercise for the reader.

	// Answer:
	// On 10th November 2009 Go was publicly announced by Google
	// That's why The Go Playground uses the date of the announcement as the starting time

	// time.Now() in playground
	// 2009-11-10 23:00:00 +0000 UTC m=+0.000000001
}
