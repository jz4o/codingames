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

    var Y int
    fmt.Scan(&Y)

    var cages []Cage
    for i := 0; i < N; i++ {
        var S, H, A int
        fmt.Scan(&S, &H, &A)

        cages = append(cages, Cage{S, H, A})
    }
    for i := 0; i < Y; i++ {
        alive := 0
        for ci := 0; ci < len(cages); ci++ {
            cage := cages[ci]

            sick := cage.sick * (int)(math.Pow(2.0, (float64)(i)))
            cage.alive -= sick

            alive += (int)(math.Max((float64)(cage.alive), 0.0))

            cages[ci] = cage
        }


        // fmt.Fprintln(os.Stderr, "Debug messages...")
        // fmt.Println("answer")// Write answer to stdout
        fmt.Println(alive)

        if alive == 0 {
            break
        }
    }
}

type Cage struct {
    sick int
    healthy int
    alive int
}

