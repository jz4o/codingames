package main

import "fmt"

import "math"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var level int
    fmt.Scan(&level)

    var xp int
    fmt.Scan(&xp)

    var N int
    fmt.Scan(&N)

    expOfPuzzle := 300

    result := reflectExp(level, expOfPuzzle * N, xp)


    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(result.level)
    fmt.Println(result.expToLevelUp)
}

type BlitzProg struct {
    level int
    expToLevelUp int
}

func reflectExp(currentLevel int, exp int, levelUpExp int) BlitzProg {
    tempExp := exp
    if levelUpExp >= 0 {
        tempExp -= levelUpExp
    } else {
        tempExp -= getExpForLevelUp(currentLevel)
    }

    if tempExp < 0 {
        return BlitzProg{currentLevel, tempExp * -1}
    } else {
        return reflectExp(currentLevel + 1, tempExp, -1)
    }
}

func getExpForLevelUp(currentLevel int) int {
    return (int)(math.Floor((float64)(currentLevel) * math.Sqrt((float64)(currentLevel)) * 10))
}

