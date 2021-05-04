package main

import "fmt"
import "os"
import "bufio"

import "math/big"
import "strconv"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    scanner.Scan()
    NUMBER := scanner.Text()
    // _ = NUMBER // to avoid unused error
    numbers := []int{}
    for _, i := range strings.Split(NUMBER, " ") {
        intI, _ := strconv.Atoi(i)
        numbers = append(numbers, intI)
    }
    nbanswer := 36
    for base := 0; base < nbanswer; base++ {
        nextFlag := false
        for _, i := range numbers {
            if base <= i {
                nextFlag = true
                break
            }
        }
        if nextFlag {
            continue
        }

        baseNumber := ""
        for _, i := range numbers {
            baseNumber += decimalToBase(i, base)
        }

        decimalNumber := baseToDecimal(baseNumber, base)

        strDecimalNumber := decimalNumber.String()
        for i := 1; i <= len(strDecimalNumber); i++ {
            decimal := new(big.Int)
            decimal, _ = decimal.SetString(strDecimalNumber[0:i], 10)

            mod := decimal.Mod(decimal, big.NewInt(int64(i)))
            if mod.String() != "0" {
                nextFlag = true
                break
            }
        }
        if nextFlag {
            continue
        }

        // fmt.Fprintln(os.Stderr, "Debug messages...")
        // fmt.Println("value")// Write answer to stdout
        fmt.Println(base)
    }
}

func decimalToBase(num int, base int) string {
    digits := strings.Split("0123456789abcdefghijklmnopqrstuvwxyz", "")

    result := ""
    for 0 < num {
        mod := digits[num % base]
        result = mod + result
        num /= base
    }
    if result == "" {
        result = "0"
    }

    return result
}

func baseToDecimal(baseNum string, base int) *big.Int {
    digits := strings.Split("0123456789abcdefghijklmnopqrstuvwxyz", "")

    result := big.NewInt(0)

    reversedDigits := reverse(strings.Split(baseNum, ""))
    for index, digit := range reversedDigits {
        decimalDigit := big.NewInt(int64(indexOf(digits, digit)))

        digitBase := big.NewInt(int64(base))
        digitBase = digitBase.Exp(digitBase, big.NewInt(int64(index)), nil)

        result = result.Add(result, digitBase.Mul(digitBase, decimalDigit))
    }

    return result
}

func reverse(slice []string) []string {
    result := []string{}
    for _, elm := range slice {
        result = append([]string{elm}, result...)
    }

    return result
}

func indexOf(slice []string, target string) int {
    for index, elm := range slice {
        if elm == target {
            return index
        }
    }

    return -1
}

