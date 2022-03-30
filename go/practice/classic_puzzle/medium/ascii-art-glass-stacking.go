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

    stage := 0
    glassCount := 0
    for glassCount + stage + 1 <= N {
        stage++
        glassCount += stage
    }

    glassParts := []string{
        " *** ",
        " * * ",
        " * * ",
        "*****"}

    width := stage * len(glassParts[0]) + stage - 1

    results := []string{}
    for step := 1; step <= stage; step++ {
        for _, glassPart := range glassParts {
            rowGlasses := []string{}
            for i := 0; i < step; i++ {
                rowGlasses = append(rowGlasses, glassPart)
            }

            result := strings.Join(rowGlasses, " ")
            leftSpace := strings.Repeat(" ", (width - len(result)) / 2)
            rightSpace := strings.Repeat(" ", width - len(result) - len(leftSpace))

            results = append(results, leftSpace + result + rightSpace)
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    for _, result := range results {
        fmt.Println(result)
    }
}

