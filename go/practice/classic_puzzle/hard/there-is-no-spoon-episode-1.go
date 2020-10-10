package main

import "fmt"
import "os"
import "bufio"

import "strconv"
import "strings"

/**
 * Don't let the machines win. You are humanity's last hope...
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    // width: the number of cells on the X axis
    var width int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&width)

    // height: the number of cells on the Y axis
    var height int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&height)

    var grid [][]string
    for i := 0; i < height; i++ {
        scanner.Scan()
        line := scanner.Text() // width characters, each either 0 or .

        grid = append(grid, strings.Split(line, ""))
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")

    var results []string
    for h := 0; h < height; h++ {
        for w := 0; w < width; w++ {
            if grid[h][w] == "." {
                continue
            }

            currentNode := strconv.Itoa(w) + " " + strconv.Itoa(h)

            rightIndex := -1
            for r := w + 1; r < width; r++ {
                if grid[h][r] == "0" {
                    rightIndex = r
                    break
                }
            }
            rightNode := "-1 -1"
            if rightIndex != -1 {
                rightNode = strconv.Itoa(rightIndex) + " " + strconv.Itoa(h)
            }

            bottomIndex := -1
            for b := h + 1; b < height; b++ {
                if grid[b][w] == "0" {
                    bottomIndex = b
                    break
                }
            }
            bottomNode := "-1 -1"
            if bottomIndex != -1 {
                bottomNode = strconv.Itoa(w) + " " + strconv.Itoa(bottomIndex)
            }

            results = append(results, currentNode + " " + rightNode + " " + bottomNode)
        }
    }

    // Three coordinates: a node, its right neighbor, its bottom neighbor
    // fmt.Println("0 0 1 0 0 1")
    for _, result := range results {
        fmt.Println(result)
    }
}

