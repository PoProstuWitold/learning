package main

import (
	"fmt"
	"time"
)

func switchWithNoCondition() {
	t := time.Now()

	// basically `switch true`
	switch {
	case t.Hour() < 12:
		fmt.Println("Good morning!")
	case t.Hour() < 17:
		fmt.Println("Good afternoon.")
	default:
		fmt.Println("Good evening.")
	}
}
