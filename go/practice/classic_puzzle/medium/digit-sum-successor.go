package main

import "fmt"

import "sort"
import "strconv"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var N int
    fmt.Scan(&N)

    digits := []int{}
    digits = append(digits, 0)
    for _, digit := range strings.Split(strconv.Itoa(N), "") {
        d, _ := strconv.Atoi(digit)
        digits = append(digits, d)
    }

    decrementIndex := -1
    for i := len(digits) - 1; i >= 0; i-- {
        if digits[i] != 0 {
            decrementIndex = i
            break
        }
    }
    digits[decrementIndex]--

    incrementIndex := -1
    for i := decrementIndex - 1; i >= 0; i-- {
        if digits[i] != 9 {
            incrementIndex = i
            break
        }
    }
    digits[incrementIndex]++

    sortTargets := digits[incrementIndex + 1:]
    sort.Ints(sortTargets)

    resultSlice := append(digits[:incrementIndex + 1], sortTargets...)
    resultStr := ""
    for _, digit := range resultSlice {
        resultStr += strconv.Itoa(digit)
    }
    result, _ := strconv.Atoi(resultStr)

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("11")// Write answer to stdout
    fmt.Println(result)
}

