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
    alignment := scanner.Text()
    // _ = alignment // to avoid unused error
    var N int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&N)

    texts := []string{}
    for i := 0; i < N; i++ {
        scanner.Scan()
        text := scanner.Text()
        // _ = text // to avoid unused error

        texts = append(texts, text)
    }

    width := 0
    for _, text := range texts {
        if len(text) > width {
            width = len(text)
        }
    }

    results := []string{}
    switch alignment {
        case "LEFT":
            results = texts
        case "RIGHT":
            for _, text := range texts {
                space := strings.Repeat(" ", width - len(text))

                results = append(results, space + text)
            }
        case "CENTER":
            for _, text := range texts {
                space := strings.Repeat(" ", (width - len(text) + 1) / 2)

                results = append(results, space + text)
            }
        case "JUSTIFY":
            for _, text := range texts {
                results = append(results, justifyText(text, width))
            }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    for _, result := range results {
        fmt.Println(result)
    }
}

func justifyText(text string, width int) string {
    if len(text) == width {
        return text
    }

    words := strings.Split(text, " ")
    spaceSize := width - len(strings.Join(words, ""))
    eachSpaceSize := (spaceSize / (len(words) - 1))

    result := ""
    for index, word := range words {
        space := ""
        if index < len(words) - 1 {
            space = strings.Repeat(" ", eachSpaceSize)
        }

        result += word + space
    }

    return result
}

