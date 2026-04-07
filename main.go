package main

import (
	"fmt"
	"sync"
	"time"
)

var (
	mu    sync.Mutex
	myMap = make(map[int]int)
)

func writeToMap(key, value int) {
	mu.Lock()
	myMap[key] = value
	mu.Unlock()
}

func readFromMap(key int) {
	time.Sleep(time.Millisecond * time.Duration(key))

	mu.Lock()
	fmt.Println(myMap[key])
	mu.Unlock()
}

func main() {
	for i := 0; i < 3; i++ {
		key := i
		value := i * 10
		go writeToMap(key, value)
		go readFromMap(key)
	}
	time.Sleep(time.Second * 2)
}
