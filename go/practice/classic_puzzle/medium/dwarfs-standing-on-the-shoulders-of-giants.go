package main

import "fmt"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    // n: the number of relationships of influence
    var n int
    fmt.Scan(&n)

    relationMap := map[int][]int{}
    for i := 0; i < n; i++ {
        // x: a relationship of influence between two people (x influences y)
        var x, y int
        fmt.Scan(&x, &y)

        if _, exist := relationMap[x]; !exist {
            relationMap[x] = []int{}
        }

        relationMap[x] = append(relationMap[x], y)
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")

    targets := []int{}
    for key := range relationMap {
        targets = append(targets, key)
    }

    deepLevel := 0
    for len(targets) > 0 {
        deepLevel++

        tempTargets := []int{}
        for _, target := range targets {
            if _, exist := relationMap[target]; exist {
                tempTargets = append(tempTargets, target)
            }
        }

        targets = nil
        for _, target := range tempTargets {
            targets = append(targets, relationMap[target]...)
        }
    }

    // The number of people involved in the longest succession of influences
    // fmt.Println("2")
    fmt.Println(deepLevel)
}

