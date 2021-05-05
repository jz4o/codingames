package main

import "fmt"
import "os"
import "bufio"

import "sort"
import "strconv"
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

    var X, Y int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&X, &Y)

    grid := [][]string{}
    wallRow := strings.Split(strings.Repeat(" ", W + 2), "")

    grid = append(grid, wallRow)
    for i := 0; i < H; i++ {
        scanner.Scan()
        R := scanner.Text()
        // _ = R // to avoid unused error

        row := []string{}
        row = append(row, " ")
        row = append(row, strings.Split(R, "")...)
        row = append(row, " ")

        grid = append(grid, row)
    }
    grid = append(grid, wallRow)

    checkedMasses := []Mass{}
    beCheckMasses := []Mass{}
    exitMasses := []Mass{}

    beCheckMasses = append(beCheckMasses, Mass{Y + 1, X + 1})
    for len(beCheckMasses) > 0 {
        checkMass := beCheckMasses[0]
        beCheckMasses = beCheckMasses[1:]
        massY := checkMass.y
        massX := checkMass.x

        if checkMass.Contains(checkedMasses, checkMass) {
            continue
        }

        checkedMasses = append(checkedMasses, checkMass)

        nearMasses := []Mass{
            Mass{massY, massX - 1},
            Mass{massY - 1, massX},
            Mass{massY, massX + 1},
            Mass{massY + 1, massX}}

        for _, nearMass := range nearMasses {
            mass := grid[nearMass.y][nearMass.x]

            if mass == " " {
                exitMasses = append(exitMasses, Mass{massX - 1, massY - 1})
            } else if mass == "." {
                beCheckMasses = append(beCheckMasses, Mass{nearMass.y, nearMass.x})
            }
        }
    }

    sort.Slice(exitMasses, func(i, j int) bool {
        a := exitMasses[i]
        b := exitMasses[j]

        switch {
        case a.y < b.y:
            return true
        case b.y < a.y:
            return false
        default:
            return a.x < b.x
        }
    })

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(len(exitMasses))
    for _, exitMass := range exitMasses {
        fmt.Println(exitMass.String())
    }
}

type Mass struct {
    y int
    x int
}

func (m *Mass) Contains(slice []Mass, target Mass) bool {
    for _, elm := range slice {
        if elm.y == target.y && elm.x == target.x {
            return true
        }
    }

    return false
}

func (m *Mass) String() string {
    return strconv.Itoa(m.y) + " " + strconv.Itoa(m.x)
}

