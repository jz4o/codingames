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

    var N int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&N)

    grid := [][]string{}
    for i := 0; i < N; i++ {
        scanner.Scan()
        line := scanner.Text()
        _ = line // to avoid unused error

        grid = append(grid, strings.Split(line, ""))
    }

    width := 0
    for _, row := range grid {
        if width < len(row) {
            width = len(row)
        }
    }
    width += 2

    for i := 0; i < len(grid); i++ {
        for len(grid[i]) < width {
            grid[i] = append(grid[i], " ")
        }
    }

    for i := 0; i < 2; i++ {
        row := []string{}
        for w := 0; w < width; w++ {
            row = append(row, " ")
        }

        grid = append(grid, row)
    }

    for rowIndex := N + 1; rowIndex >= 0; rowIndex-- {
        for columnIndex := width - 1; columnIndex >= 0; columnIndex-- {
            if grid[rowIndex][columnIndex] != " " {
                continue
            }

            if rowIndex >= 2 && columnIndex >= 2 && grid[rowIndex - 2][columnIndex - 2] != " " {
                grid[rowIndex][columnIndex] = "`"
            }

            if rowIndex >= 1 && columnIndex >= 1 && grid[rowIndex - 1][columnIndex - 1] != " " {
               grid[rowIndex][columnIndex] = "-"
            }
        }
    }

    for _, row := range grid {
        result := strings.TrimRight(strings.Join(row, ""), " ")
        fmt.Println(result)
    }
}
