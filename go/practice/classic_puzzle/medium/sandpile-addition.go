package main

import "fmt"
import "os"
import "bufio"

import "strconv"
import "strings"

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

    var grid [][]int
    for i := 0; i < n; i++ {
        scanner.Scan()
        row := scanner.Text()

        var line []int
        for _, c := range strings.Split(row, "") {
            d, _ := strconv.Atoi(c)
            line = append(line, d)
        }
        grid = append(grid, line)
    }
    for i := 0; i < n; i++ {
        scanner.Scan()
        row := scanner.Text()

        for ci, c := range strings.Split(row, "") {
            d, _ := strconv.Atoi(c)
            grid[i][ci] += d
        }
    }

    border := 4
    for isNotSandpile(grid, border) {
        for rowIndex, row := range grid {
            for columnIndex, d := range row {
                if d < border {
                    continue
                }

                grid[rowIndex][columnIndex] -= border
                if rowIndex > 0 { grid[rowIndex - 1][columnIndex]++ }
                if rowIndex + 1 != n { grid[rowIndex + 1][columnIndex]++ }
                if columnIndex > 0 { grid[rowIndex][columnIndex - 1]++ }
                if columnIndex + 1 != n { grid[rowIndex][columnIndex + 1]++ }
            }
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    for _, row := range grid {
        var strRow []string
        for _, d := range row {
            strRow = append(strRow, strconv.Itoa(d))
        }

        fmt.Println(strings.Join(strRow, ""))
    }
}

func isNotSandpile(grid [][]int, border int) bool {
    for _, row := range grid {
        for _, d := range row {
            if d >= border {
                return true
            }
        }
    }

    return false
}

