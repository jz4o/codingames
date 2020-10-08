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

    // n: the number of temperatures to analyse
    var n int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&n)

    scanner.Scan()
    inputs := strings.Split(scanner.Text()," ")
    var ns []int
    for i := 0; i < n; i++ {
        // t: a temperature expressed as an integer ranging from -273 to 5526
        t,_ := strconv.ParseInt(inputs[i],10,32)
        _ = t

        ns = append(ns, (int)(t))
    }

    containsNegative := false
    containsPositive := false
    closestZeroNegative := -273
    closestZeroPositive := 5526
    for _, n := range ns {
        if n == 0 {
            closestZeroNegative = 0
            closestZeroPositive = 0
        } else if closestZeroNegative <= n && n < 0 {
            closestZeroNegative = n
            containsNegative = true
        } else if 0 < n && n <= closestZeroPositive {
            closestZeroPositive = n
            containsPositive = true
        }
    }

    npBalance := 0
    if containsNegative {
        npBalance += closestZeroNegative
    }
    if containsPositive {
        npBalance += closestZeroPositive
    }

    result := 0
    if n == 0 {
        result = 0
    } else if !containsNegative || !containsPositive {
        result = npBalance
    } else if npBalance <= 0 {
        result = closestZeroPositive
    } else {
        result = closestZeroNegative
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("result")// Write answer to stdout
    fmt.Println(result)
}

