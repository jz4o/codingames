package main

import "fmt"

import "strconv"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var n, k int
    fmt.Scan(&n, &k)

    temps := [][]int{}
    for i := 1; i <= k; i++ {
        temps = append(temps, []int{i})
    }

    results := [][]int{}
    for len(temps) > 0 {
        temp := temps[len(temps) - 1]
        temps = temps[:len(temps) - 1]

        sum := 0
        for _, t := range temp {
            sum += t
        }

        if sum == n {
            results = append([][]int{temp}, results...)
        } else if sum < n {
            for i := 1; i <= k; i++ {
                if n < sum + i {
                    continue
                }

                tempClone := append([]int{}, temp...)
                temps = append(temps, append(tempClone, i))
            }
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    for _, result := range results {
        strResult := []string{}
        for _, r := range result {
            strResult = append(strResult, strconv.Itoa(r))
        }

        fmt.Println(strings.Join(strResult, " "))
    }
}

