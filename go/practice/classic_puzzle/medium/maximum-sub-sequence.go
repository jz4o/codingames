package main

import "fmt"
import "os"
import "bufio"
import "strings"
import "strconv"

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
    inputs := strings.Split(scanner.Text()," ")
    intInputs := []int{}
    for i := 0; i < N; i++ {
        l,_ := strconv.ParseInt(inputs[i],10,32)
        // _ = l

        intInputs = append(intInputs, int(l))
    }

    lists := [][]int{}
    for _, i := range intInputs {
        for index, _ := range lists {
            list := lists[index]

            last := list[len(list) - 1]
            if len(list) > 0 && last == i - 1 {
                lists[index] = append(lists[index], i)
            }
        }

        newList := []int{ i }
        lists = append(lists, newList)
    }

    maxSize := 0
    intResult := []int{}
    for _, list := range lists {

        if len(list) >= maxSize {
            maxSize = len(list)
            intResult = list
        }
    }

    strResult := []string{}
    for _, i := range intResult {
        strResult = append(strResult, strconv.Itoa(i))
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("1 2 3 4 5")// Write answer to stdout
    fmt.Println(strings.Join(strResult, " "))
}

