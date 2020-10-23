package main

import "fmt"

import "math"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var N int
    fmt.Scan(&N)

    var strengths []Strength
    for i := 0; i < N; i++ {
        var V, E int
        fmt.Scan(&V, &E)

        strengths = append(strengths, Strength{V, E})
    }

    var results []int
    for lIndex, left := range strengths {
        for rIndex, right := range strengths {
            if rIndex <= lIndex {
                continue
            }

            result := (int)(math.Abs((float64)(right.v - left.v)) + math.Abs((float64)(right.e -+ left.e)))
            results = append(results, result)
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("42")// Write answer to stdout
    fmt.Println(min(results))
}

type Strength struct {
    v int
    e int
}

func min(slice []int) int {
    ans := slice[0]

    for _, v := range slice {
        if v < ans {
            ans = v
        }
    }

    return ans
}

