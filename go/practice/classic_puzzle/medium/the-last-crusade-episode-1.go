package main

import "fmt"
import "os"
import "bufio"

import "strconv"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    // direction
    // top := 0 // not use
    left := 1
    right := 2
    bottom := 3
    none := -1

    // Key   : direction of entrance
    // Value : direction of exit(index: type of panel)
    panelDestination := make(map[string][]int)
    panelDestination["TOP"] = []int{none, bottom, none, bottom, left, right, none, bottom, none, bottom, left, right, none, none}
    panelDestination["LEFT"] = []int{none, bottom, right, none, none, bottom, right, none, bottom, bottom, none, none, none, bottom}
    panelDestination["RIGHT"] = []int{none, bottom, left, none, bottom, none, left, bottom, bottom, none, none, none, bottom, none}

    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    // W: number of columns.
    // H: number of rows.
    var W, H int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&W, &H)

    var grid [][]int
    for i := 0; i < H; i++ {
        scanner.Scan()
        LINE := scanner.Text() // represents a line in the grid and contains W integers. Each integer represents one room of a given type.

        var line []int
        for _, c := range strings.Split(LINE, " ") {
            d, _ := strconv.Atoi(c)
            line = append(line, d)
        }
        grid = append(grid, line)
    }
    // EX: the coordinate along the X axis of the exit (not useful for this first mission, but must be read).
    var EX int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&EX)
    for {
        var XI, YI int
        var POS string
        scanner.Scan()
        fmt.Sscan(scanner.Text(),&XI, &YI, &POS)

        panelType := grid[YI][XI]
        nextDest := panelDestination[POS][panelType]

        nextXi := XI
        nextYi := YI
        switch nextDest {
            case left: nextXi--
            case right: nextXi++
            case bottom: nextYi++
        }

        // fmt.Fprintln(os.Stderr, "Debug messages...")

        // One line containing the X Y coordinates of the room in which you believe Indy will be on the next turn.
        // fmt.Println("0 0")
        fmt.Println(strconv.Itoa(nextXi) + " " + strconv.Itoa(nextYi))
    }
}

