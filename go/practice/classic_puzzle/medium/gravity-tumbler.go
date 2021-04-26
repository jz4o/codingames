package main

import "fmt"
import "os"
import "bufio"

import "sort"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    var width, height int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&width, &height)

    var count int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&count)

    grid := [][]string{}
    for i := 0; i < height; i++ {
        scanner.Scan()
        raster := scanner.Text()
        // _ = raster // to avoid unused error

        grid = append(grid, strings.Split(raster, ""))
    }

    for i := 0; i < count; i++ {
        for _, row := range grid {
            sort.Strings(row)
        }
        grid = anticlockwiseTurn90Degree(grid)
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("...")// Write answer to stdout
    // fmt.Println("write ###")
    for _, row := range grid {
        fmt.Println(strings.Join(row, ""))
    }
}


// example.
//
// input
//
//    1  2  3  4  5
//    6  7  8  9 10
//   11 12 13 14 15
//
// output
//
//   5 10 15
//   4  9 14
//   3  8 13
//   2  7 12
//   1  6 11
//
func anticlockwiseTurn90Degree(slice [][]string) [][]string {
    return reverse(transpose(slice))
}

func transpose(slice [][]string) [][]string {
    result := [][]string{}
    for columnIndex := 0; columnIndex < len(slice[0]); columnIndex++ {
        row := []string{}
        for rowIndex := 0; rowIndex < len(slice); rowIndex++ {
            row = append(row, slice[rowIndex][columnIndex])
        }

        result = append(result, row)
    }

    return result
}

func reverse(slice [][]string) [][]string {
   result := [][]string{}
   for _, row := range slice {
       result = append([][]string{row}, result...)
   }

   return result
}

