package main

import "os"
import "bufio"

import "fmt"
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
    s := scanner.Text()
    // _ = s // to avoid unused error

    result := s
    for isEncodable(result) {
        result = encode(result)
    }

    fmt.Println(result)
}

func isEncodable(origin string) bool {
    encoded := encode(origin)

    return encoded != "" && origin != encoded
}

func encode(origin string) string {
    if len(origin) % 2 == 1 {
        return ""
    }

    encoded := ""
    for i := 0; i < len(origin); i += 2 {
        count, _ := strconv.Atoi(string(origin[i]))
        encoded += strings.Repeat(string(origin[i + 1]), count)
    }

    result := ""
    if isDecodable(encoded, origin) {
        result = encoded
    }

    return result
}

func isDecodable(encoded string, origin string) bool {
    decoded := ""

    temp := encoded
    for len(temp) > 0 {
        firstChar := string(temp[0])

        matched := regexp.MustCompile("^" + firstChar + "+").FindString(temp)
        temp = strings.Replace(temp, matched, "", 1)

        decoded += strconv.Itoa(len(matched)) + firstChar
    }

    return decoded == origin
}

