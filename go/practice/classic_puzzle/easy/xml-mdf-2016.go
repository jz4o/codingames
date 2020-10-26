package main

import "fmt"
import "os"
import "bufio"

import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    scanner.Scan()
    sequence := scanner.Text()

    depths := make(map[string][]int)
    depth := 0
    sequenceChars := strings.Split(sequence, "")
    for len(sequenceChars) > 0 {
        char := sequenceChars[0]
        sequenceChars = sequenceChars[1:]

        if char == "-" {
            closeChar := sequenceChars[0]
            sequenceChars = sequenceChars[1:]

            if _, exist := depths[closeChar]; !exist {
                depths[closeChar] = []int{}
            }
            depths[closeChar] = append(depths[closeChar], depth)

            depth--
        } else {
            depth++
        }
    }

    maximumValueKey := ""
    maximumValue := 0.0
    for k, v := range depths {
        sum := 0.0
        for _, vDepth := range v {
            sum += 1.0 / (float64)(vDepth)
        }

        if maximumValue < sum {
            maximumValueKey = k
            maximumValue = sum
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(maximumValueKey)
}

