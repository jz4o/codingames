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

    var LON string
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&LON)

    var LAT string
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&LAT)

    var N int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&N)

    var defibs []Defib
    for i := 0; i < N; i++ {
        scanner.Scan()
        DEFIB := scanner.Text()

        defibElements := strings.Split(DEFIB, ";")

        longitude, _ := strconv.ParseFloat(strings.Replace(defibElements[4], ",", ".", -1), 64)
        latitude, _ := strconv.ParseFloat(strings.Replace(defibElements[5], ",", ".", -1), 64)

        defib := Defib{
            defibElements[0],
            defibElements[1],
            defibElements[2],
            defibElements[3],
            longitude,
            latitude}

        defibs = append(defibs, defib)
    }

    floatLat, _ := strconv.ParseFloat(strings.Replace(LAT, ",", ".", -1), 64)
    floatLon, _ := strconv.ParseFloat(strings.Replace(LON, ",", ".", -1), 64)

    nearDefib := defibs[0]
    distance := 10000.0
    for _, defib := range defibs {
        x := (floatLon - defib.longitude) * math.Cos((defib.latitude + floatLat) / 2)
        y := floatLat - defib.latitude
        d := math.Sqrt(x * x + y * y) * 6371

        if d < distance {
            distance = d
            nearDefib = defib
        }
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("answer")// Write answer to stdout
    fmt.Println(nearDefib.name)
}

type Defib struct {
    id string
    name string
    address string
    phone string
    longitude float64
    latitude float64
}

