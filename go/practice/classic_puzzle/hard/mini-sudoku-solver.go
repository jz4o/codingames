package main

import "fmt"

import "math"
import "strconv"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var line1 string
    fmt.Scan(&line1)

    var line2 string
    fmt.Scan(&line2)

    var line3 string
    fmt.Scan(&line3)

    var line4 string
    fmt.Scan(&line4)

    square := [][]int{}
    for _, line := range []string{line1, line2, line3, line4} {
        row := []int{}
        for _, c := range strings.Split(line, "") {
            i, _ := strconv.Atoi(c)

            row = append(row, i)
        }

        square = append(square, row)
    }

    expectSum := 0
    for i := 1; i <= len(square); i++ {
        expectSum += i
    }
    expectSum *= len(square)

    squareSum := 0
    for _, row := range square {
        for _, i := range row {
            squareSum += i
        }
    }

    for expectSum != squareSum {
        for rowIndex, row := range square {
            for columnIndex, i := range row {
                if i != 0 {
                    continue
                }

                verticalLine := []int{}
                for _, horizontalLine := range square {
                    verticalLine = append(verticalLine, horizontalLine[columnIndex])
                }

                littleSquareRows := []int{}
                if rowIndex < int(math.Floor(float64(len(square)) / 2.0)) {
                    littleSquareRows = append(littleSquareRows, []int{0, 1}...)
                } else {
                    littleSquareRows = append(littleSquareRows, []int{2, 3}...)
                }

                littleSquareColumns := []int{}
                if columnIndex < int(math.Floor(float64(len(square)) / 2.0)) {
                    littleSquareColumns = append(littleSquareColumns, []int{0, 1}...)
                } else {
                    littleSquareColumns = append(littleSquareColumns, []int{2, 3}...)
                }

                littleSquare := []int{}
                for _, littleSquareRow := range littleSquareRows {
                    for _, littleSquareColumn := range littleSquareColumns {
                        littleSquare = append(littleSquare, square[littleSquareRow][littleSquareColumn])
                    }
                }

                candidate := []int{1, 2, 3, 4}
                for candidateIndex := len(candidate) - 1; candidateIndex >= 0; candidateIndex-- {
                    c := candidate[candidateIndex]
                    if contains(row, c) || contains(verticalLine, c) || contains(littleSquare, c) {
                        candidate = remove(candidate, candidateIndex)
                    }
                }

                if len(candidate) == 1 {
                    square[rowIndex][columnIndex] = candidate[0]
                    squareSum += candidate[0]
                }
            }
        }
    }

    strSquare := [][]string{}
    for _, row := range square {
        strRow := []string{}
        for _, i := range row {
            strRow = append(strRow, strconv.Itoa(i))
        }

        strSquare = append(strSquare, strRow)
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    for _, strRow := range strSquare {
        fmt.Println(strings.Join(strRow, ""))
    }
}

func contains(slice []int, target int) bool {
    for _, elm := range slice {
        if elm == target {
            return true
        }
    }

    return false
}

func remove(slice []int, index int) []int {
    return append(slice[:index], slice[index + 1:]...)
}

