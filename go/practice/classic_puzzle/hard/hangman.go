package main

import "fmt"
import "os"
import "bufio"

import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    scanner.Scan()
    word := scanner.Text()
    // _ = word // to avoid unused error
    scanner.Scan()
    chars := scanner.Text()
    // _ = chars // to avoid unused error

    beam := "+--+"
    noHead := "|"
    head := "|  o"
    noBody := "|"
    body := "|  |"
    oneArm := "| /|"
    bothArm := "| /|\\"
    noLeg := "|\\"
    oneLeg := "|\\/"
    bothLeg := "|\\/ \\"
    hangmanStatuses := [][]string{
        []string{beam, noHead, noBody, noLeg},
        []string{beam, head, noBody, noLeg},
        []string{beam, head, body, noLeg},
        []string{beam, head, oneArm, noLeg},
        []string{beam, head, bothArm, noLeg},
        []string{beam, head, bothArm, oneLeg},
        []string{beam, head, bothArm, bothLeg}}

    // answer to guess
    result := ""
    for _, char := range strings.Split(word, "") {
        if strings.Contains(chars, strings.ToLower(string(char))) {
            result += string(char)
        } else {
            result += "_"
        }
    }

    // counting errors of guess
    lowerWord := strings.ToLower(word)
    errors := 0
    for _, char := range strings.Split(chars, " ") {
        if strings.Contains(lowerWord, string(char)) {
            lowerWord = strings.ReplaceAll(lowerWord, string(char), "")
        } else {
            errors++
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    for _, hangmanRow := range hangmanStatuses[errors] {
        fmt.Println(hangmanRow)
    }
    fmt.Println(result)
}

