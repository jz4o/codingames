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

    var n int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&n)

    grid := [][]int{}
    for i := 0; i < n; i++ {
        row := []int{}
        scanner.Scan()
        inputs := strings.Split(scanner.Text()," ")
        for j := 0; j < n; j++ {
            c,_ := strconv.ParseInt(inputs[j],10,32)
            // _ = c

            row = append(row, int(c))
        }

        grid = append(grid, row)
    }

    expectAllSum := 0
    for i := 1; i <= n * n; i++ {
        expectAllSum += i
    }

    allSum := 0
    for _, row := range grid {
        allSum += sum(row)
    }

    isCheckAllSum := allSum == expectAllSum

    downwardToRightLine := []int{}
    for i := 0; i < n; i++ {
        downwardToRightLine = append(downwardToRightLine, grid[i][i])
    }
    risingToRightLine := []int{}
    for i := 0; i < n; i++ {
        risingToRightLine = append(risingToRightLine, grid[n - i - 1][i])
    }

    eachLine := [][]int{}
    eachLine = append(eachLine, grid...)
    eachLine = append(eachLine, transpose(grid)...)
    eachLine = append(eachLine, downwardToRightLine)
    eachLine = append(eachLine, risingToRightLine)

    isCheckEachLineSums := true
    for _, line := range eachLine {
        if sum(line) != expectAllSum / n {
            isCheckEachLineSums = false
            break
        }
    }

    result := "MUGGLE"
    if isCheckAllSum && isCheckEachLineSums {
        result = "MAGIC"
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(result)
}

func transpose(slice [][]int) [][]int {
    result := [][]int{}
    for columnIndex := 0; columnIndex < len(slice[0]); columnIndex++ {
        row := []int{}
        for rowIndex := 0; rowIndex < len(slice); rowIndex++ {
            row = append(row, slice[rowIndex][columnIndex])
        }

        result = append(result, row)
    }

    return result
}

func sum(slice []int) int {
    result := 0
    for _, elm := range slice {
        result += elm
    }

    return result
}

