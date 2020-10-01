package main

import "fmt"

import "sort"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var N int
    fmt.Scan(&N)

    var pis []int
    for i := 0; i < N; i++ {
        var pi int
        fmt.Scan(&pi)

        pis = append(pis, pi)
    }

    sort.Sort(sort.IntSlice(pis))

    minDiff := 10000000
    for i := 0; i < len(pis) - 1; i++ {
        diff := pis[i + 1] - pis[i]
        if diff < minDiff {
            minDiff = diff
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(minDiff)
}

