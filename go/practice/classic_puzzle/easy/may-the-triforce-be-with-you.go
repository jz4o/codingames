package main

import "fmt"

import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var N int
    fmt.Scan(&N)


    width := N * 4 - 1

    upperPart := ""
    lowerPart := ""
    for i := 1; i <= N; i++ {
        part := strings.Repeat("*", i * 2 - 1)

        upperLeftSpacePart := strings.Repeat(" ", (width - len(part)) / 2)
        upperPart += upperLeftSpacePart + part + "\n"

        lowerSpacePart := strings.Repeat(" ", (N - i + 1) * 2 - 1)
        lowerLine := part + lowerSpacePart + part
        lowerLeftSpacePart := strings.Repeat(" ", (width - len(lowerLine)) / 2)
        lowerPart += lowerLeftSpacePart + lowerLine + "\n"
    }

    result := strings.Replace(upperPart, " ", ".", 1) + strings.TrimSuffix(lowerPart, "\n")

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(result)
}

