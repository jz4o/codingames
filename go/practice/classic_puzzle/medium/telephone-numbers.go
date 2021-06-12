package main

import "fmt"

import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var N int
    fmt.Scan(&N)

    var telephones []string
    for i := 0; i < N; i++ {
        var telephone string
        fmt.Scan(&telephone)

        telephones = append(telephones, telephone)
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")

    numberTree := NumberTree{make(map[string]NumberTree)}
    for _, telephone := range telephones {
        targetTree := numberTree
        for _, num := range strings.Split(telephone, "") {
            if _, exist := targetTree.child[num]; !exist {
                targetTree.child[num] = NumberTree{make(map[string]NumberTree)}
            }

            targetTree = targetTree.child[num]
        }
    }

    result := strings.Count(fmt.Sprint(numberTree.child), "map") - 1

    // The number of elements (referencing a number) stored in the structure.
    // fmt.Println("number")
    fmt.Println(result)
}

type NumberTree struct {
    child map[string]NumberTree
}

