package main

import "fmt"

import "regexp"
import "strconv"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var N int
    fmt.Scan(&N)

    var X int
    fmt.Scan(&X)

    grid := [][]string{}
    for i := 0; i < N; i++ {
        var LINE string
        fmt.Scan(&LINE)

        grid = append(grid, strings.Split(LINE, ""))
    }

    // array to string
    chars := ""
    for index, row := range transpose(grid) {
        if index % 2 == 0 {
            chars += strings.Join(reverse(row), "")
        } else {
            chars += strings.Join(row, "")
        }
    }

    // rotate
    beginIndex  := len(chars) - X
    chars = strings.Repeat(chars, 2)[beginIndex:beginIndex + len(chars)]

    // string to array
    rotatedGrid := [][]string{}
    for index, row := range regexp.MustCompile(".{" + strconv.Itoa(N) + "}").FindAllString(chars, -1) {
        if index % 2 == 0 {
            rotatedGrid = append(rotatedGrid, reverse(strings.Split(row, "")))
        } else {
            rotatedGrid = append(rotatedGrid, strings.Split(row, ""))
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    for _, row := range transpose(rotatedGrid) {
        fmt.Println(strings.Join(row, ""))
    }
}

func transpose(grid [][]string) [][]string {
    result := [][]string{}
    for columnIndex := 0; columnIndex < len(grid[0]); columnIndex++ {
        row := []string{}
        for rowIndex := 0; rowIndex < len(grid); rowIndex++ {
            row = append(row, grid[rowIndex][columnIndex])
        }

        result = append(result, row)
    }

    return result
}

func reverse(array []string) []string {
    result := []string{}
    for _, elm := range array {
        result = append([]string{elm}, result...)
    }

    return result
}

