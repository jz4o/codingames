package main

import "fmt"
import "os"
import "bufio"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    scanner.Scan()
    X := scanner.Text()
    // _ = X // to avoid unused error
    scanner.Scan()
    Y := scanner.Text()
    // _ = Y // to avoid unused error

    replaceTargets := []string{}
    replacedChars := []string{}
    for i := 0; i < len(X); i++ {
        x := string(X[i])
        y := string(Y[i])

        if x != y && !contains(replaceTargets, x) {
            replaceTargets = append(replaceTargets, x)
            replacedChars = append(replacedChars, y)
        }
    }

    replaceResult := X
    for i := 0; i < len(replaceResult); i++ {
        c := string(replaceResult[i])
        if contains(replaceTargets, c) {
            index := indexOf(replaceTargets, c)
            replaceResult = replaceResult[0:i] + replacedChars[index] + replaceResult[i+1:]
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("anwser")// Write answer to stdout
    if X == Y {
        fmt.Println("NONE")
    } else if replaceResult == Y {
        for i := 0; i < len(replaceTargets); i++ {
            fmt.Println(replaceTargets[i] + "->" + replacedChars[i])
        }
    } else {
        fmt.Println("CAN'T")
    }
}

func indexOf(slice []string, target string) int {
    for index, elm := range slice {
        if elm == target {
            return index
        }
    }

    return -1
}

func contains(slice []string, target string) bool {
    return indexOf(slice, target) >= 0
}

