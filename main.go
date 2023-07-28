package main

import (
	"fmt"
	"os"
)

func main() {
	fmt.Printf("%#v\n", "Hello World!")
	fmt.Println(os.Getenv("ENV1"))
}
