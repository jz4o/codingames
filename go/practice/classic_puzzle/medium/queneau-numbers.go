package main

import "fmt"

import "math"
import "reflect"
import "strconv"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var N int
    fmt.Scan(&N)

    initialSlice := []string{}
    for i := 1; i <= N; i++ {
        initialSlice = append(initialSlice, strconv.Itoa(i))
    }
    centerIndex := N / 2
    slice := make([]string, N)
    copy(slice, initialSlice)
    progressLogs := []string{}

    for i := 0; i < N; i++ {
        frontHalf := []string{}
        for j := 0; j < centerIndex; j++ {
            frontHalf = append(frontHalf, slice[j])
        }

        backHalf := []string{}
        for j := centerIndex; j < len(slice); j++ {
            backHalf = append(backHalf, slice[j])
        }

        slice = []string{}

        loopSize := int(math.Ceil(float64(N) / 2))
        for j := 0; j < loopSize; j++ {
            if j < len(backHalf) {
                slice = append(slice, backHalf[len(backHalf) - 1 - j])
            }

            if j < len(frontHalf) {
                slice = append(slice, frontHalf[j])
            }
        }

        progressLogs = append(progressLogs, strings.Join(slice, ","))
    }

    result := "IMPOSSIBLE"
    if reflect.DeepEqual(slice, initialSlice) {
        result = strings.Join(progressLogs, "\n")
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("IMPOSSIBLE")// Write answer to stdout
    fmt.Println(result)
}

