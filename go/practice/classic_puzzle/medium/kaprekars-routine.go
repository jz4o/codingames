package main

import "fmt"
import "os"
import "bufio"

import "sort"
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
    n1 := scanner.Text()
    // _ = n1 // to avoid unused error

    digitsSize := len(n1)
    answers := []string{}

    temp := n1
    for !contains(answers, temp) {
        answers = append(answers, temp)

        numbers := strings.Split(temp, "")

        sort.Sort(sort.Reverse(sort.StringSlice(numbers)))
        biggest, _ := strconv.Atoi(strings.Join(numbers, ""))

        sort.Sort(sort.StringSlice(numbers))
        smallest, _ := strconv.Atoi(strings.Join(numbers, ""))

        answer := biggest - smallest

        temp = fmt.Sprintf("%0" + strconv.Itoa(digitsSize) + "d", answer)
    }

    beginIndex := indexOf(answers, temp)
    result := strings.Join(answers[beginIndex:], " ")

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("1 2 3 4")// Write answer to stdout
    fmt.Println(result)
}

func contains(slice []string, target string) bool {
    for _, elm := range slice {
        if elm == target {
            return true
        }
    }

    return false
}

func indexOf(slice []string, target string) int {
    for index, elm := range slice {
        if elm == target {
            return index
        }
    }

    return -1
}

