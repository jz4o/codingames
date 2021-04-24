package main

import "fmt"

import "math"
import "strconv"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var a, b int
    fmt.Scan(&a, &b)

    high := int(math.Max(float64(a), float64(b)))
    low := int(math.Min(float64(a), float64(b)))

    results := []string{}
    results = append(results, strconv.Itoa(high) + " * " + strconv.Itoa(low))

    addNums := ""
    for low != 0 {
        if low % 2 == 0 {
            high *= 2
            low /= 2
        } else {
            addNums += " + " + strconv.Itoa(high)
            low--
        }

        results = append(results, "= " + strconv.Itoa(high) + " * " + strconv.Itoa(low) + addNums)
    }

    answer := a * b
    results = append(results, "= " + strconv.Itoa(answer))

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    for _, result := range results {
        fmt.Println(result)
    }
}

