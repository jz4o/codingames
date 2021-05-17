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

    var N int
    scanner.Scan()
    fmt.Sscan(scanner.Text(),&N)

    cgsContents := []string{}
    for i := 0; i < N; i++ {
        scanner.Scan()
        cgsContent := scanner.Text()
        // _ = cgsContent // to avoid unused error

        cgsContents = append(cgsContents, cgsContent)
    }

    variables := map[string]string{}
    characters := []string{}
    replaceChar := 'a'

    replacedCgsContents := []string{}
    for _, cgsContent := range cgsContents {
        // replace variable part
        matchedVariables := regexp.MustCompile("\\$.+?\\$").FindAllString(cgsContent, -1)
        for _, matchedVariable := range matchedVariables {
            if _, exist := variables[matchedVariable]; !exist {
                variables[matchedVariable] = string(replaceChar)
                replaceChar++
            }

            cgsContent = strings.ReplaceAll(cgsContent, matchedVariable, "$" + variables[matchedVariable] + "$")
        }

        // replace character part
        matchedCharacters := regexp.MustCompile("'.+?'").FindAllString(cgsContent, -1)
        for _, matchedCharacter := range matchedCharacters {
            cgsContent = strings.ReplaceAll(cgsContent, matchedCharacter, "$" + strconv.Itoa(len(characters)) + "$")

            characters = append(characters, matchedCharacter)
        }

        cgsContent = strings.ReplaceAll(cgsContent, " ", "")
        replacedCgsContents = append(replacedCgsContents, cgsContent)
    }

    // restore character part
    result := strings.Join(replacedCgsContents, "")
    for index, characters := range characters {
        result = strings.ReplaceAll(result, "$" + strconv.Itoa(index) + "$", characters)
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("minified all CGS content")// Write answer to stdout
    fmt.Println(result)
}

