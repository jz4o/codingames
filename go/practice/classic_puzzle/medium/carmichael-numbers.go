package main

import "fmt"

import "math/big"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var n int
    fmt.Scan(&n)

    isPrime := big.NewInt(int64(n)).ProbablyPrime(0)
    isCarmichael := !isPrime

    for _, v := range primeDivision(n) {
        if (n - 1) % (v - 1) != 0 {
            isCarmichael = false
            break
        }
    }

    result := "NO"
    if isCarmichael {
        result = "YES"
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("YES|NO")// Write answer to stdout
    fmt.Println(result)
}

func primeDivision(n int) ([]int) {
    var ans []int

    for n % 2 == 0 {
        ans = append(ans, 2)
        n /= 2
    }

    i := 3
    for n != 1 {
        if n % i == 0 {
            ans = append(ans, i)
            n /= i
        } else {
            i += 2
        }
    }

    return ans
}

