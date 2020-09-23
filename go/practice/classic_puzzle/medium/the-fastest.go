package main

import "fmt"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var N int
    fmt.Scan(&N)

    var ts []string
    for i := 0; i < N; i++ {
        var t string
        fmt.Scan(&t)

        ts = append(ts, t)
    }

    fastest := ts[0]
    for _, v := range ts {
        if v < fastest {
            fastest = v
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(fastest)
}

