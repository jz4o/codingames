package main

import "fmt"
import "os"
import "bufio"

import "regexp"
import "sort"
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
    input := scanner.Text()
    _ = input // to avoid unused error

    minusFlag := strings.Contains(input, "-")
    dotFlag := strings.Contains(input, ".")
    input = regexp.MustCompile("[^\\d]").ReplaceAllString(input, "")
    inputs := strings.Split(input, "")

    if minusFlag {
        sort.Strings(inputs)
        if dotFlag {
            inputs = append([]string{string(inputs[0]), "."}, inputs[1:]...)
        }
        inputs = append([]string{"-"}, inputs...)
        if regexp.MustCompile("^-0\\.0+$").MatchString(strings.Join(inputs, "")) {
            inputs = []string{"0"}
        }
    } else {
        sort.Strings(inputs)
        inputs = reverse(inputs)
        if dotFlag {
            inputs = append(inputs[:len(inputs) - 1], []string{".", string(inputs[len(inputs) - 1])}...)
        }
        if strings.Join(inputs[len(inputs) - 2:], "") == ".0" {
            inputs = inputs[:len(inputs) - 2]
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("greatest")// Write answer to stdout
    fmt.Println(strings.Join(inputs, ""))
}

func reverse(slice []string) []string {
    result := []string{}
    for _, elm := range slice {
        result = append([]string{elm}, result...)
    }

    return result
}

