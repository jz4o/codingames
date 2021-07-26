package main

import "fmt"

import "regexp"
import "strconv"
import "strings"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var n int
    fmt.Scan(&n)

    numbers := []string{}
    for i := 0; i < n; i++ {
        var x string
        fmt.Scan(&x)

        numbers = append(numbers, x)
    }

    results := []string{}
    for _, number := range numbers {
        results = append(results, howToRead(number))
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("cardinal")// Write answer to stdout
    for _, result := range results {
        fmt.Println(result)
    }
}

func howToRead(numberStr string) string {
    if (string)(numberStr[0]) == "-" {
        return "negative " + howToRead(numberStr[1:])
    }

    if len(numberStr) >= 4 {
        overThousandUnitNames := []string{"", "thousand", "million", "billion", "trillion", "quadrillion", "quintillion"}

        numberSize := len(numberStr)
        unitNumberSize := numberSize % 3
        if unitNumberSize == 0 {
            unitNumberSize = 3
        }
        modNumberSize := numberSize - unitNumberSize

        unitNumber := numberStr[:unitNumberSize]
        modNumber := numberStr[unitNumberSize:]

        result := ""
        result += howToRead(unitNumber) + " " + overThousandUnitNames[modNumberSize / 3]
        if !regexp.MustCompile("^0+$").MatchString(modNumber) {
            result += " " + howToRead(modNumber)
        }

        return result
    }

    result := ""
    number, _ := strconv.Atoi(numberStr)
    if number >= 100 {
        hundredUnit := number / 100
        modUnit := number % 100

        if hundredUnit > 0 {
            result += howToRead(strconv.Itoa(hundredUnit)) + " hundred"
        }
        if modUnit > 0 {
            result += " " + howToRead(strconv.Itoa(modUnit))
        }
    } else if number >= 20 {
        tenUnitNames := []string{"", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"}
        tenUnit := number / 10
        modUnit := number % 10

        if tenUnit > 0 {
            result += tenUnitNames[tenUnit]
        }
        if modUnit > 0 {
            result += "-" + howToRead(strconv.Itoa(modUnit))
        }
    } else {
        underTwetyNames := []string{
            "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
            "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"}

        result = underTwetyNames[number]
    }

    return strings.TrimSpace(result)
}
