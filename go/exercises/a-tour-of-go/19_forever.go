package main

import "fmt"

// If you omit the loop condition it loops forever, so an infinite loop is compactly expressed.
func foreverLoop() {
	for {
		fmt.Println("prints forever")
	}
}
