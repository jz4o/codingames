package main

import "fmt"

import "math"
import "strconv"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var N int
    fmt.Scan(&N)

    baseNum := 3

    basedNum := convertDecimalToBase(int(math.Abs(float64(N))), baseNum)
    basedDigits := []string{}
    for i := len(basedNum) - 1; i >= 0; i-- {
        basedDigits = append(basedDigits, string(basedNum[i]))
    }

    reverseResult := []int{}
    for index, digit := range basedDigits {
        if len(reverseResult) <= index {
            reverseResult = append(reverseResult, 0)
        }
        intDigit, _ := strconv.Atoi(digit)
        reverseResult[index] = reverseResult[index] + intDigit

        // carry up
        if baseNum - 1 <= reverseResult[index] {
            reverseResult[index] -= baseNum

            if len(reverseResult) <= index + 1 {
                reverseResult = append(reverseResult, 0)
            }

            reverseResult[index + 1] = 1
        }
    }

    result := ""
    for _, digit := range reverseResult {
        if N < 0 {
            digit = digit * -1
        }

        if digit < 0 {
            result = "T" + result
        } else {
            result = strconv.Itoa(digit) + result
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("42")// Write answer to stdout
    fmt.Println(result)
}

func convertDecimalToBase(decimal int, base int) string {
    result := ""
    for decimal > 0 {
        mod := decimal % base
        result = strconv.Itoa(mod) + result

        decimal = decimal / base
    }

    if len(result) == 0 {
        result = "0"
    }

    return result
}

