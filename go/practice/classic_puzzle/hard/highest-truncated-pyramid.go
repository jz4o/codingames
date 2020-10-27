package main

import "fmt"

import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var N int
    fmt.Scan(&N)

    partCount := 1
    topStepCount := 1
    bottomStepCount := 1

    for {
        if partCount < N {
            bottomStepCount++
            partCount += bottomStepCount
        } else if N < partCount {
            partCount -= topStepCount
            topStepCount++
        } else {
            break
        }
    }

    for i := topStepCount; i <= bottomStepCount; i++ {
        fmt.Println(strings.Repeat("*", i))
    }
}

