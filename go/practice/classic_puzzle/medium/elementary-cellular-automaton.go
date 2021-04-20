package main

import "fmt"

import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var R int
    fmt.Scan(&R)

    var N int
    fmt.Scan(&N)

    var startPattern string
    fmt.Scan(&startPattern)

    ruleLength := 8

    reversedBinaryDigits := []string{}
    for _, b := range strings.Split(fmt.Sprintf("%08b", R), "") {
        reversedBinaryDigits = append([]string{string(b)}, reversedBinaryDigits...)
    }

    rule := map[string]string{}
    for i := 0; i < ruleLength; i++ {
        rule[fmt.Sprintf("%03b", i)] = reversedBinaryDigits[i]
    }

    results := []string{}
    temp := startPattern
    temp = strings.ReplaceAll(temp, ".", "0")
    temp = strings.ReplaceAll(temp, "@", "1")

    for i := 0; i < N; i++ {
        result := temp
        result = strings.ReplaceAll(result, "0", ".")
        result = strings.ReplaceAll(result, "1", "@")

        results = append(results, result)

        array := []string{}
        array = append(array, string(temp[len(temp) - 1]))
        array = append(array, strings.Split(temp, "")...)
        array = append(array, string(temp[0]))

        newTemp := ""
        for j := 0; j < len(temp); j++ {
            key := strings.Join(array[j:j+3], "")
            newTemp += rule[key]
        }

        temp = newTemp
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println(".....@.@.....")// Write answer to stdout
    for _, result := range results {
        fmt.Println(result)
    }
}

