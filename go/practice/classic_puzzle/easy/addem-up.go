package main

import "fmt"
import "os"
import "bufio"
import "strings"
import "strconv"

import "sort"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    var N int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&N)

    var xs []int
    scanner.Scan()
    inputs := strings.Split(scanner.Text()," ")
    for i := 0; i < N; i++ {
        x,_ := strconv.ParseInt(inputs[i],10,32)
        _ = x

        xs = append(xs, int(x))
    }

    totalCost := 0
    for len(xs) >= 2 {
        sort.Sort(sort.IntSlice(xs))

        var firstCost int
        var secondCost int
        firstCost, xs = unshift(xs)
        secondCost, xs = unshift(xs)

        cost := firstCost + secondCost

        totalCost += cost
        xs = append(xs, cost)
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("0")// Write answer to stdout
    fmt.Println(totalCost)
}

func unshift(slice []int) (int, []int) {
    ans := slice[0]
    slice = slice[1:]

    return ans, slice
}

