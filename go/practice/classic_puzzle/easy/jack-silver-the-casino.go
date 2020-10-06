package main

import "fmt"
import "os"
import "bufio"

import "math"
import "strconv"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    var ROUNDS int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&ROUNDS)

    var CASH int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&CASH)

    var plays []string
    for i := 0; i < ROUNDS; i++ {
        scanner.Scan()
        PLAY := scanner.Text()

        plays = append(plays, PLAY)
    }

    result := CASH
    for _, play := range plays {
        bet := (int)(math.Ceil((float64)(result) / 4))
        result -= bet

        playSlice := strings.Split(play, " ")
        ball, _ := strconv.Atoi(playSlice[0])
        call := playSlice[1]
        num := -1
        if len(playSlice) >= 3 {
            num, _ = strconv.Atoi(playSlice[2])
        }

        if call == "PLAIN" && ball == num {
            result += bet * 36
        } else if call == "ODD" && ball % 2 == 1 {
            result += bet * 2
        } else if call == "EVEN" && ball % 2 == 0 && ball > 0 {
            result += bet * 2
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("cash of the target after playing")// Write answer to stdout
    fmt.Println(result)
}

