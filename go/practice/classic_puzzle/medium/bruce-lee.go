package main

import "fmt"
import "os"
import "bufio"

import "regexp"
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
    ENCRYPT := scanner.Text()
    _ = ENCRYPT // to avoid unused error

    binaries := []string{}
    validFlag := true
    encryptElements := strings.Split(ENCRYPT, " ")
    for i := 0; i < len(encryptElements); i += 2 {
        binary := encryptElements[i]
        count := 0
        if i < len(encryptElements) - 1 {
            count = len(encryptElements[i + 1])
        }

        if !regexp.MustCompile("^0{1,2}$").MatchString(binary) || count == 0 {
            validFlag = false
            break
        }

        newBinary := "0"
        if binary == "0" {
            newBinary = "1"
        }
        binaries = append(binaries, strings.Repeat(newBinary, count))
    }

    binariesStr := strings.Join(binaries, "")
    result := ""
    if validFlag && len(binariesStr) % 7 == 0 {
        for _, binary := range regexp.MustCompile(".{7}").FindAllString(binariesStr, -1) {
            decimal, _ := strconv.ParseInt(binary, 2, 64)
            result += string(rune(decimal))
        }
    } else {
        result = "INVALID"
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("INVALID")// Write answer to stdout
    fmt.Println(result)
}

