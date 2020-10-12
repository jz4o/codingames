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

    var n int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&n)

    var cards []string
    for i := 0; i < n; i++ {
        scanner.Scan()
        card := scanner.Text()

        cards = append(cards, card)
    }

    var results []string
    for _, card := range cards {
        sum := 0
        for i, digit := range strings.Replace(card, " ", "", -1) {
            d, _ := strconv.Atoi(string(digit))
            if i % 2 == 0 {
                d *= 2
                if d >= 10 {
                    d -= 9
                }
            }

            sum += d
        }

        result := "NO"
        if sum % 10 == 0 {
            result = "YES"
        }

        results = append(results, result)
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("YES or NO")// Write answer to stdout
    for _, v := range results {
        fmt.Println(v)
    }
}

