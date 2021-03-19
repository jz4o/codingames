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

    var N int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&N)

    var isbns []string
    for i := 0; i < N; i++ {
        scanner.Scan()
        ISBN := scanner.Text()
        // _ = ISBN // to avoid unused error

        isbns = append(isbns, ISBN)
    }

    var modulusWeights map[int][]int = map[int][]int {
        10: []int { 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3 },
        11: []int { 10, 9, 8, 7, 6, 5, 4, 3, 2, 1 }}

    var invalids []string
    for _, isbn := range isbns {
        if !regexp.MustCompile(`^\d+X?$`).MatchString(isbn) {
            invalids = append(invalids, isbn)
            continue
        }

        var modulus int
        if len(isbn) == 10 {
            modulus = 11
        } else if len(isbn) == 13 {
            if regexp.MustCompile(`X$`).MatchString(isbn) {
                invalids = append(invalids, isbn)
                continue
            }

            modulus = 10
        } else {
            invalids = append(invalids, isbn)
            continue
        }

        dataDigits := strings.Split(isbn, "")
        checkDigit := dataDigits[len(dataDigits) - 1]
        dataDigits = dataDigits[:len(dataDigits) - 1]
        if checkDigit == "X" {
            checkDigit = "10"
        }

        sum := 0
        for index, digit := range dataDigits {
            d, _ := strconv.Atoi(digit)
            sum += d * modulusWeights[modulus][index]
        }

        checkSum := (modulus - (sum % modulus)) % modulus
        if strconv.Itoa(checkSum) != checkDigit {
            invalids = append(invalids, isbn)
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(strconv.Itoa(len(invalids)) + " invalid:")
    for _, invalid := range invalids {
        fmt.Println(invalid)
    }
}

