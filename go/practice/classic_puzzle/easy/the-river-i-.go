package main

import "fmt"

import "strconv"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var r1 int
    fmt.Scan(&r1)

    var r2 int
    fmt.Scan(&r2)

    for r1 != r2 {
        if r1 < r2 {
            for _, v := range strings.Split(strconv.Itoa(r1), "") {
                i, _ := strconv.Atoi(v)
                r1 += i
            }
        } else {
            for _, v := range strings.Split(strconv.Itoa(r2), "") {
                i, _ := strconv.Atoi(v)
                r2 += i
            }
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("42")// Write answer to stdout
    fmt.Println(r1)
}

