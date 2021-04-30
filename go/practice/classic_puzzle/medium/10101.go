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

    var W int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&W)

    var H int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&H)

    grid := [][]string{}
    for i := 0; i < H; i++ {
        scanner.Scan()
        ROW := scanner.Text()
        // _ = ROW // to avoid unused error

        grid = append(grid, strings.Split(ROW, ""))
    }

    horizontalBlockCount := []int{}
    for _, row := range grid {
        horizontalBlockCount = append(horizontalBlockCount, count(row, "#"))
    }
    verticalBlockCount := []int{}
    for _, row := range transpose(grid) {
        verticalBlockCount = append(verticalBlockCount, count(row, "#"))
    }

    filledHorizontalLineCount := 0
    for _, count := range horizontalBlockCount {
        if count == W {
            filledHorizontalLineCount++
        }
    }
    filledVerticalLineCount := 0
    for _, count := range verticalBlockCount {
        if count == H {
            filledVerticalLineCount++
        }
    }
    filledCount := filledHorizontalLineCount + filledVerticalLineCount

    result := 0
    for rowIndex := 0; rowIndex < H - 1; rowIndex++ {
        for columnIndex := 0; columnIndex < W - 1; columnIndex++ {
            putMasses := []string{
                grid[rowIndex][columnIndex],
                grid[rowIndex][columnIndex + 1],
                grid[rowIndex + 1][columnIndex],
                grid[rowIndex + 1][columnIndex + 1]}
            if count(putMasses, ".") != len(putMasses) {
                continue
            }

            newFilledLineCount := countOfTrue([]bool{
                horizontalBlockCount[rowIndex]      + 2 == W,
                horizontalBlockCount[rowIndex + 1]  + 2 == W,
                verticalBlockCount[columnIndex]     + 2 == H,
                verticalBlockCount[columnIndex + 1] + 2 == H})

            if result < filledCount + newFilledLineCount {
                result = filledCount + newFilledLineCount
            }
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(result)
}

func transpose(slice [][]string) [][]string {
    result := [][]string{}
    for columnIndex := 0; columnIndex < len(slice[0]); columnIndex++ {
        row := []string{}
        for rowIndex := 0; rowIndex < len(slice); rowIndex++ {
            row = append(row, slice[rowIndex][columnIndex])
        }

        result = append(result, row)
    }

    return result
}

func countOfTrue(slice []bool) int {
    result := 0
    for _, elm := range slice {
        if elm {
            result++
        }
    }

    return result
}

func count(slice []string, target string) int {
    result := 0
    for _, elm := range slice {
        if elm == target {
            result++
        }
    }

    return result
}

