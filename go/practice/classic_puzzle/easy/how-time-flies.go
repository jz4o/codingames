package main

import "fmt"

import "strconv"
import "strings"
import "time"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var BEGIN string
    fmt.Scan(&BEGIN)

    var END string
    fmt.Scan(&END)

    dateFormat := "02.01.2006"
    beginDate, _ := time.Parse(dateFormat, BEGIN)
    endDate, _ := time.Parse(dateFormat, END)

    year := endDate.Year() - beginDate.Year()
    if (endDate.Month() < beginDate.Month()) || (beginDate.Month() == endDate.Month() && endDate.Day() < beginDate.Day()) {
        year--
    }

    month := int(12 + endDate.Month() - beginDate.Month()) % 12
    if endDate.Day() < beginDate.Day() {
        month--
    }

    days := int(endDate.Sub(beginDate).Hours() / 24)

    var formattedYear = ""
    if year == 1 {
        formattedYear = "1 year"
    } else if year > 1 {
        formattedYear = strconv.Itoa(year) + " years"
    }

    var formattedMonth = ""
    if month == 1 {
        formattedMonth = "1 month"
    } else if month > 1 {
        formattedMonth = strconv.Itoa(month) + " months"
    }

    formattedDays := "total " + strconv.Itoa(days) + " days"

    var dateElements []string
    for _, elem := range []string { formattedYear, formattedMonth, formattedDays } {
        if elem != "" {
            dateElements = append(dateElements, elem)
        }
    }

    result := strings.Join(dateElements, ", ")

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("YY year[s], MM month[s], total NN days")// Write answer to stdout
    fmt.Println(result)
}

