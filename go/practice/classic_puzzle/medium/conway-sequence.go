package main

import "fmt"

import "strconv"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var R int
    fmt.Scan(&R)

    var L int
    fmt.Scan(&L)

    result := []string{ strconv.Itoa(R) }
    for i := 1; i < L; i++ {
        temp := result
        result = nil

        for len(temp) > 0 {
            firstElement := temp[0]

            deleteSize := len(temp)
            for i, t := range temp {
                if t != firstElement {
                    deleteSize = i
                    break
                }
            }

            result = append(result, strconv.Itoa(deleteSize), firstElement)
            temp = temp[deleteSize:]
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(strings.Join(result, " "))
}

