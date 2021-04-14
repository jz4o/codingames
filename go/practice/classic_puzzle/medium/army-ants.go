package main

import "fmt"

import "strings"
import "math"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var N1, N2 int
    fmt.Scan(&N1, &N2)

    var S1 string
    fmt.Scan(&S1)

    var S2 string
    fmt.Scan(&S2)

    var T int
    fmt.Scan(&T)


    s1MovePartSize := int(math.Min(float64(len(S1)), float64(T)))
    s1MovePart := []string{}
    for _, char := range S1[0:s1MovePartSize] {
        s1MovePart = append([]string{string(char)}, s1MovePart...)
    }
    s2MovePartSize := int(math.Min(float64(len(S2)), float64(T)))
    s2MovePart := strings.Split(S2[0:s2MovePartSize], "")

    for len(s1MovePart) < T {
        s1MovePart = append([]string{""}, s1MovePart...)
    }
    for len(s2MovePart) < T {
        s2MovePart = append(s2MovePart, "")
    }

    sMovedPart := ""
    for i := 0; i < T; i++ {
        sMovedPart += s2MovePart[i]
        sMovedPart += s1MovePart[i]
    }

    s1NotMovePart := ""
    if len(S1) >= T {
        for _, char := range S1[T:] {
            s1NotMovePart = string(char) + s1NotMovePart
        }
    }
    s2NotMovePart := ""
    if len(S2) >= T {
        s2NotMovePart = S2[T:]
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(s1NotMovePart + sMovedPart + s2NotMovePart)
}

