package main

import "fmt"

import "math"
import "strconv"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    // W: width of the building.
    // H: height of the building.
    var W, H int
    fmt.Scan(&W, &H)

    // N: maximum number of turns before game over.
    var N int
    fmt.Scan(&N)

    var X0, Y0 int
    fmt.Scan(&X0, &Y0)

    bombMinHeight := H
    bombMaxHeight := 0
    bombMinWidth := 0
    bombMaxWidth := W

    x := X0
    y := Y0

    for {
        // bombDir: the direction of the bombs from batman's current location (U, UR, R, DR, D, DL, L or UL)
        var bombDir string
        fmt.Scan(&bombDir)

        if strings.Contains(bombDir, "U") {
            bombMinHeight = y
            y -= (int)(math.Ceil((float64)(y - bombMaxHeight) / 2.0))
        } else if strings.Contains(bombDir, "D") {
            bombMaxHeight = y
            y += (int)(math.Ceil((float64)(bombMinHeight - y) / 2.0))
        }

        if strings.Contains(bombDir, "R") {
            bombMinWidth = x
            x += (int)(math.Ceil((float64)(bombMaxWidth - x) / 2.0))
        } else if strings.Contains(bombDir, "L") {
            bombMaxWidth = x
            x -= (int)(math.Ceil((float64)(x - bombMinWidth) / 2.0))
        }


        // fmt.Fprintln(os.Stderr, "Debug messages...")

        // the location of the next window Batman should jump to.
        // fmt.Println("0 0")
        fmt.Println(strconv.Itoa(x) + " " + strconv.Itoa(y))
    }
}

