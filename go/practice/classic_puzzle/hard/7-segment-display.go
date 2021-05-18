package main

import "fmt"
import "os"
import "bufio"

import "strconv"
import "strings"

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
    C := scanner.Text()
    // _ = C // to avoid unused error
    var S int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&S)

    answer := [][]string{}
    for _, strDigit := range strings.Split(strconv.Itoa(N), "") {
        digit, _ := strconv.Atoi(strDigit)

        tl := strings.Repeat(getSegmentChar(digit, "tl", C), S)
        bl := strings.Repeat(getSegmentChar(digit, "bl", C), S)
        leftRows := strings.Split(" " + tl + " " + bl + " ", "")
        answer = append(answer, leftRows)

        top := getSegmentChar(digit, "t", C)
        center := getSegmentChar(digit, "c", C)
        bottom := getSegmentChar(digit, "b", C)
        space := strings.Repeat(" ", S)
        centerRows := strings.Split(top + space + center + space + bottom, "")
        for i := 0; i < S; i++ {
            answer = append(answer, centerRows)
        }

        tr := strings.Repeat(getSegmentChar(digit, "tr", C), S)
        br := strings.Repeat(getSegmentChar(digit, "br", C), S)
        rightRows := strings.Split(" " + tr + " " + br + " ", "")
        answer = append(answer, rightRows)

        spaceRows := strings.Split(strings.Repeat(" ", S * 2 + 3), "")
        answer = append(answer, spaceRows)
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    for _, row := range transpose(answer) {
        result := strings.Join(row, "")

        fmt.Println(strings.TrimRight(result, " "))
    }
}

func getSegmentChar(num int, pos string, c string) string {
    segments := [][]string{
        []string{"t", "tl", "tr",      "bl", "br", "b"},
        []string{           "tr",            "br"     },
        []string{"t",       "tr", "c", "bl",       "b"},
        []string{"t",       "tr", "c",       "br", "b"},
        []string{     "tl", "tr", "c",       "br"     },
        []string{"t", "tl",       "c",       "br", "b"},
        []string{"t", "tl",       "c", "bl", "br", "b"},
        []string{"t", "tr",                  "br"     },
        []string{"t", "tl", "tr", "c", "bl", "br", "b"},
        []string{"t", "tl", "tr", "c",       "br", "b"}}

    result := " "
    if contains(segments[num], pos) {
        result = c
    }

    return result
}

func contains(slice []string, target string) bool {
    for _, elm := range slice {
        if elm == target {
            return true
        }
    }

    return false
}

func transpose(slice [][]string) [][]string {
    result := [][]string{}
    for columnIndex := 0; columnIndex < len(slice[0]); columnIndex++ {
        row := []string{}
        for rowIndex := 0; rowIndex < len(slice); rowIndex++ {
            row = append(row, slice[rowIndex][columnIndex])
        }

        result = append(result, row)
    }

    return result
}

