package unittestsaction

import (
	"fmt"

	talib "github.com/cryptopirates/gotalib"
)

func printHelloWorld() bool {
	fmt.Println("Hello, World!")
	talib.EMA([]float64{1.0, 2.0, 3.0}, 3)
	return true
}
