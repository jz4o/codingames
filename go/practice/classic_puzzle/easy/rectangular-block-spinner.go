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

    var size int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&size)

    var angle int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&angle)

    grid := [][]string{}
    for i := 0; i < size; i++ {
        scanner.Scan()
        line := scanner.Text()
        // _ = line // to avoid unused error

        grid = append(grid, strings.Split(line, " "))
    }

    diagonalSize := size * 2 - 1
    rotateCount := ((angle - 45) % 360) / 90

    for i := 0; i < rotateCount; i++ {
        grid = anticlockwiseTurn90Degree(grid)
    }

    diamondGrid := [][]string{}
    for time := 1; time <= diagonalSize; time++ {
        start := 0
        if start < time - size {
            start = time - size
        }
        popRowSize := time
        if size * 2 - time < time {
            popRowSize = size * 2 - time
        }

        row := []string{}
        for s := 0; s < popRowSize; s++ {
            rowIndex := start + s
            row = append(row, grid[rowIndex][len(grid[rowIndex]) - 1])
            grid[rowIndex] = grid[rowIndex][:len(grid[rowIndex]) - 1]
        }
        diamondGrid = append(diamondGrid, row)
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    for _, diamondRow := range diamondGrid {
        fmt.Println(centerString(strings.Join(diamondRow, " "), diagonalSize, " "))
    }
}

// #  example.
// #
// #  input
// #
// #    1 2 3
// #    4 5 6
// #    7 8 9
// #
// #  output
// #
// #    3 6 9
// #    2 5 8
// #    1 4 7
func anticlockwiseTurn90Degree(slice [][]string) [][]string {
    result := [][]string{}
    for columnIndex := len(slice[0]) - 1; 0 <= columnIndex; columnIndex-- {
        row := []string{}
        for rowIndex := 0; rowIndex < len(slice); rowIndex++ {
            row = append(row, slice[rowIndex][columnIndex])
        }
        result = append(result, row)
    }

    return result
}

// examples.
//
// centerString("abc", 5, " ")
//     => " abc "
//
// centerString("abc", 4, " ")
//     => "abc "
//
// centerString("abc", 2, " ")
//     => "abc"
func centerString(str string, size int, pad string) string {
    spaceSize := size - len(str)
    if spaceSize <= 0 {
        return str
    }

    preSpace := strings.Repeat(pad, spaceSize / 2)
    sufSpace := strings.Repeat(pad, spaceSize - len(preSpace))

    return preSpace + str + sufSpace
}

