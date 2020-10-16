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
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    var w, h int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&w, &h)

    var n int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&n)

    var grid [][]string
    for i := 0; i < h; i++ {
        scanner.Scan()
        line := scanner.Text()

        grid = append(grid, strings.Split(line, ""))
    }

    directions := []string {"N", "E", "S", "W"}
    directionIndex := 0

    yIndex := 0
    xIndex := 0
    for index, line := range grid {
        if contains(line, "O") {
            yIndex = index
            xIndex = indexOf(line, "O")
        }
    }

    initialY := yIndex
    initialX := xIndex

    turn := 0
    for turn < n {
        turn++

        direction := directions[directionIndex]

        // forward
        switch direction {
            case "N": yIndex--
            case "E": xIndex++
            case "W": xIndex--
            case "S": yIndex++
        }

        // get ahead mass
        var aheadMass string
        if direction == "N" && yIndex > 0 {
            aheadMass = grid[yIndex - 1][xIndex]
        } else if direction == "E" && yIndex < w - 1 {
            aheadMass = grid[yIndex][xIndex + 1]
        } else if direction == "W" && xIndex > 0 {
            aheadMass = grid[yIndex][xIndex - 1]
        } else if direction == "S" && yIndex < h - 1 {
            aheadMass = grid[yIndex + 1][xIndex]
        }

        // turn right if obstacle in ahead mass
        for aheadMass == "#" {
            directionIndex = (directionIndex + 1) % len(directions)
            direction = directions[directionIndex]

            if direction == "N" && yIndex > 0 {
                aheadMass = grid[yIndex - 1][xIndex]
            } else if direction == "E" && yIndex < w - 1 {
                aheadMass = grid[yIndex][xIndex + 1]
            } else if direction == "W" && xIndex > 0 {
                aheadMass = grid[yIndex][xIndex - 1]
            } else if direction == "S" && yIndex < h - 1 {
                aheadMass = grid[yIndex + 1][xIndex]
            }
        }

        // omit to loop turn
        if xIndex == initialX && yIndex == initialY && direction == "N" {
            turn = n - (n % turn)
        }
    }

    fmt.Println(strconv.Itoa(xIndex) + " " + strconv.Itoa(yIndex))
}

func contains(slice []string, target string) bool {
    for _, v := range slice {
        if v == target {
            return true
        }
    }

    return false
}

func indexOf(slice []string, target string) int {
    for i, v := range slice {
        if v == target {
            return i
        }
    }

    return -1
}

