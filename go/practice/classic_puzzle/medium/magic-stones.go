package main

import "fmt"
import "os"
import "bufio"
import "strings"
import "strconv"

import "sort"

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
    inputs := strings.Split(scanner.Text()," ")
    stones := []int{}
    for i := 0; i < N; i++ {
        level,_ := strconv.ParseInt(inputs[i],10,32)
        // _ = level

        stones = append(stones, int(level))
    }

    stoneCount := 0
    for len(stones) > 0 {
        sort.Sort(sort.IntSlice(stones))

        level := stones[0]
        targetLevelStonesCount := count(stones, level)

        stones = remove(stones, level)

        if targetLevelStonesCount >= 2 {
            nextLevel := level + 1
            for i := 0; i < targetLevelStonesCount / 2; i++ {
                stones = append(stones, nextLevel)
            }
        }

        stoneCount += targetLevelStonesCount % 2
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("1")// Write answer to stdout
    fmt.Println(stoneCount)
}

func count(array []int, target int) int {
    result := 0

    for _, elm := range array {
        if elm == target {
            result++
        }
    }

    return result
}

func remove(array []int, target int) []int {
    result := []int{}

    for _, elm := range array {
        if elm != target {
            result = append(result, elm)
        }
    }

    return result
}

