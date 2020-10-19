package main

import "fmt"
import "os"
import "bufio"

import "math"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    var N int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&N)

    scanner.Scan()
    B := scanner.Text()

    longestSpaceCount := 0
    leftIndexInLongestSpace := 0
    rightIndexInLongestSpace := 0
    spaceCount := 0
    leftIndexInSpace := 0
    rightIndexInSpace := 0
    for index, b := range strings.Split(B + "!", "") {
        if b == "U" {
            if spaceCount == 0 {
                leftIndexInSpace = index
            }

            spaceCount++
            rightIndexInSpace = index
        } else {
            if spaceCount > longestSpaceCount {
                longestSpaceCount = spaceCount
                leftIndexInLongestSpace = leftIndexInSpace
                rightIndexInLongestSpace = rightIndexInSpace
            }

            spaceCount = 0
            leftIndexInSpace = 0
            rightIndexInSpace = 0
        }
    }

    var result int
    if leftIndexInLongestSpace == 0 {
        result = leftIndexInLongestSpace
    } else if rightIndexInLongestSpace == N - 1 {
        result = rightIndexInLongestSpace
    } else {
        result = leftIndexInLongestSpace + (int)(math.Floor((float64)(longestSpaceCount) / 2.0))
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("0")// Write answer to stdout
    fmt.Println(result)
}

