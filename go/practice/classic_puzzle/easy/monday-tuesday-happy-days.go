package main

import "fmt"

import "math"
import "strconv"
import "time"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var leapYear int
    fmt.Scan(&leapYear)

    var sourceDayOfWeek, sourceMonth string
    var sourceDayOfMonth int
    fmt.Scan(&sourceDayOfWeek, &sourceMonth, &sourceDayOfMonth)

    var targetMonth string
    var targetDayOfMonth int
    fmt.Scan(&targetMonth, &targetDayOfMonth)

    dayOfWeek := []string {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"}

    // year is 2001 if leap is 0
    // year is 2000 if leap is 1
    year := leapYear * -1 + 1 + 2000

    layout := "2006 Jan 2"
    targetDateStr := strconv.Itoa(year) + " " + targetMonth + " " + strconv.Itoa(targetDayOfMonth)
    targetDate, _ := time.Parse(layout, targetDateStr)
    sourceDateStr := strconv.Itoa(year) + " " + sourceMonth + " " + strconv.Itoa(sourceDayOfMonth)
    sourceDate, _ := time.Parse(layout, sourceDateStr)

    days := int(targetDate.Sub(sourceDate).Hours() / 24)
    sourceDayOfWeekIndex := indexOf(dayOfWeek, sourceDayOfWeek)
    targetDayOfWeekIndex := (sourceDayOfWeekIndex + days + (int(math.Abs(float64(days))) * len(dayOfWeek))) % len(dayOfWeek)

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("day of week")// Write answer to stdout
    fmt.Println(dayOfWeek[targetDayOfWeekIndex])
}

func indexOf(slice []string, target string) int {
    for i, v := range slice {
        if v == target {
            return i
        }
    }

    return -1
}

