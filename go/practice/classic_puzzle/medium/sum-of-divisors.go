package main

import "fmt"

import "math"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var n int
    fmt.Scan(&n)

    floatN := (float64)(n)

    sum := 0
    for i := 1.0; i <= floatN; i++ {
        sum += (int)(math.Floor(floatN / i) * i)
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("sum")// Write answer to stdout
    fmt.Println(sum)
}

