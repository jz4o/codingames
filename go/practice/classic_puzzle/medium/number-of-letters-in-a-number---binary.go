package main

import "fmt"

import "strconv"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var start, n int
    fmt.Scan(&start, &n)

    temp := start
    for i := 0; i < n; i++ {
        binary := strconv.FormatInt((int64)(temp), 2)

        result :=
            strings.Count(binary, "0") * len("zero") +
            strings.Count(binary, "1") * len("one")

        if temp == result {
            break
        }

        temp = result
    }


    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("42")// Write answer to stdout
    fmt.Println(temp)
}

