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
    var N int
    fmt.Scan(&N)

    var xys []string
    for i := 0; i < N; i++ {
        var xY string
        fmt.Scan(&xY)

        xys = append(xys, xY)
    }
    for i := 0; i < N; i++ {
        xy := xys[i]
        xyElements := strings.Split(xy, "/")

        x, _ := strconv.Atoi(xyElements[0])
        y, _ := strconv.Atoi(xyElements[1])

        if y == 0 {
            fmt.Println("DIVISION BY ZERO")
            continue
        }

        integer := x / y
        intStr := ""
        if integer != 0 {
            intStr = strconv.Itoa(integer)
        }

        rat := x % y
        gcdNum := gcd(rat, y)
        ratX := (int)(math.Floor((float64)(rat / gcdNum)))
        ratY := (int)(math.Floor((float64)(y / gcdNum)))
        minusElements := 0
        for _, d := range []int{integer, ratX, ratY} {
            if d < 0 {
                minusElements++
            }
        }
        minus := ""
        if minusElements % 2 == 1 {
            minus = "-"
        }
        ratStr := ""
        if rat != 0 {
            ratStr = minus + strconv.Itoa((int)(math.Abs((float64)(ratX)))) + "/" + strconv.Itoa((int)(math.Abs((float64)(ratY))))
        }

        result := strings.TrimSpace(intStr + " " + ratStr)
        if len(result) == 0 {
            result = "0"
        }


        // fmt.Fprintln(os.Stderr, "Debug messages...")
        // fmt.Println("answer")// Write answer to stdout
        fmt.Println(result)
    }
}

func gcd(x int, y int) int {
    for ; x % y != 0; x, y = y, x % y {}

    return y
}

