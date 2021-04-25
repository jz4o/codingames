package main

import "fmt"

import "sort"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var width, height int
    fmt.Scan(&width, &height)

    grid := [][]string{}
    for i := 0; i < height; i++ {
        var line string
        fmt.Scan(&line)

        grid = append(grid, strings.Split(line, ""))
    }

    transposedGrid := transpose(grid)
    for index, row := range transposedGrid {
        sort.Strings(row)
        transposedGrid[index] = reverse(row)
    }
    movedGrid := transpose(transposedGrid)

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    for _, row := range movedGrid {
        fmt.Println(strings.Join(row, ""))
    }
}

func transpose(slice [][]string) [][]string {
    result := [][]string{}
    for columnIndex := 0; columnIndex < len(slice[0]); columnIndex++ {
        row := []string{}
        for rowIndex := 0; rowIndex < len(slice); rowIndex++ {
            row = append(row, slice[rowIndex][columnIndex])
        }

        result = append(result, row)
    }

    return result
}

func reverse(slice []string) []string {
    result := []string{}
    for _, elm := range slice {
        result = append([]string{elm}, result...)
    }

    return result
}

