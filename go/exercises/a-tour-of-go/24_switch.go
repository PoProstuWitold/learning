package main

import (
	"fmt"
	"runtime"
)

func switchInstructions() {
	fmt.Print("Go runs on ")
	const os string = runtime.GOOS

	// switch os := runtime.GOOS; os {
	switch os {
	case "darwin":
		fmt.Println("OS X.")
	case "linux":
		fmt.Println("Linux.")
	default:
		// freebsd, openbsd,
		// plan9, windows...
		fmt.Printf("%s.\n", os)
	}
}
