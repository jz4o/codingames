package main

import "fmt"
import "os"
import "bufio"

import "regexp"
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
    MESSAGE := scanner.Text()
    // _ = MESSAGE // to avoid unused error

    binaries := ""
    for _, char := range MESSAGE {
        binary, _ := strconv.Atoi(strconv.FormatInt(int64(char), 2))
        binaries += fmt.Sprintf("%07d", binary)
    }

    groupedBinaries := []string{}
    for len(binaries) > 0 {
        matched := regexp.MustCompile("^" + string(binaries[0]) + "+").FindString(binaries)

        groupedBinaries = append(groupedBinaries, matched)
        binaries = strings.Replace(binaries, matched, "", 1)
    }

    results := []string{}
    for _, groupedBinary := range groupedBinaries {
        if groupedBinary[0] == '0' {
            results = append(results, "00")
        } else {
            results = append(results, "0")
        }

        results = append(results, strings.Repeat("0", len(groupedBinary)))
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(strings.Join(results, " "))
}

