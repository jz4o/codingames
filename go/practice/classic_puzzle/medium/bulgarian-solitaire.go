package main

import "fmt"
import "os"
import "bufio"
import "strings"
import "strconv"

import "sort"

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
    piles := []int{}
    for i := 0; i < N; i++ {
        C,_ := strconv.ParseInt(inputs[i],10,32)
        // _ = C

        piles = append(piles, int(C))
    }

    for i := len(piles) - 1; i >= 0; i-- {
        if piles[i] == 0 {
            piles = append(piles[0:i], piles[i+1:]...)
        }
    }

    sameConfigurationIndex := 0
    configurations := []string{}

    for {
        sort.Sort(sort.IntSlice(piles))
        strPiles := []string{}
        for _, pile := range piles {
            strPiles = append(strPiles, strconv.Itoa(pile))
        }
        configurations = append(configurations, strings.Join(strPiles, " "))

        pilesSize := len(piles)
        for i := 0; i < len(piles); i++ {
            piles[i]--
        }
        for i := len(piles) - 1; i >= 0; i-- {
            if piles[i] == 0 {
                piles = append(piles[0:i], piles[i+1:]...)
            }
        }
        piles = append(piles, pilesSize)

        sort.Sort(sort.IntSlice(piles))
        strPiles = nil
        for _, pile := range piles {
            strPiles = append(strPiles, strconv.Itoa(pile))
        }
        configuration := strings.Join(strPiles, " ")

        if contains(configurations, configuration) {
            sameConfigurationIndex = indexOf(configurations, configuration)
            break
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("1")// Write answer to stdout
    fmt.Println(len(configurations) - sameConfigurationIndex)
}

func indexOf(slice []string, target string) int {
    for index, elm := range slice {
        if elm == target {
            return index
        }
    }

    return -1
}

func contains(slice []string, target string) bool {
    return indexOf(slice, target) >= 0
}

