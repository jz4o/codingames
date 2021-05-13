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

    scanner.Scan()
    opBowls := scanner.Text()
    // _ = opBowls // to avoid unused error
    scanner.Scan()
    myBowls := scanner.Text()
    // _ = myBowls // to avoid unused error
    var num int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&num)

    bowlsSize := 7
    reserveIndex := bowlsSize - 1
    playerSize := 2
    playerIndexOpp := 0
    playerIndexMy := 1

    opBowlsSlice := []int{}
    for _, c := range strings.Split(opBowls, " ") {
        d, _ := strconv.Atoi(c)
        opBowlsSlice = append(opBowlsSlice, d)
    }
    myBowlsSlice := []int{}
    for _, c := range strings.Split(myBowls, " ") {
        d, _ := strconv.Atoi(c)
        myBowlsSlice = append(myBowlsSlice, d)
    }

    seeds := myBowlsSlice[num]
    myBowlsSlice[num] = 0
    index := num + 1
    for seeds > 0 {
        playerIndex := ((index / bowlsSize) % playerSize - 1) * -1
        columnIndex := index % bowlsSize

        // is enemyStore
        if playerIndex == playerIndexOpp && columnIndex == reserveIndex {
            index++
            continue
        }

        switch playerIndex {
            case playerIndexOpp:
                opBowlsSlice[columnIndex]++
            case playerIndexMy:
                myBowlsSlice[columnIndex]++
        }

        index++
        seeds--
    }

    resultOppElements := []string{}
    for _, b := range opBowlsSlice[:len(opBowlsSlice) -1]  {
        resultOppElements = append(resultOppElements, strconv.Itoa(b))
    }
    resultOppElements = append(resultOppElements, "[" + strconv.Itoa(opBowlsSlice[len(opBowlsSlice)-1]) + "]")

    resultMyElements := []string{}
    for _, b := range myBowlsSlice[:len(myBowlsSlice) - 1] {
        resultMyElements = append(resultMyElements, strconv.Itoa(b))
    }
    resultMyElements = append(resultMyElements, "[" + strconv.Itoa(myBowlsSlice[len(myBowlsSlice)-1]) + "]")

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(strings.Join(resultOppElements, " "))
    fmt.Println(strings.Join(resultMyElements, " "))
    if index % bowlsSize == 0 {
        fmt.Println("REPLAY")
    }
}

