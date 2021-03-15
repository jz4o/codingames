package main

import "fmt"
import "os"
import "bufio"

import "regexp"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    scanner.Scan()
    intext := scanner.Text()
    // _ = intext // to avoid unused error

    requirePeriod := strings.HasSuffix(intext, ".")

    intext = strings.ToLower(intext)

    intext = strings.Replace(intext, ",", ", ", -1)
    intext = regexp.MustCompile(`\s+`).ReplaceAllString(intext, " ")

    var sentences []string
    for _, sentence := range strings.Split(intext, ".") {
        sentence := strings.TrimSpace(sentence)
        if len(sentence) > 0 {
            sentence = strings.ToUpper(sentence[0:1]) + sentence[1:]
            sentences = append(sentences, sentence)
        }
    }
    intext = strings.Join(sentences, ". ")

    intext = strings.Replace(intext, " ,", ",", -1)
    intext = regexp.MustCompile(`,+`).ReplaceAllString(intext, ",")

    if requirePeriod {
        intext += "."
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("solution")// Write answer to stdout
    fmt.Println(intext)
}

