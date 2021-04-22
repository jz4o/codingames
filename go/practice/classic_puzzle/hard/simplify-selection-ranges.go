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
    N := scanner.Text()
    _ = N // to avoid unused error

    N = strings.ReplaceAll(N, "[", "")
    N = strings.ReplaceAll(N, "]", "")

    numbers := []int{}
    for _, char := range strings.Split(N, ",") {
        number, _ := strconv.Atoi(char)
        numbers = append(numbers, number)
    }
    sort.Ints(numbers)

    result := []string{}
    temp := []int{}
    for len(numbers) > 0 {
        if len(temp) == 0 || temp[len(temp) - 1] + 1 == numbers[0] {
            temp = append(temp, numbers[0])
            numbers = numbers[1:]
        } else {
            result = append(result, buildAddItems(temp))
            temp = nil
        }
    }

    if len(temp) > 0 {
        result = append(result, buildAddItems(temp))
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(strings.Join(result, ","))
}

func buildAddItems(slice []int) string {
    if len(slice) >= 3 {
        return strconv.Itoa(slice[0]) + "-" + strconv.Itoa(slice[len(slice) - 1])
    } else {
        strSlice := []string{}
        for _, elm := range slice {
            strSlice = append(strSlice, strconv.Itoa(elm))
        }

        return strings.Join(strSlice, ",")
    }
}

