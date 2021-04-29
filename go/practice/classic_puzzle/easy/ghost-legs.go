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

    var W, H int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&W, &H)

    grid := [][]string{}
    for i := 0; i < H; i++ {
        scanner.Scan()
        line := scanner.Text()
        // _ = line // to avoid unused error

        row := []string{}
        chars := append([]string{" "}, strings.Split(line, "")...)
        for index, char := range chars {
            if index == len(chars) - 1 || char != chars[index + 1] {
                row = append(row, char)
            }
        }

        grid = append(grid, row)
    }

    topRow := grid[0]
    bottomRow := grid[len(grid) - 1]
    grid = grid[1:len(grid) - 1]

    for rowIndex := len(grid) - 1; rowIndex >= 0; rowIndex-- {
        for columnIndex, char := range grid[rowIndex] {
            if char == "-" {
                bottomRow[columnIndex - 1], bottomRow[columnIndex + 1] = bottomRow[columnIndex + 1], bottomRow[columnIndex - 1]
            }
        }
    }

    results := []string{}
    for index, char := range topRow {
        if char != " " {
            results = append(results, char + bottomRow[index])
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    for _, result := range results {
        fmt.Println(result)
   }
}

