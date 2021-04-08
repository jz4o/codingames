package main

import "os"
import "bufio"

import "fmt"
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
    text := scanner.Text()
    // _ = text // to avoid unused error
    scanner.Scan()
    format := scanner.Text()
    // _ = format // to avoid unused error

    format = strings.Replace(format, "\\", "\\\\", -1)
    for _, spesialString := range []string{"^", "*", "(", ")", "[", "]", "{", "}", "$", "|"} {
        format = strings.Replace(format, spesialString, "\\" + spesialString, -1)
    }
    format = strings.Replace(format, "?", ".", -1)
    format = strings.Replace(format, "~", ".*", -1)

    result := "FAIL"
    if regexp.MustCompile(format).MatchString(text) {
        result = "MATCH"
    }

    fmt.Println(result)
}

