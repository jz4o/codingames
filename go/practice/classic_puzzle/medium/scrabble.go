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

    var N int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&N)

    words := []string{}
    for i := 0; i < N; i++ {
        scanner.Scan()
        W := scanner.Text()
        // _ = W // to avoid unused error

        words = append(words, W)
    }
    scanner.Scan()
    LETTERS := scanner.Text()
    _ = LETTERS // to avoid unused error

    pointChars := map[int]string{ 1:"eaionrtlsu", 2:"dg", 3:"dcmp", 4:"fhvwy", 5:"k", 8:"jx", 10:"qz" }
    var points = make(map[string]int)
    for point, chars := range pointChars {
        for _, char := range strings.Split(chars, "") {
            points[char] = point
        }
    }

    bestWord := ""
    maxPoint := 0
    for _, word := range words {
        point := 0
        canChars := LETTERS

        continueFlag := false
        for _, w := range strings.Split(word, "") {
            if !strings.Contains(canChars, w) {
                continueFlag = true
                break
            }

            point += points[w]
            canChars = strings.Replace(canChars, w, "", 1)
        }

        if continueFlag {
            continue
        }

        if maxPoint < point {
            bestWord = word
            maxPoint = point
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("invalid word")// Write answer to stdout
    fmt.Println(bestWord)
}

