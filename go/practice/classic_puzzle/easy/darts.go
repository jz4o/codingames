package main

import "fmt"
import "os"
import "bufio"

import "math"
import "sort"
import "strconv"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Buffer(make([]byte, 1000000), 1000000)

    var SIZE int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&SIZE)

    var N int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&N)

    names := []string{}
    for i := 0; i < N; i++ {
        scanner.Scan()
        name := scanner.Text()
        // _ = name // to avoid unused error

        names = append(names, name)
    }
    var T int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&T)
    throwDatas := []ThrowData{}
    for i := 0; i < T; i++ {
        var throwName string
        var throwX, throwY int
        scanner.Scan()
        fmt.Sscan(scanner.Text(),&throwName, &throwX, &throwY)

        throwDatas = append(throwDatas, ThrowData{throwName, float64(throwX), float64(throwY)})
    }

    halfSize := float64(SIZE / 2)
    scoreBoard := map[string]int{}
    for _, name := range names {
        scoreBoard[name] = 0
    }

    for _, throwData := range throwDatas {
        distanceWithCenter := math.Sqrt(math.Pow(throwData.x, 2) + math.Pow(throwData.y, 2))
        distanceWithEdge := math.Sqrt(math.Pow(halfSize - math.Abs(throwData.x), 2) + math.Pow(halfSize - math.Abs(throwData.y), 2))

        inSquareHorizontal := halfSize * -1 <= throwData.x && throwData.x <= halfSize
        inSquareVertical := halfSize * -1 <= throwData.y && throwData.y <= halfSize

        inSquare := inSquareHorizontal && inSquareVertical
        inCircle := distanceWithCenter <= halfSize
        inDiamond := distanceWithCenter <= distanceWithEdge

        score := 0
        if inDiamond {
            score = 15
        } else if inCircle {
            score = 10
        } else if inSquare {
            score = 5
        }

        scoreBoard[throwData.name] += score
    }

    sortedNames := names
    sort.Slice(sortedNames, func(i, j int) bool {
        a := sortedNames[i]
        b := sortedNames[j]

        switch {
        case scoreBoard[b] < scoreBoard[a]:
            return true
        case scoreBoard[a] < scoreBoard[b]:
            return false
        default:
            return indexOf(names, a) < indexOf(names, b)
        }
    })

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    for _, name := range sortedNames {
        fmt.Println(name + " " + strconv.Itoa(scoreBoard[name]))
    }
}

type ThrowData struct {
    name string
    x float64
    y float64
}

func indexOf(slice []string, target string) int {
    for index, elm := range slice {
        if elm == target {
            return index
        }
    }

    return -1
}

