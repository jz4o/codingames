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

    var W, H int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&W, &H)

    grid := [][]int{}
    for i := 0; i < H; i++ {
        row := []int{}

        scanner.Scan()
        inputs := strings.Split(scanner.Text()," ")
        for j := 0; j < W; j++ {
            food,_ := strconv.ParseInt(inputs[j],10,32)
            // _ = food

            row = append(row, int(food))
        }

        grid = append(grid, row)
    }

    for height := 0; height < H; height++ {
        for width := 0; width < W; width++ {
            top := 0
            if height != 0 {
                top = grid[height - 1][width]
            }
            left := 0
            if width != 0 {
                left = grid[height][width - 1]
            }

            max := top
            if max < left {
                max = left
            }
            grid[height][width] += max
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(grid[H - 1][W - 1])
}

