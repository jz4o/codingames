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

    var M int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&M)

    var N int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&N)

    var grid [][]int
    var gridRow []int
    for i := 0; i < N + 1; i++ {
        gridRow = append(gridRow, )
    }
    grid = append(grid, gridRow)
    for i := 0; i < M; i++ {
        scanner.Scan()
        ROW := scanner.Text()

        var gridRow []int
        gridRow = append(gridRow, 1)
        for _, c := range strings.Split(ROW, "") {
            d, _ := strconv.Atoi(c)
            gridRow = append(gridRow, d)
        }

        grid = append(grid, gridRow)
    }

    var pathGrid [][]int
    for i := 0; i < M + 1; i++ {
        var pathGridRow []int
        for j := 0; j < N + 1; j++ {
            pathGridRow = append(pathGridRow, 0)
        }

        pathGrid = append(pathGrid, pathGridRow)
    }

    grid[1][1] = 1
    pathGrid[1][1] = 1
    for row := 1; row <= M; row++ {
        for column := 1; column <= N; column++ {
            if grid[row][column] != 0 {
                continue
            }

            topMassPaths := pathGrid[row - 1][column]
            leftMassPaths := pathGrid[row][column - 1]
            pathGrid[row][column] = topMassPaths + leftMassPaths
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(pathGrid[M][N])
}

