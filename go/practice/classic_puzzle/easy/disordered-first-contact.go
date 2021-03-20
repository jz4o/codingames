package main

import "fmt"
import "os"
import "bufio"

import "math"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    var N int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&N)

    scanner.Scan()
    MESSAGE := scanner.Text()
    // _ = MESSAGE // to avoid unused error

    result := MESSAGE
    for i := 0; i < int(math.Abs(float64(N))); i++ {
        if 0 < N {
            result = decode(result)
         } else {
            result = encode(result)
         }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(result)
}

func decode(text string) string {
    tempText := text
    result := ""
    turn := 1

    sum := turn
    for sum < len(tempText) {
        turn++
        sum += turn
    }

    for 0 < turn {
        turnSum := 0
        for i := 1; i <= turn - 1; i++ {
            turnSum += i
        }
        sliceSize := len(tempText) - turnSum

        if turn % 2 == 1 {
            result = tempText[len(tempText) - sliceSize:] + result
            tempText = tempText[0:len(tempText) - sliceSize]
        } else {
            result = tempText[0:sliceSize] + result
            tempText = tempText[sliceSize:]
        }

        turn--
    }

    return result
}

func encode(text string) string {
    tempText := text
    result := ""
    turn := 1

    for len(tempText) != 0 {
        sliceSize := turn
        if len(tempText) < sliceSize {
            sliceSize = len(tempText)
        }

        if turn % 2 == 1 {
            result += tempText[0:sliceSize]
        } else {
            result = tempText[0:sliceSize] + result
        }
        tempText = tempText[sliceSize:]

        turn++
    }

    return result
}

