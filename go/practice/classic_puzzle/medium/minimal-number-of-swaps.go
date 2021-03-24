package main

import "fmt"
import "os"
import "bufio"
import "strings"
import "strconv"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    var n int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&n)

    scanner.Scan()
    inputs := strings.Split(scanner.Text()," ")
    for i := 0; i < n; i++ {
        x,_ := strconv.ParseInt(inputs[i],10,32)
        _ = x
    }

    lIndex := -1
    rIndex := len(inputs)
    turn := 0
    for lIndex < rIndex {
        // next zero from left
        lIndex++
        for lIndex < len(inputs) && inputs[lIndex] != "0" {
            lIndex++
        }

        // next one from right
        rIndex--
        for rIndex >= 0 && inputs[rIndex] != "1" {
            rIndex--
        }

        turn++
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(turn - 1)
}

