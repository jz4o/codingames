package main

import "fmt"

import "strconv"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var r1 int
    fmt.Scan(&r1)

    isSuccess := false
    for i := r1 - 1; i >= 1; i-- {
        sum := 0
        for _, d := range strconv.Itoa(i) {
            digit, _ := strconv.Atoi(string(d))
            sum += digit
        }

        if i + sum == r1 {
            isSuccess = true
            break
        }
    }

    result := "NO"
    if isSuccess {
        result = "YES"
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("YES|NO")// Write answer to stdout
    fmt.Println(result)
}

