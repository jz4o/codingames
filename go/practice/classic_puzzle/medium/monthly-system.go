package main

import "fmt"
import "os"
import "bufio"

import "math"
import "regexp"
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

    ms := []string{}
    for i := 0; i < N; i++ {
        scanner.Scan()
        M := scanner.Text()
        // _ = M // to avoid unused error

        ms = append(ms, M)
    }

    sum := 0
    for _, m := range ms {
        sum += monthBaseNumberToInteger(m)
    }

    result := integerToMonthBaseNumber(sum)

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(result)
}

func monthBaseNumberToInteger(monthBaseNumber string) int {
    months := []string{"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}

    reverseMonths := []string{}
    for _, month := range regexp.MustCompile(".{1,3}").FindAllString(monthBaseNumber, -1) {
        reverseMonths = append([]string{month}, reverseMonths...)
    }

    result := 0
    for index, month := range reverseMonths {
        monthIndex := indexOf(months, month)
        result += monthIndex * int(math.Pow(float64(len(months)), float64(index)))
    }

    return result
}

func integerToMonthBaseNumber(num int) string {
    months := []string{"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}

    if num == 0 {
        return months[num]
    }

    results := []string{}
    for num > 0 {
        results = append([]string{months[num % len(months)]}, results...)
        num = num / len(months)
    }

    return strings.Join(results, "")
}

func indexOf(slice []string, target string) int {
    for index, elm := range slice {
        if elm == target {
            return index
        }
    }

    return -1
}

