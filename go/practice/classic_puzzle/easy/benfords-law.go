package main

import "fmt"
import "os"
import "bufio"

import "regexp"
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

    transactions := []string{}
    for i := 0; i < N; i++ {
        scanner.Scan()
        transaction := scanner.Text()
        _ = transaction // to avoid unused error

        transactions = append(transactions, transaction)
    }

    benfordLawPercentages := []float64{0, 0.301, 0.176, 0.125, 0.097, 0.079, 0.067, 0.058, 0.051, 0.046}
    firstNumbers := []int{}
    for _, transaction := range transactions {
        matched := regexp.MustCompile("[1-9]").FindString(transaction)
        intMatched, _ := strconv.Atoi(matched)
        firstNumbers = append(firstNumbers, intMatched)
    }

    isFraudulent := false
    for i := 1; i <= 9; i++ {
        benfordLawPercentage := benfordLawPercentages[i]
        iCount := 0
        for _, firstNumber := range firstNumbers {
            if firstNumber == i {
                iCount++
            }
        }
        percent := (float64)(iCount) / (float64)(N)

        isFraudulent = isFraudulent || !((benfordLawPercentage - 0.1) <= percent && percent <= (benfordLawPercentage + 0.1))
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("false")// Write answer to stdout
    fmt.Println(isFraudulent)
}
