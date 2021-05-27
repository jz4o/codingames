package main

import "fmt"

import "strconv"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var N int
    fmt.Scan(&N)

    cells := []Cell{}
    for i := 0; i < N; i++ {
        var operation, arg1, arg2 string
        fmt.Scan(&operation, &arg1, &arg2)

        cells = append(cells, Cell{operation, arg1, arg2, ""})
    }
    for i := 0; i < N; i++ {

        // fmt.Fprintln(os.Stderr, "Debug messages...")
        // fmt.Println("1")// Write answer to stdout
        fmt.Println(getCellValue(cells, i))
    }
}

type Cell struct {
    operation string
    arg1 string
    arg2 string
    value string
}

func getCellValue(cells []Cell, index int) string {
    value := cells[index].value
    if value != "" {
        return value
    } else {
        return calc(cells, index)
    }
}

func getArgValue(cells []Cell, arg string) string {
    if strings.Contains(arg, "$") {
        index, _ := strconv.Atoi(arg[1:])

        return getCellValue(cells, index)
    } else if arg == "_" {
        return "0"
    } else {
        return arg
    }
}

func calc(cells []Cell, index int) string {
    cell := cells[index]
    arg1, _ := strconv.Atoi(getArgValue(cells, cell.arg1))
    arg2, _ := strconv.Atoi(getArgValue(cells, cell.arg2))

    result := 0
    switch cell.operation {
        case "VALUE":
            result = arg1
        case "ADD":
            result = arg1 + arg2
        case "SUB":
            result = arg1 - arg2
        case "MULT":
            result = arg1 * arg2
    }

    cells[index].value = strconv.Itoa(result)

    return cells[index].value
}

