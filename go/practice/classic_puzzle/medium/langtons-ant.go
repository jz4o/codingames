package main

import "fmt"
import "os"
import "bufio"

import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    var W, H int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&W, &H)

    var x, y int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&x, &y)

    var direction string
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&direction)

    var T int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&T)

    grid := [][]string{}
    for i := 0; i < H; i++ {
        scanner.Scan()
        C := scanner.Text()
        // _ = C // to avoid unused error

        grid = append(grid, strings.Split(C, ""))
    }

    black := "#"
    white := "."

    directions := []string{"N", "E", "S", "W"}
    for directions[0] != direction {
        directions = append(directions[1:], directions[0])
    }

    for i := 0; i < T; i++ {
        if grid[y][x] == black {
            directions = append(directions[1:], directions[0])
            grid[y][x] = white
        } else {
            directions = append([]string{directions[len(directions) - 1]}, directions[:len(directions) - 1]...)
            grid[y][x] = black
        }

        switch directions[0] {
            case "N":
                y--
            case "E":
                x++
            case "W":
                x--
            case "S":
                y++
        }

        // fmt.Fprintln(os.Stderr, "Debug messages...")
        // fmt.Println("answer")// Write answer to stdout
    }

    for _, row := range grid {
        fmt.Println(strings.Join(row, ""))
    }
}

