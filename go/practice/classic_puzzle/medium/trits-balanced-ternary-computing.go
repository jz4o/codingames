package main

import "fmt"
import "os"
import "bufio"

import "math"
import "strconv"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    scanner.Scan()
    lhs := scanner.Text()
    _ = lhs // to avoid unused error
    scanner.Scan()
    op := scanner.Text()
    _ = op // to avoid unused error
    scanner.Scan()
    rhs := scanner.Text()
    _ = rhs // to avoid unused error

    decimalLhs := balanceToDecimal(lhs)
    decimalRhs := balanceToDecimal(rhs)
    if op == "<<" || op == ">>" {
        decimalRhs = int(math.Pow(3, float64(decimalRhs)))
    }

    decimalResult := 0
    switch op {
        case "+":
            decimalResult = decimalLhs + decimalRhs
        case "-":
            decimalResult = decimalLhs - decimalRhs
        case "*": fallthrough
        case "<<":
            decimalResult = decimalLhs * decimalRhs
        case ">>":
            decimalResult = decimalLhs / decimalRhs
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("11T")// Write answer to stdout
    fmt.Println(decimalToBalance(decimalResult))
}

func balanceToDecimal(balance string) int {
    chars := []string{}
    for i := len(balance) - 1; i >= 0; i-- {
        chars = append(chars, balance[i:i + 1])
    }

    result := 0
    for index, char := range chars {
        c := -1
        if char != "T" {
            c, _ = strconv.Atoi(char)
        }

        result += c * int(math.Pow(3, float64(index)))
    }

    return result
}

func decimalToBalance(decimal int) string {
    result := ""
    for decimal != 0 {
        mod := decimal % 3
        decimal = decimal / 3

        if mod == 2 {
            decimal++
            result = "T" + result
        } else {
            result = strconv.Itoa(mod) + result
        }
    }

    if result == "" {
        result = "0"
    }

    return result
}

