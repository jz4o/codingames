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

    var w, h, countX, countY int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&w, &h, &countX, &countY)

    scanner.Scan()
    inputs := strings.Split(scanner.Text()," ")
    widthMeasurements := []int{0}
    for i := 0; i < countX; i++ {
        x,_ := strconv.ParseInt(inputs[i],10,32)
        _ = x

        widthMeasurements = append(widthMeasurements, (int)(x))
    }
    widthMeasurements = append(widthMeasurements, w)
    scanner.Scan()
    inputs = strings.Split(scanner.Text()," ")
    heightMeasurements := []int{0}
    for i := 0; i < countY; i++ {
        y,_ := strconv.ParseInt(inputs[i],10,32)
        _ = y

        heightMeasurements = append(heightMeasurements, (int)(y))
    }
    heightMeasurements = append(heightMeasurements, h)

    widthCounts := map[int]int{}
    for index := 0; index < len(widthMeasurements); index++ {
        for i := 0; i < index; i++ {
            width := widthMeasurements[index] - widthMeasurements[i]
            if _, exist := widthCounts[width]; !exist {
                widthCounts[width] = 0
            }

            widthCounts[width]++
        }
    }

    heightCounts := map[int]int{}
    for index := 0; index < len(heightMeasurements); index++ {
        for i := 0; i < index; i++ {
            height := heightMeasurements[index] - heightMeasurements[i]
            if _, exist := heightCounts[height]; !exist {
                heightCounts[height] = 0
            }

            heightCounts[height]++
        }
    }

    result := 0
    for k, _ := range widthCounts {
        if _, exist := heightCounts[k]; exist {
            result += widthCounts[k] * heightCounts[k]
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("0")// Write answer to stdout
    fmt.Println(result)
}
