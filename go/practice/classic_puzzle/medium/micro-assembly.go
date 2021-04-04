package main

import "fmt"
import "os"
import "bufio"

import "regexp"
import "strconv"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    var a, b, c, d int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&a, &b, &c, &d)

    var n int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&n)

    instructions := []string{}
    for i := 0; i < n; i++ {
        scanner.Scan()
        instruction := scanner.Text()
        // _ = instruction // to avoid unused error

        instructions = append(instructions, instruction)
    }

    registers := map[string]int{ "a": a, "b": b, "c": c, "d": d }

    i := 0
    for i < n {
        instructionElements := strings.Split(instructions[i], " ")
        operator := instructionElements[0]
        arg1 := instructionElements[1]
        var arg2 int
        if regexp.MustCompile("[a-d]").MatchString(instructionElements[2]) {
            arg2 = registers[instructionElements[2]]
        } else {
            arg2, _ = strconv.Atoi(instructionElements[2])
        }

        var arg3 int
        if len(instructionElements) >= 4 {
            if regexp.MustCompile("[a-d]").MatchString(instructionElements[3]) {
                arg3 = registers[instructionElements[3]]
            } else {
                arg3, _ = strconv.Atoi(instructionElements[3])
            }
        }

        switch operator {
            case "MOV":
                registers[arg1] = arg2
            case "ADD":
                registers[arg1] = arg2 + arg3
            case "SUB":
                registers[arg1] = arg2 - arg3
            case "JNE":
                if arg2 != arg3 {
                    i, _ = strconv.Atoi(arg1)
                    continue
                }
        }

        i++
    }

    result := strings.Join([]string{
        strconv.Itoa(registers["a"]),
        strconv.Itoa(registers["b"]),
        strconv.Itoa(registers["c"]),
        strconv.Itoa(registers["d"]),
    }, " ")

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("a b c d")// Write answer to stdout
    fmt.Println(result)
}

