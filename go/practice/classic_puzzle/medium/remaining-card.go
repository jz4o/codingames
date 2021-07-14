package main

import "fmt"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var N int
    fmt.Scan(&N)

    base := 2
    step := 2
    max := N
    for base < max {
        prev_max := max
        max = (max - base) / step * step + base

        if prev_max == max {
            base += step
        }

        step *= 2
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(max)
}
