package main

import "fmt"

import "strconv"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var L int
    fmt.Scan(&L)

    var N int
    fmt.Scan(&N)

    lines := []Line{}
    for i := 0; i < N; i++ {
        var pattern string
        var tempo int
        fmt.Scan(&pattern, &tempo)

        pattern = strings.ReplaceAll(pattern, "X", "1")
        int64Pattern, _ := strconv.ParseInt(pattern, 2, 64)

        lines = append(lines, Line{int(int64Pattern), tempo})
    }

    results := []string{}
    for i := 1; i <= L; i++ {
        resultNumber := 0
        for _, line := range lines {
            if i % line.tempo == 0 {
                resultNumber |= line.pattern
            }
        }

        intResult, _ := strconv.Atoi(strconv.FormatInt(int64(resultNumber), 2))
        result := fmt.Sprintf("%04d", intResult)

        result = strings.ReplaceAll(result, "1", "X")

        results = append([]string{result}, results...)
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    for _, result := range results {
        fmt.Println(result)
    }
}

type Line struct {
    pattern int
    tempo int
}

