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

    var H int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&H)

    var grid [][]string
    for i := 0; i < H; i++ {
        scanner.Scan()
        S := scanner.Text()

        grid = append(grid, strings.Split(S, ""))
    }

    result := "UNSTABLE"
    if isStable(grid) {
        result = "STABLE"
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("UNSTABLE")// Write answer to stdout
    fmt.Println(result)
}

func isStable(grid [][]string) (bool) {
    leftPart := "/"
    rightPart := "\\"
    partEmpty := "."

    height := len(grid)
    width := len(grid[0])

    for h := 0; h < height; h++ {
        isBottomRow := h == height - 1

        for w := 0; w < width; w++ {
            card := grid[h][w]
            if card == partEmpty {
                continue
            }

            isRightPart := card == rightPart
            var sideCard string
            if isRightPart && w != 0 {
                sideCard = grid[h][w - 1]
            } else if w != width - 1 {
                sideCard = grid[h][w + 1]
            }
            var partnerPart string
            if isRightPart {
                partnerPart = leftPart
            } else {
                partnerPart = rightPart
            }

            checkSideCard := sideCard == partnerPart
            checkUnderCard := isBottomRow || grid[h + 1][w] == partnerPart

            if !checkSideCard || !checkUnderCard {
                return false
            }
        }
    }

    return true
}

