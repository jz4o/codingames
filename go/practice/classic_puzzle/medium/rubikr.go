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

    cubeCount := math.Pow(float64(N), 3)

    invisibleCubeWidth := math.Max(float64(N - 2), 0)
    invisibleCubeCount := math.Pow(invisibleCubeWidth, 3)

    ans := cubeCount - invisibleCubeCount

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(ans)
}

