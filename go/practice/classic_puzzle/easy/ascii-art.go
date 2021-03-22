package main

import "fmt"
import "os"
import "bufio"

import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    var L int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&L)

    var H int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&H)

    scanner.Scan()
    T := scanner.Text()
    // _ = T // to avoid unused error
    var rows []string
    for i := 0; i < H; i++ {
        scanner.Scan()
        ROW := scanner.Text()
        // _ = ROW // to avoid unused error

        rows = append(rows, ROW)
    }

    const alphas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ?"

    result := make([]string, H)
    for _, t := range strings.ToUpper(T) {
        alphaIndex := strings.Index(alphas, string(t))
        if alphaIndex < 0 {
            alphaIndex = len(alphas) - 1
        }

        for h := 0; h < H; h++ {
            result[h] += rows[h][L * alphaIndex:L * alphaIndex + L]
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    for _, row := range result {
        fmt.Println(row)
    }
}

