package main

import "fmt"

import "math"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var R int
    fmt.Scan(&R)

    var V int
    fmt.Scan(&V)

    var vaults []vault
    for i := 0; i < V; i++ {
        var C, N int
        fmt.Scan(&C, &N)

        vaults = append(vaults, vault{C, N})
    }

    robbers := make([]int, R)
    for _, v := range vaults {
        vaultTime := int(math.Pow(10, float64(v.n)) * math.Pow(5, float64(v.c - v.n)))
        minVaultTime := min(robbers)

        robbers[indexOf(robbers, minVaultTime)] += vaultTime
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("1")// Write answer to stdout
    fmt.Println(max(robbers))
}

type vault struct {
    c int
    n int
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

func max(slice []int) int {
    ans := slice[0]

    for _, v := range slice {
        if v > ans {
            ans = v
        }
    }

    return ans
}

func indexOf(slice []int, target int) int {
    for i, v := range slice {
        if v == target {
            return i
        }
    }

    return -1
}

