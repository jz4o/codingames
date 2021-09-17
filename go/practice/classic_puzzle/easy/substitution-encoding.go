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

    var rows int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&rows)

    grid := [][]string{}
    for i := 0; i < rows; i++ {
        scanner.Scan()
        row := scanner.Text()
        _ = row // to avoid unused error

        grid = append(grid, strings.Split(row, " "))
    }
    scanner.Scan()
    message := scanner.Text()
    _ = message // to avoid unused error

    replaceMap := map[string]string{}
    for rowIndex, row := range grid {
        for columnIndex, char := range row {
            replaceMap[char] = strconv.Itoa(rowIndex) + strconv.Itoa(columnIndex)
        }
    }

    result := ""
    for _, char := range strings.Split(message, "") {
        result += replaceMap[char]
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("encode message")// Write answer to stdout
    fmt.Println(result)
}
