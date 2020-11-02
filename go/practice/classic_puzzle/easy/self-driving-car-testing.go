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

    var N int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&N)

    scanner.Scan()
    xthenCommands := scanner.Text()
    var rthenRoadpatterns []string
    for i := 0; i < N; i++ {
        scanner.Scan()
        rthenRoadpattern := scanner.Text()

        rthenRoadpatterns = append(rthenRoadpatterns, rthenRoadpattern)
    }


    commands := strings.Split(xthenCommands, ";")
    position, _ := strconv.Atoi(commands[0])
    commands = commands[1:]

    var commandChars []string
    for _, command := range commands {
        amount, _ := strconv.Atoi(command[:len(command) - 1])
        comm := (string)(command[len(command) - 1])

        for i := 0; i < amount; i++ {
            commandChars = append(commandChars, comm)
        }
    }


    var results []string
    for _, rthenRoadpattern := range rthenRoadpatterns {
        rthenRoadpatternElements := strings.Split(rthenRoadpattern, ";")
        count, _ := strconv.Atoi(rthenRoadpatternElements[0])
        pattern := rthenRoadpatternElements[1]

        for i := 0; i < count; i++ {
            command := commandChars[0]
            commandChars = commandChars[1:]

            switch(command) {
                case "L":
                    position--
                case "R":
                    position++
            }

            result := pattern[:position - 1] + "#" + pattern[position:]
            results = append(results, result)
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    for _, result := range results {
        fmt.Println(result)
    }
}

