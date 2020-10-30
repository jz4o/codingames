package main

import "fmt"

import "math"
import "math/big"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var M int
    fmt.Scan(&M)

    var N int
    fmt.Scan(&N)

    shortDistance := (int)(math.Min((float64)(M), (float64)(N))) - 1
    longDistance := (int)(math.Max((float64)(M), (float64)(N))) - 1

    // one way city
    if shortDistance <= 0 {
        fmt.Println("1")
        return
    }

    moleCombination := big.NewInt(1)
    for i := longDistance + 1; i <= shortDistance + longDistance; i++ {
        moleCombination = moleCombination.Mul(moleCombination, big.NewInt((int64)(i)))
    }
    denoCombination := big.NewInt((int64)(1))
    for i := 1; i <= shortDistance; i++ {
        denoCombination = denoCombination.Mul(denoCombination, big.NewInt((int64)(i)))
    }

    movableCombination := moleCombination.Div(moleCombination, denoCombination)
    significantDigits := fmt.Sprint(movableCombination)
    if len(significantDigits) > 1000 {
        significantDigits = significantDigits[0:1000]
    }


    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(significantDigits)
}

