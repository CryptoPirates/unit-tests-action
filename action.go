package unittestsaction

import (
	"fmt"

	"github.com/confluentinc/confluent-kafka-go-dev/kafka"
	"github.com/cryptopirates/gotalib"
)

func printHelloWorld() bool {
	fmt.Println("Hello, World!")
	gotalib.Ema([]float64{1.0, 2.0, 3.0}, 3)
	_, _ = kafka.NewConsumer(&kafka.ConfigMap{})
	return true
}
