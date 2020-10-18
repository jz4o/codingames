package main

import "fmt"
import "os"
import "bufio"
import "strings"
import "strconv"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    var W int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&W)

    var H int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&H)

    var grid [][]int
    var gridLine []int
    for i := 0; i < W + 2; i++ {
        gridLine = append(gridLine, 1)
    }
    grid = append(grid, gridLine)
    for i := 0; i < H; i++ {
        var gridLine []int
        gridLine = append(gridLine, 1)

        scanner.Scan()
        inputs := strings.Split(scanner.Text()," ")
        for j := 0; j < W; j++ {
            v,_ := strconv.ParseInt(inputs[j],10,32)
            _ = v

            gridLine = append(gridLine, (int)(v))
        }

        gridLine = append(gridLine, 1)

        grid = append(grid, gridLine)
    }
    grid = append(grid, gridLine)
    fmt.Fprintln(os.Stderr, grid)

    var result string

    SearchLoop:
    for h := 1; h <= H; h++ {
        for w := 1; w <= W; w++ {
            if grid[h][w] != 0 {
                continue
            }

            aroundMasses := []int{
                grid[h - 1][w - 1],
                grid[h - 1][w],
                grid[h - 1][w + 1],
                grid[h][w - 1],
                grid[h][w + 1],
                grid[h + 1][w - 1],
                grid[h + 1][w],
                grid[h + 1][w + 1]}

            if contains(aroundMasses, 0) {
                continue
            }

            result = strconv.Itoa(w - 1) + " " + strconv.Itoa(h - 1)
            break SearchLoop
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("x y")// Write answer to stdout
    fmt.Println(result)
}

func contains(slice []int, target int) bool {
    for _, v := range slice {
        if v == target {
            return true
        }
    }

    return false
}

