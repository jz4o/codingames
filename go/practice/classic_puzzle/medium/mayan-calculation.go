package main

import "fmt"

import "math"
import "regexp"
import "strconv"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var L, H int
    fmt.Scan(&L, &H)

    mayanBase := 20

    asciiMayans := make([]string, mayanBase)
    for i := 0; i < H; i++ {
        var numeral string
        fmt.Scan(&numeral)

        for rowIndex, mayan := range splitBy(numeral, L) {
            asciiMayans[rowIndex] += mayan
        }
    }
    var S1 int
    fmt.Scan(&S1)

    mayan1Str := ""
    for i := 0; i < S1; i++ {
        var num1Line string
        fmt.Scan(&num1Line)

        mayan1Str += num1Line
    }
    var S2 int
    fmt.Scan(&S2)

    mayan2Str := ""
    for i := 0; i < S2; i++ {
        var num2Line string
        fmt.Scan(&num2Line)

        mayan2Str += num2Line
    }
    var operation string
    fmt.Scan(&operation)

    mayanToInteger := map[string]int{}
    for i, mayan := range asciiMayans {
        mayanToInteger[mayan] = i
    }

    mayanLength := H * L

    num1 := 0
    for i, mayan := range reverse(splitBy(mayan1Str, mayanLength)) {
        num1 += mayanToInteger[mayan] * pow(mayanBase, i)
    }
    num2 := 0
    for i, mayan := range reverse(splitBy(mayan2Str, mayanLength)) {
        num2 += mayanToInteger[mayan] * pow(mayanBase, i)
    }

    resultNum := 0
    switch operation {
        case "+":
            resultNum = num1 + num2
        case "-":
            resultNum = num1 - num2
        case "*":
            resultNum = num1 * num2
        case "/":
            resultNum = num1 / num2
    }

    resultStr := ""
    for {
        resultStr = asciiMayans[resultNum % mayanBase] + resultStr
        resultNum = resultNum / mayanBase

        if resultNum <= 0 {
            break
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("result")// Write answer to stdout
    for _, resultRow := range splitBy(resultStr, L) {
        fmt.Println(resultRow)
    }
}

func splitBy(text string, size int) []string {
    return regexp.MustCompile(".{" + strconv.Itoa(size) + "}").FindAllString(text, -1)
}

func reverse(slice []string) []string {
    result := []string{}
    for _, elm := range slice {
        result = append([]string{elm}, result...)
    }

    return result
}

func pow(x int, y int) int {
    return int(math.Pow(float64(x), float64(y)))
}

