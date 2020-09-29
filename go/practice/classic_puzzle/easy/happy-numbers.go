package main

import "fmt"
import "os"
import "bufio"

import "strconv"

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

    var xs []string
    for i := 0; i < N; i++ {
        scanner.Scan()
        x := scanner.Text()

        xs = append(xs, x)
    }

    happyNumber := "1"
    happyFace := ":)"
    unhappyFace := ":("

    var results []string
    for _, x := range xs {
        temp := x

        exitNumbers := []string{happyNumber}
        for !contains(exitNumbers, temp) {
            exitNumbers = append(exitNumbers, temp)
            sum := 0
            for _, c := range temp {
                d, _ := strconv.Atoi(string(c))
                sum += d * d
            }
            temp = strconv.Itoa(sum)
        }

        var resultFace string
        if temp == happyNumber {
            resultFace = happyFace
        } else {
            resultFace = unhappyFace
        }

        results = append(results, x + " " + resultFace)
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("23 :)")// Write answer to stdout
    for _, result := range results {
        fmt.Println(result)
    }
}

func contains(slice []string, target string) bool {
    for _, v := range slice {
        if v == target {
            return true
        }
    }

    return false
}

