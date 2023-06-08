package main

import "fmt"
import "os"
import "bufio"

import "math"
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
    x := scanner.Text()
    _ = x // to avoid unused error
    var n int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&n)

    xElements := strings.Split(x, "-")
    ab := xElements[0]
    cde, _ := strconv.Atoi(xElements[1])
    fg := xElements[2]

    alpha := ab + fg
    alphaInt := alphaToInt(alpha)
    cde += n - 1

    carry := cde / 999
    cde = cde % 999
    alphaInt += carry
    alpha = intToAlpha(alphaInt)

    ab = alpha[0:2]
    cdeStr := fmt.Sprintf("%03d", cde + 1)
    fg = alpha[len(alpha) - 2:]

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("AA-000-AA")// Write answer to stdout
    fmt.Println(ab + "-" + cdeStr + "-" + fg)
}

func alphaToInt(alpha string) int {
    alphabets := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    result := 0
    for index := 0; index < len(alpha); index++ {
        char := string(alpha[len(alpha) - index - 1])
        alphaIndex := strings.Index(alphabets, char) + 1

        result += int(math.Pow(float64(len(alphabets)), float64(index))) * alphaIndex
    }

    return result
}

func intToAlpha(alphaInt int) string {
    alphabets := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    result := ""
    for alphaInt > 0 {
        i := alphaInt % len(alphabets)
        if i == 0 {
            i = len(alphabets)
            alphaInt--
        }

        temp := 0
        if alphaInt > len(alphabets) {
            temp = alphaInt / len(alphabets)
        }
        alphaInt = temp

        result = string(alphabets[i - 1]) + result
    }

    return result
}

