package main

import "fmt"
import "os"
import "bufio"

import "math"
import "regexp"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    scanner.Scan()
    equality := scanner.Text()
    // _ = equality // to avoid unused error

    elms := regexp.MustCompile("[+=]").Split(equality, -1)
    x, y, z := elms[0], elms[1], elms[2]

    numerals := "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    maxNumeralIndex := -1
    for index, num := range numerals {
        if strings.Contains(equality, string(num)) {
            maxNumeralIndex = index
        }
    }
    maxNumeralIndex++

    result := -1
    for i := maxNumeralIndex; i <= len(numerals); i++ {
        numeralX := toDecimal(x, i)
        numeralY := toDecimal(y, i)
        numeralZ := toDecimal(z, i)

        if numeralX + numeralY == numeralZ {
            result = i
            break
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(result)
}

func toDecimal(numeral string, base int) int {
    numerals := "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    nums := strings.Split(numeral, "")
    reverseNums := []string{}
    for i := len(nums) - 1; i >= 0; i-- {
        reverseNums = append(reverseNums, nums[i])
    }

    result := 0
    for baseIndex, num := range reverseNums {
        result += int(math.Pow(float64(base), float64(baseIndex))) * strings.Index(numerals, string(num))
    }

    return result
}

