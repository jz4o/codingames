package main

import "fmt"
import "os"
import "bufio"
import "strings"
import "strconv"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    var n int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&n)

    scanner.Scan()
    inputs := strings.Split(scanner.Text()," ")
    var values []int
    for i := 0; i < n; i++ {
        v,_ := strconv.ParseInt(inputs[i],10,32)
        _ = v

        values = append(values, (int)(v))
    }

    maxValue := 0
    maxDiff := 0
    for index, value := range values {
        if index >= len(values) - 1 {
            break
        }
        if maxValue >= value {
            continue
        }
        maxValue = value

        diff := min(values[index + 1:]) - value
        if maxDiff > diff {
            maxDiff = diff
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(maxDiff)
}

func min(slice []int) int {
    ans := slice[0]
    for _, v := range slice[1:] {
        if ans > v {
            ans = v
        }
    }

    return ans
}

