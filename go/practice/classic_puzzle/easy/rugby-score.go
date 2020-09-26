package main

import "fmt"

import "math"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var N int
    fmt.Scan(&N)

    tryPoint := 5
    transformPoint := 2
    penaDropPoint := 3

    var results []string

    possibleTryTimes := int(math.Floor(float64(N / tryPoint)))
    for tryTimes := possibleTryTimes; tryTimes >= 0; tryTimes-- {
        tryPoints := tryPoint * tryTimes

        possibleTransformationTimes := int(math.Min(float64((N - tryPoints) / transformPoint), float64(tryTimes)))
        for transformationTimes := possibleTransformationTimes; transformationTimes >= 0; transformationTimes-- {
            transformPoints := transformPoint * transformationTimes

            reminingPoints := N - tryPoints - transformPoints
            if reminingPoints % penaDropPoint == 0 {
                penaltieOrDropTimes := reminingPoints / penaDropPoint
                result := fmt.Sprintf("%d %d %d", tryTimes, transformationTimes, penaltieOrDropTimes)

                results = append([]string{result}, results...)
            }
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("tries transformations penalties")// Write answer to stdout
    for _, v := range results {
        fmt.Println(v)
    }
}

