package main

import "fmt"

func forLoops() {
	sum := 0
	for i := 0; i < 10; i++ {
		sum += i
		fmt.Println(i)
	}
	fmt.Println(sum)
}
